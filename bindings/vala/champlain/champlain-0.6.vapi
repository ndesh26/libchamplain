/* champlain-0.6.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "Champlain", lower_case_cprefix = "champlain_")]
namespace Champlain {
	[CCode (cheader_filename = "champlain/champlain.h")]
	public class BaseMarker : Clutter.Group, Clutter.Scriptable, Clutter.Container {
		[CCode (type = "ClutterActor*", has_construct_function = false)]
		public BaseMarker ();
		public void animate_in ();
		public void animate_in_with_delay (uint delay);
		public void animate_out ();
		public void animate_out_with_delay (uint delay);
		public bool get_highlighted ();
		public void set_highlighted (bool value);
		public void set_position (double longitude, double latitude);
		public bool highlighted { get; set; }
		[NoAccessorMethod]
		public double latitude { get; set; }
		[NoAccessorMethod]
		public double longitude { get; set; }
	}
	[CCode (cheader_filename = "champlain/champlain.h")]
	public class Cache : GLib.Object {
		public static unowned Champlain.Cache dup_default ();
		public bool fill_tile (Champlain.Tile tile);
		public uint get_size_limit ();
		public void purge ();
		public void purge_on_idle ();
		public void set_size_limit (uint size_limit);
		public bool tile_is_expired (Champlain.Tile tile);
		public void update_tile (Champlain.Tile tile, uint filesize);
		public uint size_limit { get; set; }
	}
	[CCode (cheader_filename = "champlain/champlain.h")]
	public class Layer : Clutter.Group, Clutter.Scriptable, Clutter.Container {
		[CCode (has_construct_function = false)]
		public Layer ();
		public void add_marker (Champlain.BaseMarker marker);
		public void animate_in_all_markers ();
		public void animate_out_all_markers ();
		public void hide ();
		public void hide_all_markers ();
		public void remove_marker (Champlain.BaseMarker marker);
		public void show ();
		public void show_all_markers ();
	}
	[CCode (cheader_filename = "champlain/champlain.h")]
	public class MapSource : GLib.Object {
		public virtual void fill_tile (Champlain.Tile tile);
		public uint get_column_count (int zoom_level);
		public unowned string get_id ();
		public double get_latitude (int zoom_level, uint y);
		public unowned string get_license ();
		public unowned string get_license_uri ();
		public double get_longitude (int zoom_level, uint x);
		public int get_max_zoom_level ();
		public float get_meters_per_pixel (int zoom_level, double latitude, double longitude);
		public int get_min_zoom_level ();
		public unowned string get_name ();
		public Champlain.MapProjection get_projection ();
		public uint get_row_count (int zoom_level);
		public uint get_tile_size ();
		public uint get_x (int zoom_level, double longitude);
		public uint get_y (int zoom_level, double latitude);
		public void set_id (string id);
		public void set_license (string license);
		public void set_license_uri (string license_uri);
		public void set_name (string name);
		public void set_projection (Champlain.MapProjection projection);
		public string id { get; set construct; }
		public string license { get; set construct; }
		public string license_uri { get; set construct; }
		[NoAccessorMethod]
		public uint max_zoom_level { get; set construct; }
		[NoAccessorMethod]
		public uint min_zoom_level { get; set construct; }
		public string name { get; set construct; }
		public Champlain.MapProjection projection { get; set construct; }
		[NoAccessorMethod]
		public uint tile_size { get; set construct; }
	}
	[Compact]
	[CCode (copy_function = "champlain_map_source_desc_copy", type_id = "CHAMPLAIN_TYPE_MAP_SOURCE_DESC", cheader_filename = "champlain/champlain.h")]
	public class MapSourceDesc {
		public weak Champlain.MapSourceConstructor constructor;
		public void* data;
		public weak string id;
		public weak string license;
		public weak string license_uri;
		public int max_zoom_level;
		public int min_zoom_level;
		public weak string name;
		public Champlain.MapProjection projection;
		public weak string uri_format;
		[CCode (has_construct_function = false)]
		public MapSourceDesc ();
		public unowned Champlain.MapSourceDesc copy ();
	}
	[CCode (cheader_filename = "champlain/champlain.h")]
	public class MapSourceFactory : GLib.Object {
		public unowned Champlain.MapSource create (string id);
		public static unowned Champlain.MapSourceFactory dup_default ();
		public unowned GLib.SList dup_list ();
		public bool register (Champlain.MapSourceDesc desc, Champlain.MapSourceConstructor constructor, void* data);
	}
	[CCode (cheader_filename = "champlain/champlain.h")]
	public class Marker : Champlain.BaseMarker, Clutter.Scriptable, Clutter.Container {
		[CCode (type = "ClutterActor*", has_construct_function = false)]
		public Marker ();
		[NoWrapper]
		public virtual void draw_marker ();
		[CCode (type = "ClutterActor*", has_construct_function = false)]
		public Marker.from_file (string filename) throws GLib.Error;
		[CCode (type = "ClutterActor*", has_construct_function = false)]
		public Marker.full (string text, Clutter.Actor actor);
		public Pango.Alignment get_alignment ();
		public Clutter.Color get_color ();
		public bool get_draw_background ();
		public Pango.EllipsizeMode get_ellipsize ();
		public unowned string get_font_name ();
		public static Clutter.Color get_highlight_color ();
		public static Clutter.Color get_highlight_text_color ();
		public unowned Clutter.Actor get_image ();
		public bool get_single_line_mode ();
		public unowned string get_text ();
		public Clutter.Color get_text_color ();
		public bool get_use_markup ();
		public bool get_wrap ();
		public Pango.WrapMode get_wrap_mode ();
		public void queue_redraw ();
		public void set_alignment (Pango.Alignment alignment);
		public void set_attributes (Pango.AttrList list);
		public void set_color (Clutter.Color color);
		public void set_draw_background (bool background);
		public void set_ellipsize (Pango.EllipsizeMode mode);
		public void set_font_name (string font_name);
		public static void set_highlight_color (Clutter.Color color);
		public static void set_highlight_text_color (Clutter.Color color);
		public void set_image (Clutter.Actor image);
		public void set_single_line_mode (bool mode);
		public void set_text (string text);
		public void set_text_color (Clutter.Color color);
		public void set_use_markup (bool use_markup);
		public void set_wrap (bool wrap);
		public void set_wrap_mode (Pango.WrapMode wrap_mode);
		[CCode (type = "ClutterActor*", has_construct_function = false)]
		public Marker.with_image (Clutter.Actor actor);
		[CCode (type = "ClutterActor*", has_construct_function = false)]
		public Marker.with_text (string text, string? font, Clutter.Color? text_color, Clutter.Color? marker_color);
		public Pango.Alignment alignment { get; set; }
		public Clutter.Color color { get; set; }
		public bool draw_background { get; set; }
		public Pango.EllipsizeMode ellipsize { get; set; }
		public string font_name { get; set; }
		public Clutter.Actor image { get; set; }
		public bool single_line_mode { get; set; }
		public string text { get; set; }
		public Clutter.Color text_color { get; set; }
		public bool use_markup { get; set; }
		public bool wrap { get; set; }
		public Pango.WrapMode wrap_mode { get; set; }
	}
	[CCode (cheader_filename = "champlain/champlain.h")]
	public class NetworkMapSource : Champlain.MapSource {
		[CCode (has_construct_function = false)]
		public NetworkMapSource.full (string id, string name, string license, string license_uri, uint min_zoom, uint max_zoom, uint tile_size, Champlain.MapProjection projection, string uri_format);
		public unowned string get_tile_uri (int x, int y, int z);
		public void set_uri_format (string uri_format);
		[NoAccessorMethod]
		public bool offline { get; set; }
		[NoAccessorMethod]
		public string proxy_uri { owned get; set; }
		[NoAccessorMethod]
		public string uri_format { owned get; set construct; }
	}
	[Compact]
	[CCode (copy_function = "champlain_point_copy", type_id = "CHAMPLAIN_TYPE_POINT", cheader_filename = "champlain/champlain.h")]
	public class Point {
		public double lat;
		public double lon;
		[CCode (has_construct_function = false)]
		public Point (double lat, double lon);
		public unowned Champlain.Point copy ();
	}
	[CCode (cheader_filename = "champlain/champlain.h")]
	public class Polygon : GLib.Object {
		[CCode (has_construct_function = false)]
		public Polygon ();
		public unowned Champlain.Point append_point (double lat, double lon);
		public void clear_points ();
		public bool get_fill ();
		public Clutter.Color get_fill_color ();
		public bool get_mark_points ();
		public unowned GLib.List get_points ();
		public bool get_stroke ();
		public Clutter.Color get_stroke_color ();
		public double get_stroke_width ();
		public void hide ();
		public unowned Champlain.Point insert_point (double lat, double lon, int pos);
		public void remove_point (Champlain.Point point);
		public void set_fill (bool value);
		public void set_fill_color (Clutter.Color color);
		public void set_mark_points (bool value);
		public void set_stroke (bool value);
		public void set_stroke_color (Clutter.Color color);
		public void set_stroke_width (double value);
		public void show ();
		[NoAccessorMethod]
		public bool closed_path { get; set; }
		public bool fill { get; set; }
		public Clutter.Color fill_color { get; set; }
		public bool mark_points { get; set; }
		public bool stroke { get; set; }
		public Clutter.Color stroke_color { get; set; }
		public double stroke_width { get; set; }
		[NoAccessorMethod]
		public bool visible { get; set; }
	}
	[CCode (cheader_filename = "champlain/champlain.h")]
	public class SelectionLayer : Champlain.Layer, Clutter.Scriptable, Clutter.Container {
		[CCode (type = "ChamplainLayer*", has_construct_function = false)]
		public SelectionLayer ();
		public uint count_selected_markers ();
		public unowned Champlain.BaseMarker get_selected ();
		public unowned GLib.List get_selected_markers ();
		public Champlain.SelectionMode get_selection_mode ();
		public bool marker_is_selected (Champlain.BaseMarker marker);
		public void select (Champlain.BaseMarker marker);
		public void select_all ();
		public void set_selection_mode (Champlain.SelectionMode mode);
		public void unselect (Champlain.BaseMarker marker);
		public void unselect_all ();
		public Champlain.SelectionMode selection_mode { get; set; }
		public virtual signal void changed ();
	}
	[CCode (cheader_filename = "champlain/champlain.h")]
	public class Tile : GLib.Object {
		[CCode (has_construct_function = false)]
		public Tile ();
		[CCode (has_construct_function = false)]
		public Tile.full (int x, int y, uint size, int zoom_level);
		public unowned Clutter.Actor get_actor ();
		public unowned Clutter.Actor get_content ();
		public unowned string get_etag ();
		public unowned string get_filename ();
		public GLib.TimeVal get_modified_time ();
		public unowned string get_modified_time_string ();
		public uint get_size ();
		public Champlain.State get_state ();
		public unowned string get_uri ();
		public int get_x ();
		public int get_y ();
		public int get_zoom_level ();
		public void set_content (Clutter.Actor actor, bool fade_in);
		public void set_etag (string etag);
		public void set_filename (string filename);
		public void set_modified_time (GLib.TimeVal time);
		public void set_size (uint size);
		public void set_state (Champlain.State state);
		public void set_uri (string uri);
		public void set_x (int x);
		public void set_y (int y);
		public void set_zoom_level (int zoom_level);
		public Clutter.Actor actor { get; }
		public Clutter.Actor content { get; set; }
		public string etag { get; set; }
		public string filename { get; set; }
		public uint size { get; set; }
		public Champlain.State state { get; set; }
		public string uri { get; set; }
		public int x { get; set; }
		public int y { get; set; }
		public int zoom_level { get; set; }
	}
	[CCode (cheader_filename = "champlain/champlain.h")]
	public class View : Clutter.Group, Clutter.Scriptable, Clutter.Container {
		[CCode (type = "ClutterActor*", has_construct_function = false)]
		public View ();
		public void add_layer (Champlain.Layer layer);
		public void add_polygon (Champlain.Polygon polygon);
		public void center_on (double latitude, double longitude);
		public void ensure_markers_visible (Champlain.BaseMarker[] markers, bool animate);
		public void ensure_visible (double lat1, double lon1, double lat2, double lon2, bool animate);
		public bool get_coords_at (uint x, uint y, out double lat, out double lon);
		public bool get_coords_from_event (Clutter.Event event, out double lat, out double lon);
		public double get_decel_rate ();
		public bool get_keep_center_on_resize ();
		public unowned string get_license_text ();
		public unowned Champlain.MapSource get_map_source ();
		public uint get_max_scale_width ();
		public int get_max_zoom_level ();
		public int get_min_zoom_level ();
		public Champlain.Unit get_scale_unit ();
		public Champlain.ScrollMode get_scroll_mode ();
		public bool get_show_license ();
		public bool get_show_scale ();
		public int get_zoom_level ();
		public bool get_zoom_on_double_click ();
		public void go_to (double latitude, double longitude);
		public void remove_layer (Champlain.Layer layer);
		public void remove_polygon (Champlain.Polygon polygon);
		public void set_decel_rate (double rate);
		public void set_keep_center_on_resize (bool value);
		public void set_license_text (string text);
		public void set_map_source (Champlain.MapSource map_source);
		public void set_max_scale_width (uint value);
		public void set_max_zoom_level (int zoom_level);
		public void set_min_zoom_level (int zoom_level);
		public void set_scale_unit (Champlain.Unit unit);
		public void set_scroll_mode (Champlain.ScrollMode mode);
		public void set_show_license (bool value);
		public void set_show_scale (bool value);
		public void set_size (uint width, uint height);
		public void set_zoom_level (int zoom_level);
		public void set_zoom_on_double_click (bool value);
		public void stop_go_to ();
		public void zoom_in ();
		public void zoom_out ();
		public double decel_rate { get; set; }
		public bool keep_center_on_resize { get; set; }
		[NoAccessorMethod]
		public double latitude { get; set; }
		public string license_text { get; set; }
		[NoAccessorMethod]
		public double longitude { get; set; }
		public Champlain.MapSource map_source { get; set; }
		public uint max_scale_width { get; set; }
		public int max_zoom_level { get; set; }
		public int min_zoom_level { get; set; }
		public Champlain.Unit scale_unit { get; set; }
		public Champlain.ScrollMode scroll_mode { get; set; }
		public bool show_license { get; set; }
		public bool show_scale { get; set; }
		[NoAccessorMethod]
		public Champlain.State state { get; }
		public int zoom_level { get; set; }
		public bool zoom_on_double_click { get; set; }
		public virtual signal void animation_completed ();
	}
	[CCode (cheader_filename = "champlain/champlain.h")]
	public class ZoomLevel : GLib.Object {
		[CCode (has_construct_function = false)]
		public ZoomLevel ();
		public void add_tile (Champlain.Tile tile);
		public unowned Clutter.Actor get_actor ();
		public uint get_height ();
		public unowned Champlain.Tile get_nth_tile (uint index);
		public uint get_width ();
		public int get_zoom_level ();
		public void remove_tile (Champlain.Tile tile);
		public void set_height (uint height);
		public void set_width (uint width);
		public void set_zoom_level (int zoom_level);
		public uint tile_count ();
		public Clutter.Actor actor { get; }
		public uint height { get; set; }
		public uint width { get; set; }
		public int zoom_level { get; set; }
		public virtual signal void tile_added (Champlain.Tile p0);
		public virtual signal void tile_removed (Champlain.Tile p0);
	}
	[CCode (cprefix = "CHAMPLAIN_MAP_PROJECTION_", cheader_filename = "champlain/champlain.h")]
	public enum MapProjection {
		MERCATOR
	}
	[CCode (cprefix = "CHAMPLAIN_SCROLL_MODE_", cheader_filename = "champlain/champlain.h")]
	public enum ScrollMode {
		PUSH,
		KINETIC
	}
	[CCode (cprefix = "CHAMPLAIN_SELECTION_", cheader_filename = "champlain/champlain.h")]
	public enum SelectionMode {
		NONE,
		SINGLE,
		MULTIPLE
	}
	[CCode (cprefix = "CHAMPLAIN_STATE_", cheader_filename = "champlain/champlain.h")]
	public enum State {
		NONE,
		INIT,
		LOADING,
		VALIDATING_CACHE,
		DONE
	}
	[CCode (cprefix = "CHAMPLAIN_UNIT_", cheader_filename = "champlain/champlain.h")]
	public enum Unit {
		KM,
		MILES
	}
	[CCode (cheader_filename = "champlain/champlain.h")]
	public delegate unowned Champlain.MapSource MapSourceConstructor (Champlain.MapSourceDesc desc);
	[CCode (cheader_filename = "champlain/champlain.h")]
	public const int MAJOR_VERSION;
	[CCode (cheader_filename = "champlain/champlain.h")]
	public const string MAP_SOURCE_MFF_RELIEF;
	[CCode (cheader_filename = "champlain/champlain.h")]
	public const string MAP_SOURCE_OAM;
	[CCode (cheader_filename = "champlain/champlain.h")]
	public const string MAP_SOURCE_OSM_CYCLE_MAP;
	[CCode (cheader_filename = "champlain/champlain.h")]
	public const string MAP_SOURCE_OSM_MAPNIK;
	[CCode (cheader_filename = "champlain/champlain.h")]
	public const string MAP_SOURCE_OSM_OSMARENDER;
	[CCode (cheader_filename = "champlain/champlain.h")]
	public const string MAP_SOURCE_OSM_TRANSPORT_MAP;
	[CCode (cheader_filename = "champlain/champlain.h")]
	public const int MAX_LAT;
	[CCode (cheader_filename = "champlain/champlain.h")]
	public const int MAX_LONG;
	[CCode (cheader_filename = "champlain/champlain.h")]
	public const int MICRO_VERSION;
	[CCode (cheader_filename = "champlain/champlain.h")]
	public const int MINOR_VERSION;
	[CCode (cheader_filename = "champlain/champlain.h")]
	public const int MIN_LAT;
	[CCode (cheader_filename = "champlain/champlain.h")]
	public const int MIN_LONG;
	[CCode (cheader_filename = "champlain/champlain.h")]
	public const int PARAM_READABLE;
	[CCode (cheader_filename = "champlain/champlain.h")]
	public const int PARAM_READWRITE;
	[CCode (cheader_filename = "champlain/champlain.h")]
	public const int VERSION_HEX;
	[CCode (cheader_filename = "champlain/champlain.h")]
	public const string VERSION_S;
}
