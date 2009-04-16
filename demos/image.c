/*
 * Copyright (C) 2009 Emmanuel Rodriguez <emmanuel.rodriguez@gmail.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

#include <champlain/champlain.h>
#include <libsoup/soup.h>
#include <gdk-pixbuf/gdk-pixbuf.h>


/**
 * Returns a GdkPixbuf from a given SoupMessage. This function assumes that the
 * message as completed successfully.
 * If there's an error building the GdkPixbuf the function will return NULL and
 * set error accordingly.
 */
static GdkPixbuf*
messge_to_pixbuf (SoupMessage *message, GError **error)
{
	const gchar *mime_type = NULL;
	GdkPixbufLoader *loader = NULL;
	GdkPixbuf *pixbuf = NULL;

	error = NULL;

	/*  Use a pixbuf loader that can load images of the same mime-type as the
	    message.
	*/
	mime_type = soup_message_headers_get (message->response_headers, "Content-Type");
	loader = gdk_pixbuf_loader_new_with_mime_type (mime_type, error);
	if (error) {
		if (loader) {gdk_pixbuf_loader_close (loader, NULL);}
		goto cleanup;
	}

	gdk_pixbuf_loader_write (
		loader, 
		message->response_body->data,
		message->response_body->length, 
		error);
	if (error) {
		gdk_pixbuf_loader_close (loader, NULL);
		goto cleanup;
	}

	gdk_pixbuf_loader_close (loader, error);
	if (error) {
		goto cleanup;
	}

	pixbuf = gdk_pixbuf_loader_get_pixbuf (loader);
	if (pixbuf == NULL) {
		goto cleanup;
	}

	/* Cleanup part, the function will always exit here even in case of error */
	cleanup:
		if (loader) {g_object_unref (G_OBJECT (loader));}
	return pixbuf;
}


/**
 * Transforms a GdkPixbuf into a ClutterTexture.
 * If there's an error building the ClutterActor (the texture) the function will
 * return NULL and set error accordingly.
 */
static ClutterActor*
pixbuf_to_texture (GdkPixbuf *pixbuf, GError **error)
{
	ClutterActor *texture = NULL;
	const guchar *data;
	gboolean has_alpha, success;
	int width, height, rowstride;
	ClutterTextureFlags flags = 0;

	error = NULL;

	data = gdk_pixbuf_get_pixels (pixbuf);
	width = gdk_pixbuf_get_width (pixbuf);
	height = gdk_pixbuf_get_height (pixbuf);
	has_alpha = gdk_pixbuf_get_has_alpha (pixbuf);
	rowstride = gdk_pixbuf_get_rowstride (pixbuf);

	texture = clutter_texture_new ();
	success = clutter_texture_set_from_rgb_data (CLUTTER_TEXTURE (texture),
		data,
		has_alpha,
		width,
		height,
		rowstride,
		(has_alpha ? 4 : 3),
		flags,
		error);
	if (! success) {
		clutter_actor_destroy (CLUTTER_ACTOR (texture));
		texture = NULL;
	}

	return texture;
}


/**
 * Called when an image has been downloaded. This callback will transform the
 * image data (binary chunk sent by the remote web server) into a valid Clutter
 * actor (a texture) and will use this as the source image for a new marker. The
 * marker will then be added to an existing layer.
 *
 * This callback expects the parameter data to be a valid ChamplainLayer.
 */
static void
image_downloaded_cb (SoupSession *session,
                     SoupMessage *message,
										 gpointer data)
{
  ChamplainLayer *layer = NULL;
	SoupURI *uri = NULL;
	char *url = NULL;
	GError *error = NULL;
	GdkPixbuf *pixbuf = NULL;
	ClutterActor *texture = NULL;
	ClutterActor *marker = NULL;

	if (data == NULL) {
		goto cleanup;
	}
	
	/* Deal only with finished messages */
	uri = soup_message_get_uri (message);
	url = soup_uri_to_string (uri, FALSE);
	if (! SOUP_STATUS_IS_SUCCESSFUL(message->status_code)) {
		g_print ("Download of %s failed with error code %d\n", url, message->status_code);
		goto cleanup;
	}

	pixbuf = messge_to_pixbuf (message, &error);
	if (error) {
		g_print ("Failed to convert %s into an image: %s\n", url, error->message);
		goto cleanup;
	}

	/* Then transform the pixbuf into a texture */
	texture = pixbuf_to_texture (pixbuf, &error);
	if (error) {
		g_print ("Failed to convert %s into a texture %s: %s\n", url, error->message);
		goto cleanup;
	}

	/* Finally create a marker with the texture */
	layer = CHAMPLAIN_LAYER (data);
	marker = champlain_marker_new_with_image (texture);
	texture = NULL;
  champlain_base_marker_set_position (CHAMPLAIN_BASE_MARKER (marker), 45.466, -73.75);
  clutter_container_add (CLUTTER_CONTAINER (layer), marker, NULL);
	clutter_actor_show_all (marker);

	/* Cleanup part, the function will always exit here even in case of error */
	cleanup:
		g_free (url);
		if (texture) {clutter_actor_destroy (CLUTTER_ACTOR (texture));}
		return;
}


static void
create_marker_from_url (ChamplainLayer *layer,
                        SoupSession *session,
                        const gchar *url)
{
  SoupMessage *message;
	
	message = soup_message_new ("GET", url);
	soup_session_queue_message (session, message, image_downloaded_cb, layer);
	g_print ("Downloading %s\n",  url);
}


int
main (int argc, char *argv[])
{
  ClutterActor* actor, *stage;
  ChamplainLayer *layer;
	SoupSession *session;

  g_thread_init (NULL);
  clutter_init (&argc, &argv);

  stage = clutter_stage_get_default ();
  clutter_actor_set_size (stage, 800, 600);

  /* Create the map view */
  actor = champlain_view_new ();
  champlain_view_set_size (CHAMPLAIN_VIEW (actor), 800, 600);
  clutter_container_add_actor (CLUTTER_CONTAINER (stage), actor);

  /* Create the markers and marker layer */
  layer = champlain_layer_new ();
  champlain_view_add_layer (CHAMPLAIN_VIEW (actor), layer);
	session = soup_session_async_new ();
	create_marker_from_url (layer, session, "http://hexten.net/cpan-faces/potyl.jpg");

  /* Finish initialising the map view */
  g_object_set (G_OBJECT (actor), "zoom-level", 12,
      "scroll-mode", CHAMPLAIN_SCROLL_MODE_KINETIC, NULL);
  champlain_view_center_on (CHAMPLAIN_VIEW(actor), 45.466, -73.75);

  clutter_actor_show (stage);
  clutter_main ();
	
	g_object_unref (session);

  return 0;
}
