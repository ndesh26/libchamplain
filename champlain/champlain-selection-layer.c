/*
 * Copyright (C) 2009 Pierre-Luc Beaudoin <pierre-luc@pierlux.com>
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

/**
 * SECTION:champlain-selection-layer
 * @short_description: A container for #ChamplainMarker supporting selection
 *
 * A ChamplainSelectionLayer is little more than a #ChamplainLayer. The markers
 * can be selected.
 *
 * Use #clutter_container_add to add markers to the layer and
 * #clutter_container_remove to remove them.
 */

#include "config.h"

#define DEBUG_FLAG CHAMPLAIN_DEBUG_SELECTION
#include "champlain-debug.h"

#include "champlain-selection-layer.h"

#include "champlain-defines.h"
#include "champlain-base-marker.h"
#include "champlain-enum-types.h"

#include <clutter/clutter.h>
#include <glib.h>

G_DEFINE_TYPE (ChamplainSelectionLayer, champlain_selection_layer, CHAMPLAIN_TYPE_LAYER)

#define GET_PRIVATE(o) \
  (G_TYPE_INSTANCE_GET_PRIVATE ((o), CHAMPLAIN_TYPE_SELECTION_LAYER, ChamplainSelectionLayerPrivate))

enum
{
  PROP_0,
  PROP_SELECTION_MODE
};

struct _ChamplainSelectionLayerPrivate {
  ChamplainSelectionMode mode;
  GList *selection;
};

static void
champlain_selection_layer_get_property (GObject *object,
    guint property_id,
    GValue *value,
    GParamSpec *pspec)
{
  ChamplainSelectionLayer *self = CHAMPLAIN_SELECTION_LAYER (object);
  ChamplainSelectionLayerPrivate *priv = self->priv;

  switch (property_id)
    {
      case PROP_SELECTION_MODE:
        g_value_set_enum (value, priv->mode);
        break;
      default:
        G_OBJECT_WARN_INVALID_PROPERTY_ID (object, property_id, pspec);
    }
}

static void
champlain_selection_layer_set_property (GObject *object,
    guint property_id,
    const GValue *value,
    GParamSpec *pspec)
{
  ChamplainSelectionLayer *self = CHAMPLAIN_SELECTION_LAYER (object);

  switch (property_id)
    {
      case PROP_SELECTION_MODE:
        champlain_selection_layer_set_selection_mode (self, g_value_get_enum (value));
        break;
      default:
        G_OBJECT_WARN_INVALID_PROPERTY_ID (object, property_id, pspec);
    }
}

static void
champlain_selection_layer_class_init (ChamplainSelectionLayerClass *klass)
{
  GObjectClass *object_class = G_OBJECT_CLASS (klass);

  g_type_class_add_private (klass, sizeof (ChamplainSelectionLayerPrivate));

  object_class->get_property = champlain_selection_layer_get_property;
  object_class->set_property = champlain_selection_layer_set_property;

  /**
  * ChamplainView:selection-mode:
  *
  * Determines the type of selection that will be performed.
  *
  * Since: 0.4
  */
  g_object_class_install_property (object_class,
      PROP_SELECTION_MODE,
      g_param_spec_enum ("selection-mode",
           "Selection Mode",
           "Determines the type of selection that will be performed.",
           CHAMPLAIN_TYPE_SELECTION_MODE,
           CHAMPLAIN_SELECTION_MULTIPLE,
           CHAMPLAIN_PARAM_READWRITE));
}

static void
real_select (ChamplainSelectionLayer *layer,
    ChamplainBaseMarker *marker,
    gboolean append)
{
  DEBUG ("Select %p", marker);

  if (layer->priv->mode == CHAMPLAIN_SELECTION_SINGLE)
    {
      /* Clear previous selection */
      champlain_selection_layer_unselect_all (layer);

      /* Add selection */
      g_object_ref (marker);
      g_object_set (marker, "highlighted", TRUE, NULL);
      layer->priv->selection = g_list_prepend (layer->priv->selection, marker);
    }
  else if (layer->priv->mode == CHAMPLAIN_SELECTION_MULTIPLE)
    {
      /* Clear previous selection */
      gboolean was_selected =
        champlain_selection_layer_marker_is_selected (layer, marker);

      if (!append)
        champlain_selection_layer_unselect_all (layer);

      if (was_selected)
        {
          champlain_selection_layer_unselect (layer, marker);
        }
      else
        {
          g_object_ref (marker);
          g_object_set (marker, "highlighted", TRUE, NULL);
          layer->priv->selection = g_list_append (layer->priv->selection, marker);
        }
    }
}

static gboolean
marker_clicked_cb (ClutterActor *actor,
    ClutterButtonEvent *event,
    gpointer user_data)
{

  real_select (CHAMPLAIN_SELECTION_LAYER (user_data),
      CHAMPLAIN_BASE_MARKER (actor), (event->modifier_state & CLUTTER_CONTROL_MASK));

  return FALSE;
}

static void
layer_add_cb (ClutterGroup *layer,
    ClutterActor *actor,
    gpointer data)
{
  ChamplainBaseMarker *marker = CHAMPLAIN_BASE_MARKER (actor);

  clutter_actor_set_reactive (actor, TRUE);

  g_signal_connect (G_OBJECT (marker), "button-release-event",
      G_CALLBACK (marker_clicked_cb), layer);
}

static void
layer_remove_cb (ClutterGroup *layer,
    ClutterActor *actor,
    gpointer data)
{
  g_signal_handlers_disconnect_by_func (G_OBJECT (actor),
      G_CALLBACK (marker_clicked_cb), layer);
}

static void
champlain_selection_layer_init (ChamplainSelectionLayer *self)
{
  self->priv = GET_PRIVATE (self);
  self->priv->mode = CHAMPLAIN_SELECTION_MULTIPLE;
  self->priv->selection = NULL;

  g_signal_connect_after (G_OBJECT (self), "actor-added",
      G_CALLBACK (layer_add_cb), NULL);
  g_signal_connect_after (G_OBJECT (self), "actor-removed",
      G_CALLBACK (layer_remove_cb), NULL);
}

/**
 * champlain_selection_layer_new:
 *
 * Returns a new #ChamplainSelectionLayer ready to be used as a #ClutterContainer for the markers.
 *
 * Since: 0.4
 */
ChamplainLayer *
champlain_selection_layer_new ()
{
  return g_object_new (CHAMPLAIN_TYPE_SELECTION_LAYER, NULL);
}

/**
 * champlain_selection_get_selected:
 *
 * This function will return NULL if in CHAMPLAIN_SELETION_MULTIPLE.
 *
 * Returns the selected #ChamplainBaseMarker or NULL if none is selected.
 *
 * Since: 0.4
 */
ChamplainBaseMarker *
champlain_selection_layer_get_selected (ChamplainSelectionLayer *layer)
{
  if (layer->priv->mode == CHAMPLAIN_SELECTION_SINGLE &&
      layer->priv->selection != NULL)
    {
      return layer->priv->selection->data;
    }

  return NULL;
}

/**
 * champlain_selection_get_selected_markers:
 *
 * Returns the list of selected #ChamplainBaseMarker or NULL if none is selected.
 * You shouldn't free that list.
 *
 * Since: 0.4
 */
const GList *
champlain_selection_layer_get_selected_markers (ChamplainSelectionLayer *layer)
{
  return layer->priv->selection;
}

/**
 * champlain_selection_layer_count_selected_markers:
 *
 * Returns the number of selected #ChamplainBaseMarker
 *
 * Since: 0.4
 */
guint
champlain_selection_layer_count_selected_markers (ChamplainSelectionLayer *layer)
{
  return g_list_length (layer->priv->selection);
}

void 
champlain_selection_layer_select (ChamplainSelectionLayer *layer,
    ChamplainBaseMarker *marker)
{
  real_select (layer, marker, TRUE);
}

void
champlain_selection_layer_unselect_all (ChamplainSelectionLayer *layer)
{
  GList *selection = layer->priv->selection;

  DEBUG ("Deselect all");
  while (selection != NULL)
    {
      g_object_set (selection->data, "highlighted", FALSE, NULL);
      g_object_unref (selection->data);
      selection = g_list_delete_link (selection, selection);
    }
  layer->priv->selection = selection;
}

void
champlain_selection_layer_unselect (ChamplainSelectionLayer *layer,
    ChamplainBaseMarker *marker)
{
  GList *selection;

  DEBUG ("Deselect %p", marker);
  selection = g_list_find (layer->priv->selection, marker);
  if (selection != NULL)
    {
      g_object_set (selection->data, "highlighted", FALSE, NULL);
      g_object_unref (selection->data);
      layer->priv->selection = g_list_delete_link (layer->priv->selection, selection);
    }
}

gboolean
champlain_selection_layer_marker_is_selected (ChamplainSelectionLayer *layer,
    ChamplainBaseMarker *marker)
{
  GList *selection;

  selection = g_list_find (layer->priv->selection, marker);
  return selection != NULL;
}

/**
* champlain_selection_layer_set_selection_mode:
* @layer: a #ChamplainSelectionLayer
* @mode: a #ChamplainSelectionMode value
*
* Sets the selection mode of the layer.
*
* Since: 0.4
*/
void
champlain_selection_layer_set_selection_mode (ChamplainSelectionLayer *layer,
    ChamplainSelectionMode mode)
{
  g_return_if_fail (CHAMPLAIN_IS_SELECTION_LAYER (layer));
  layer->priv->mode = mode;

  g_object_notify (G_OBJECT (layer), "selection-mode");
}

/**
* champlain_selection_layer_get_selection_mode:
* @layer: a #ChamplainSelectionLayer
*
* REturns the selection mode of the layer.
*
* Since: 0.4
*/
ChamplainSelectionMode
champlain_selection_layer_get_selection_mode (ChamplainSelectionLayer *layer)
{
  g_return_val_if_fail (
      CHAMPLAIN_IS_SELECTION_LAYER (layer),
      CHAMPLAIN_SELECTION_MULTIPLE);
  return layer->priv->mode;
}
