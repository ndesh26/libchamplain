/* champlain-0.12.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "Champlain", gir_namespace = "Champlain", gir_version = "0.12", lower_case_cprefix = "champlain_")]
namespace Champlain {
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_adjustment_get_type ()")]
	public class Adjustment : GLib.Object {
		[CCode (has_construct_function = false)]
		public Adjustment (double value, double lower, double upper, double step_increment);
		public bool clamp (bool interpolate, uint n_frames, uint fps);
		public double get_value ();
		public void get_values (double value, double lower, double upper, double step_increment);
		public void interpolate (double value, uint n_frames, uint fps);
		public void interpolate_stop ();
		public void set_value (double value);
		public void set_values (double value, double lower, double upper, double step_increment);
		[NoAccessorMethod]
		public double lower { get; set; }
		[NoAccessorMethod]
		public double step_increment { get; set; }
		[NoAccessorMethod]
		public double upper { get; set; }
		public double value { get; set; }
		public virtual signal void changed ();
	}
	[CCode (cheader_filename = "champlain/champlain.h", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "champlain_bounding_box_get_type ()")]
	[Compact]
	public class BoundingBox {
		public double bottom;
		public double left;
		public double right;
		public double top;
		[CCode (has_construct_function = false)]
		public BoundingBox ();
		public void compose (Champlain.BoundingBox other);
		public Champlain.BoundingBox copy ();
		public bool covers (double latitude, double longitude);
		public void extend (double latitude, double longitude);
		public void free ();
		public void get_center (out double latitude, out double longitude);
		public bool is_valid ();
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_coordinate_get_type ()")]
	public class Coordinate : GLib.InitiallyUnowned, Champlain.Location {
		[CCode (has_construct_function = false)]
		public Coordinate ();
		[CCode (has_construct_function = false)]
		public Coordinate.full (double latitude, double longitude);
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_custom_marker_get_type ()")]
	[Deprecated (since = "0.12.4")]
	public class CustomMarker : Champlain.Marker, Atk.Implementor, Champlain.Location, Clutter.Animatable, Clutter.Container, Clutter.Scriptable {
		[CCode (has_construct_function = false, type = "ClutterActor*")]
		[Deprecated (since = "0.12.4")]
		public CustomMarker ();
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_error_tile_renderer_get_type ()")]
	public class ErrorTileRenderer : Champlain.Renderer {
		[CCode (has_construct_function = false)]
		public ErrorTileRenderer (uint tile_size);
		public uint get_tile_size ();
		public void set_tile_size (uint size);
		public uint tile_size { get; set; }
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_file_cache_get_type ()")]
	public class FileCache : Champlain.TileCache {
		[CCode (has_construct_function = false)]
		protected FileCache ();
		[CCode (has_construct_function = false)]
		public FileCache.full (uint size_limit, string? cache_dir, Champlain.Renderer renderer);
		public unowned string get_cache_dir ();
		public uint get_size_limit ();
		public void purge ();
		public void purge_on_idle ();
		public void set_size_limit (uint size_limit);
		public string cache_dir { get; construct; }
		public uint size_limit { get; set construct; }
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_file_tile_source_get_type ()")]
	public class FileTileSource : Champlain.TileSource {
		[CCode (has_construct_function = false)]
		protected FileTileSource ();
		[CCode (has_construct_function = false)]
		public FileTileSource.full (string id, string name, string license, string license_uri, uint min_zoom, uint max_zoom, uint tile_size, Champlain.MapProjection projection, Champlain.Renderer renderer);
		public void load_map_data (string map_path);
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_image_renderer_get_type ()")]
	public class ImageRenderer : Champlain.Renderer {
		[CCode (has_construct_function = false)]
		public ImageRenderer ();
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_kinetic_scroll_view_get_type ()")]
	public class KineticScrollView : Clutter.Actor, Atk.Implementor, Clutter.Animatable, Clutter.Container, Clutter.Scriptable {
		[CCode (has_construct_function = false, type = "ClutterActor*")]
		public KineticScrollView (bool kinetic, Champlain.Viewport viewport);
		public void stop ();
		[NoAccessorMethod]
		public double decel_rate { get; set; }
		[NoAccessorMethod]
		public bool mode { get; set; }
		[NoAccessorMethod]
		public uint motion_buffer { get; set; }
		public signal void panning_completed ();
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_label_get_type ()")]
	public class Label : Champlain.Marker, Atk.Implementor, Champlain.Location, Clutter.Animatable, Clutter.Container, Clutter.Scriptable {
		[CCode (has_construct_function = false, type = "ClutterActor*")]
		public Label ();
		[CCode (has_construct_function = false, type = "ClutterActor*")]
		public Label.from_file (string filename) throws GLib.Error;
		[CCode (has_construct_function = false, type = "ClutterActor*")]
		public Label.full (string text, Clutter.Actor actor);
		public Pango.Alignment get_alignment ();
		public Pango.AttrList get_attributes ();
		public Clutter.Color? get_color ();
		public bool get_draw_background ();
		public bool get_draw_shadow ();
		public Pango.EllipsizeMode get_ellipsize ();
		public unowned string get_font_name ();
		public unowned Clutter.Actor get_image ();
		public bool get_single_line_mode ();
		public unowned string get_text ();
		public Clutter.Color? get_text_color ();
		public bool get_use_markup ();
		public bool get_wrap ();
		public Pango.WrapMode get_wrap_mode ();
		public void set_alignment (Pango.Alignment alignment);
		public void set_attributes (Pango.AttrList list);
		public void set_color (Clutter.Color? color);
		public void set_draw_background (bool background);
		public void set_draw_shadow (bool shadow);
		public void set_ellipsize (Pango.EllipsizeMode mode);
		public void set_font_name (string? font_name);
		public void set_image (Clutter.Actor? image);
		public void set_single_line_mode (bool mode);
		public void set_text (string text);
		public void set_text_color (Clutter.Color? color);
		public void set_use_markup (bool use_markup);
		public void set_wrap (bool wrap);
		public void set_wrap_mode (Pango.WrapMode wrap_mode);
		[CCode (has_construct_function = false, type = "ClutterActor*")]
		public Label.with_image (Clutter.Actor actor);
		[CCode (has_construct_function = false, type = "ClutterActor*")]
		public Label.with_text (string text, string? font, Clutter.Color? text_color, Clutter.Color? label_color);
		public Pango.Alignment alignment { get; set; }
		public Clutter.Color color { get; set; }
		public bool draw_background { get; set; }
		public bool draw_shadow { get; set; }
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
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_layer_get_type ()")]
	public abstract class Layer : Clutter.Actor, Atk.Implementor, Clutter.Animatable, Clutter.Container, Clutter.Scriptable {
		[CCode (has_construct_function = false)]
		protected Layer ();
		public virtual Champlain.BoundingBox get_bounding_box ();
		public virtual void set_view (Champlain.View view);
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_license_get_type ()")]
	public class License : Clutter.Actor, Atk.Implementor, Clutter.Animatable, Clutter.Container, Clutter.Scriptable {
		[CCode (has_construct_function = false, type = "ClutterActor*")]
		public License ();
		public void connect_view (Champlain.View view);
		public void disconnect_view ();
		public Pango.Alignment get_alignment ();
		public unowned string get_extra_text ();
		public void set_alignment (Pango.Alignment alignment);
		public void set_extra_text (string text);
		public Pango.Alignment alignment { get; set; }
		public string extra_text { get; set; }
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_map_source_get_type ()")]
	public abstract class MapSource : GLib.InitiallyUnowned {
		[CCode (has_construct_function = false)]
		protected MapSource ();
		public virtual void fill_tile (Champlain.Tile tile);
		public uint get_column_count (uint zoom_level);
		public virtual unowned string get_id ();
		public double get_latitude (uint zoom_level, double y);
		public virtual unowned string get_license ();
		public virtual unowned string get_license_uri ();
		public double get_longitude (uint zoom_level, double x);
		public virtual uint get_max_zoom_level ();
		public double get_meters_per_pixel (uint zoom_level, double latitude, double longitude);
		public virtual uint get_min_zoom_level ();
		public virtual unowned string get_name ();
		public unowned Champlain.MapSource get_next_source ();
		public virtual Champlain.MapProjection get_projection ();
		public unowned Champlain.Renderer get_renderer ();
		public uint get_row_count (uint zoom_level);
		public virtual uint get_tile_size ();
		public double get_x (uint zoom_level, double longitude);
		public double get_y (uint zoom_level, double latitude);
		public void set_next_source (Champlain.MapSource next_source);
		public void set_renderer (Champlain.Renderer renderer);
		public Champlain.MapSource next_source { get; set; }
		public Champlain.Renderer renderer { get; set; }
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_map_source_chain_get_type ()")]
	public class MapSourceChain : Champlain.MapSource {
		[CCode (has_construct_function = false)]
		public MapSourceChain ();
		public void pop ();
		public void push (Champlain.MapSource map_source);
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_map_source_desc_get_type ()")]
	public class MapSourceDesc : GLib.Object {
		[CCode (has_construct_function = false)]
		protected MapSourceDesc ();
		public void* get_data ();
		public unowned string get_id ();
		public unowned string get_license ();
		public unowned string get_license_uri ();
		public uint get_max_zoom_level ();
		public uint get_min_zoom_level ();
		public unowned string get_name ();
		public Champlain.MapProjection get_projection ();
		public uint get_tile_size ();
		public unowned string get_uri_format ();
		[NoAccessorMethod]
		public void* constructor { get; construct; }
		public void* data { get; construct; }
		public string id { get; construct; }
		public string license { get; construct; }
		public string license_uri { get; construct; }
		public uint max_zoom_level { get; construct; }
		public uint min_zoom_level { get; construct; }
		public string name { get; construct; }
		public Champlain.MapProjection projection { get; construct; }
		public uint tile_size { get; construct; }
		public string uri_format { get; construct; }
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_map_source_factory_get_type ()")]
	public class MapSourceFactory : GLib.Object {
		[CCode (has_construct_function = false)]
		protected MapSourceFactory ();
		public unowned Champlain.MapSource create (string id);
		public unowned Champlain.MapSource create_cached_source (string id);
		public unowned Champlain.MapSource create_error_source (uint tile_size);
		public unowned Champlain.MapSource create_memcached_source (string id);
		public static Champlain.MapSourceFactory dup_default ();
		public GLib.SList<weak Champlain.MapSourceDesc> get_registered ();
		public bool register (Champlain.MapSourceDesc desc);
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_marker_get_type ()")]
	public class Marker : Clutter.Actor, Atk.Implementor, Champlain.Location, Clutter.Animatable, Clutter.Container, Clutter.Scriptable {
		[CCode (has_construct_function = false, type = "ClutterActor*")]
		public Marker ();
		public void animate_in ();
		public void animate_in_with_delay (uint delay);
		public void animate_out ();
		public void animate_out_with_delay (uint delay);
		public bool get_draggable ();
		public bool get_selectable ();
		public bool get_selected ();
		public static unowned Clutter.Color? get_selection_color ();
		public static unowned Clutter.Color? get_selection_text_color ();
		public void set_draggable (bool value);
		public void set_selectable (bool value);
		public void set_selected (bool value);
		public static void set_selection_color (Clutter.Color color);
		public static void set_selection_text_color (Clutter.Color color);
		public bool draggable { get; set; }
		public bool selectable { get; set; }
		public bool selected { get; set; }
		public signal void button_press (Clutter.Event event);
		public signal void button_release (Clutter.Event event);
		public signal void drag_finish (Clutter.Event event);
		public signal void drag_motion (double dx, double dy, Clutter.Event event);
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_marker_layer_get_type ()")]
	public class MarkerLayer : Champlain.Layer, Atk.Implementor, Champlain.Exportable, Clutter.Animatable, Clutter.Container, Clutter.Scriptable {
		[CCode (has_construct_function = false)]
		public MarkerLayer ();
		public void add_marker (Champlain.Marker marker);
		public void animate_in_all_markers ();
		public void animate_out_all_markers ();
		[CCode (has_construct_function = false)]
		public MarkerLayer.full (Champlain.SelectionMode mode);
		public GLib.List<weak Champlain.Marker> get_markers ();
		public GLib.List<weak Champlain.Marker> get_selected ();
		public Champlain.SelectionMode get_selection_mode ();
		public void hide_all_markers ();
		public void remove_all ();
		public void remove_marker (Champlain.Marker marker);
		public void select_all_markers ();
		public void set_all_markers_draggable ();
		public void set_all_markers_undraggable ();
		public void set_selection_mode (Champlain.SelectionMode mode);
		public void show_all_markers ();
		public void unselect_all_markers ();
		public Champlain.SelectionMode selection_mode { get; set; }
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_memory_cache_get_type ()")]
	public class MemoryCache : Champlain.TileCache {
		[CCode (has_construct_function = false)]
		protected MemoryCache ();
		public void clean ();
		[CCode (has_construct_function = false)]
		public MemoryCache.full (uint size_limit, Champlain.Renderer renderer);
		public uint get_size_limit ();
		public void set_size_limit (uint size_limit);
		public uint size_limit { get; set construct; }
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_network_bbox_tile_source_get_type ()")]
	public class NetworkBboxTileSource : Champlain.TileSource {
		[CCode (has_construct_function = false)]
		protected NetworkBboxTileSource ();
		[CCode (has_construct_function = false)]
		public NetworkBboxTileSource.full (string id, string name, string license, string license_uri, uint min_zoom, uint max_zoom, uint tile_size, Champlain.MapProjection projection, Champlain.Renderer renderer);
		public unowned string get_api_uri ();
		public void load_map_data (Champlain.BoundingBox bbox);
		public void set_api_uri (string api_uri);
		public string api_uri { get; set; }
		[NoAccessorMethod]
		public string proxy_uri { owned get; set; }
		[NoAccessorMethod]
		public Champlain.State state { get; set; }
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_network_tile_source_get_type ()")]
	public class NetworkTileSource : Champlain.TileSource {
		[CCode (has_construct_function = false)]
		protected NetworkTileSource ();
		[CCode (has_construct_function = false)]
		public NetworkTileSource.full (string id, string name, string license, string license_uri, uint min_zoom, uint max_zoom, uint tile_size, Champlain.MapProjection projection, string uri_format, Champlain.Renderer renderer);
		public int get_max_conns ();
		public bool get_offline ();
		public unowned string get_proxy_uri ();
		public unowned string get_uri_format ();
		public void set_max_conns (int max_conns);
		public void set_offline (bool offline);
		public void set_proxy_uri (string proxy_uri);
		public void set_uri_format (string uri_format);
		public int max_conns { get; set; }
		public bool offline { get; set; }
		public string proxy_uri { get; set; }
		public string uri_format { get; set construct; }
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_null_tile_source_get_type ()")]
	public class NullTileSource : Champlain.TileSource {
		[CCode (has_construct_function = false)]
		protected NullTileSource ();
		[CCode (has_construct_function = false)]
		public NullTileSource.full (Champlain.Renderer renderer);
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_path_layer_get_type ()")]
	public class PathLayer : Champlain.Layer, Atk.Implementor, Champlain.Exportable, Clutter.Animatable, Clutter.Container, Clutter.Scriptable {
		[CCode (has_construct_function = false)]
		public PathLayer ();
		public void add_node (Champlain.Location location);
		public bool get_closed ();
		public GLib.List<weak uint> get_dash ();
		public bool get_fill ();
		public Clutter.Color? get_fill_color ();
		public GLib.List<weak Champlain.Location> get_nodes ();
		public bool get_stroke ();
		public Clutter.Color? get_stroke_color ();
		public double get_stroke_width ();
		public bool get_visible ();
		public void insert_node (Champlain.Location location, uint position);
		public void remove_all ();
		public void remove_node (Champlain.Location location);
		public void set_closed (bool value);
		public void set_dash (GLib.List<uint> dash_pattern);
		public void set_fill (bool value);
		public void set_fill_color (Clutter.Color? color);
		public void set_stroke (bool value);
		public void set_stroke_color (Clutter.Color? color);
		public void set_stroke_width (double value);
		public void set_visible (bool value);
		public bool closed { get; set; }
		public bool fill { get; set; }
		public Clutter.Color fill_color { get; set; }
		public bool stroke { get; set; }
		public Clutter.Color stroke_color { get; set; }
		public double stroke_width { get; set; }
		public bool visible { get; set; }
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_point_get_type ()")]
	public class Point : Champlain.Marker, Atk.Implementor, Champlain.Exportable, Champlain.Location, Clutter.Animatable, Clutter.Container, Clutter.Scriptable {
		[CCode (has_construct_function = false, type = "ClutterActor*")]
		public Point ();
		[CCode (has_construct_function = false, type = "ClutterActor*")]
		public Point.full (double size, Clutter.Color color);
		public Clutter.Color? get_color ();
		public double get_size ();
		public void set_color (Clutter.Color? color);
		public void set_size (double size);
		public Clutter.Color color { get; set; }
		public double size { get; set; }
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_renderer_get_type ()")]
	public class Renderer : GLib.InitiallyUnowned {
		[CCode (has_construct_function = false)]
		protected Renderer ();
		public virtual void render (Champlain.Tile tile);
		public virtual void set_data (string data, uint size);
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_scale_get_type ()")]
	public class Scale : Clutter.Actor, Atk.Implementor, Clutter.Animatable, Clutter.Container, Clutter.Scriptable {
		[CCode (has_construct_function = false, type = "ClutterActor*")]
		public Scale ();
		public void connect_view (Champlain.View view);
		public void disconnect_view ();
		public uint get_max_width ();
		public Champlain.Unit get_unit ();
		public void set_max_width (uint value);
		public void set_unit (Champlain.Unit unit);
		public uint max_width { get; set; }
		public Champlain.Unit unit { get; set; }
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_tile_get_type ()")]
	public class Tile : Clutter.Actor, Atk.Implementor, Champlain.Exportable, Clutter.Animatable, Clutter.Container, Clutter.Scriptable {
		[CCode (has_construct_function = false)]
		public Tile ();
		public void display_content ();
		[CCode (has_construct_function = false)]
		public Tile.full (uint x, uint y, uint size, uint zoom_level);
		public unowned Clutter.Actor get_content ();
		public unowned string get_etag ();
		public bool get_fade_in ();
		public unowned GLib.TimeVal? get_modified_time ();
		public uint get_size ();
		public Champlain.State get_state ();
		public uint get_x ();
		public uint get_y ();
		public uint get_zoom_level ();
		public void set_content (Clutter.Actor actor);
		public void set_etag (string etag);
		public void set_fade_in (bool fade_in);
		public void set_modified_time (GLib.TimeVal time);
		public void set_size (uint size);
		public void set_state (Champlain.State state);
		public void set_x (uint x);
		public void set_y (uint y);
		public void set_zoom_level (uint zoom_level);
		public Clutter.Actor content { get; set; }
		public string etag { get; set; }
		public bool fade_in { get; set; }
		public uint size { get; set; }
		public Champlain.State state { get; set; }
		public uint x { get; set; }
		public uint y { get; set; }
		public uint zoom_level { get; set; }
		public signal void render_complete (void* data, uint size, bool error);
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_tile_cache_get_type ()")]
	public abstract class TileCache : Champlain.MapSource {
		[CCode (has_construct_function = false)]
		protected TileCache ();
		public virtual void on_tile_filled (Champlain.Tile tile);
		public virtual void refresh_tile_time (Champlain.Tile tile);
		public virtual void store_tile (Champlain.Tile tile, string contents, size_t size);
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_tile_source_get_type ()")]
	public abstract class TileSource : Champlain.MapSource {
		[CCode (has_construct_function = false)]
		protected TileSource ();
		public unowned Champlain.TileCache get_cache ();
		public void set_cache (Champlain.TileCache cache);
		public void set_id (string id);
		public void set_license (string license);
		public void set_license_uri (string license_uri);
		public void set_max_zoom_level (uint zoom_level);
		public void set_min_zoom_level (uint zoom_level);
		public void set_name (string name);
		public void set_projection (Champlain.MapProjection projection);
		public void set_tile_size (uint tile_size);
		public Champlain.TileCache cache { get; set; }
		[NoAccessorMethod]
		public string id { owned get; set construct; }
		[NoAccessorMethod]
		public string license { owned get; set construct; }
		[NoAccessorMethod]
		public string license_uri { owned get; set construct; }
		[NoAccessorMethod]
		public uint max_zoom_level { get; set construct; }
		[NoAccessorMethod]
		public uint min_zoom_level { get; set construct; }
		[NoAccessorMethod]
		public string name { owned get; set construct; }
		[NoAccessorMethod]
		public Champlain.MapProjection projection { get; set construct; }
		[NoAccessorMethod]
		public uint tile_size { get; set construct; }
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_view_get_type ()")]
	public class View : Clutter.Actor, Atk.Implementor, Clutter.Animatable, Clutter.Container, Clutter.Scriptable {
		[CCode (has_construct_function = false, type = "ClutterActor*")]
		public View ();
		public void add_layer (Champlain.Layer layer);
		public void add_overlay_source (Champlain.MapSource map_source, uint8 opacity);
		[Deprecated (since = "0.12.4")]
		public void bin_layout_add (Clutter.Actor child, Clutter.BinAlignment x_align, Clutter.BinAlignment y_align);
		public void center_on (double latitude, double longitude);
		public void ensure_layers_visible (bool animate);
		public void ensure_visible (Champlain.BoundingBox bbox, bool animate);
		public bool get_animate_zoom ();
		public unowned Clutter.Content get_background_pattern ();
		public Champlain.BoundingBox get_bounding_box ();
		public Champlain.BoundingBox get_bounding_box_for_zoom_level (uint zoom_level);
		public double get_center_latitude ();
		public double get_center_longitude ();
		public double get_deceleration ();
		public bool get_keep_center_on_resize ();
		public bool get_kinetic_mode ();
		public unowned Champlain.License get_license_actor ();
		public unowned Champlain.MapSource get_map_source ();
		public uint get_max_zoom_level ();
		public uint get_min_zoom_level ();
		public GLib.List<weak Champlain.MapSource> get_overlay_sources ();
		public Champlain.State get_state ();
		public void get_viewport_origin (out int x, out int y);
		public unowned Champlain.BoundingBox get_world ();
		public uint get_zoom_level ();
		public bool get_zoom_on_double_click ();
		public void go_to (double latitude, double longitude);
		public double latitude_to_y (double latitude);
		public double longitude_to_x (double longitude);
		public void reload_tiles ();
		public void remove_layer (Champlain.Layer layer);
		public void remove_overlay_source (Champlain.MapSource map_source);
		public void set_animate_zoom (bool value);
		public void set_background_pattern (Clutter.Content background);
		public void set_deceleration (double rate);
		public void set_keep_center_on_resize (bool value);
		public void set_kinetic_mode (bool kinetic);
		public void set_map_source (Champlain.MapSource map_source);
		public void set_max_zoom_level (uint zoom_level);
		public void set_min_zoom_level (uint zoom_level);
		public void set_world (Champlain.BoundingBox bbox);
		public void set_zoom_level (uint zoom_level);
		public void set_zoom_on_double_click (bool value);
		public void stop_go_to ();
		public Cairo.Surface to_surface (bool include_layers);
		public double x_to_longitude (double x);
		public double y_to_latitude (double y);
		public void zoom_in ();
		public void zoom_out ();
		public bool animate_zoom { get; set; }
		public Clutter.Actor background_pattern { get; set; }
		public double deceleration { get; set; }
		[NoAccessorMethod]
		public uint goto_animation_duration { get; set; }
		[NoAccessorMethod]
		public Clutter.AnimationMode goto_animation_mode { get; set; }
		public bool keep_center_on_resize { get; set; }
		public bool kinetic_mode { get; set; }
		[NoAccessorMethod]
		public double latitude { get; set; }
		[NoAccessorMethod]
		public double longitude { get; set; }
		public Champlain.MapSource map_source { get; set; }
		public uint max_zoom_level { get; set; }
		public uint min_zoom_level { get; set; }
		public Champlain.State state { get; }
		public Champlain.BoundingBox world { get; set; }
		public uint zoom_level { get; set; }
		public bool zoom_on_double_click { get; set; }
		public signal void animation_completed ();
		public signal void layer_relocated ();
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_viewport_get_type ()")]
	public class Viewport : Clutter.Actor, Atk.Implementor, Clutter.Animatable, Clutter.Container, Clutter.Scriptable {
		[CCode (has_construct_function = false, type = "ClutterActor*")]
		public Viewport ();
		public void get_adjustments (Champlain.Adjustment hadjustment, Champlain.Adjustment vadjustment);
		public void get_anchor (int x, int y);
		public void get_origin (double x, double y);
		public void set_actor_position (Clutter.Actor actor, double x, double y);
		public void set_adjustments (Champlain.Adjustment hadjustment, Champlain.Adjustment vadjustment);
		public void set_child (Clutter.Actor child);
		public void set_origin (double x, double y);
		public void stop ();
		[NoAccessorMethod]
		public Champlain.Adjustment hadjustment { owned get; set; }
		[NoAccessorMethod]
		public Champlain.Adjustment vadjustment { owned get; set; }
		[NoAccessorMethod]
		public int x_origin { get; set; }
		[NoAccessorMethod]
		public int y_origin { get; set; }
		public signal void relocated ();
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_exportable_get_type ()")]
	public interface Exportable : GLib.Object {
		public abstract unowned Cairo.Surface get_surface ();
		public abstract void set_surface (Cairo.Surface surface);
		public abstract Cairo.Surface surface { get; set; }
	}
	[CCode (cheader_filename = "champlain/champlain.h", type_id = "champlain_location_get_type ()")]
	public interface Location : GLib.Object {
		public abstract double get_latitude ();
		public abstract double get_longitude ();
		public abstract void set_location (double latitude, double longitude);
		[NoAccessorMethod]
		public abstract double latitude { get; set; }
		[NoAccessorMethod]
		public abstract double longitude { get; set; }
	}
	[CCode (cheader_filename = "champlain/champlain.h", cprefix = "CHAMPLAIN_MAP_PROJECTION_", type_id = "champlain_map_projection_get_type ()")]
	public enum MapProjection {
		MERCATOR
	}
	[CCode (cheader_filename = "champlain/champlain.h", cprefix = "CHAMPLAIN_SELECTION_", type_id = "champlain_selection_mode_get_type ()")]
	public enum SelectionMode {
		NONE,
		SINGLE,
		MULTIPLE
	}
	[CCode (cheader_filename = "champlain/champlain.h", cprefix = "CHAMPLAIN_STATE_", type_id = "champlain_state_get_type ()")]
	public enum State {
		NONE,
		LOADING,
		LOADED,
		DONE
	}
	[CCode (cheader_filename = "champlain/champlain.h", cprefix = "CHAMPLAIN_UNIT_", type_id = "champlain_unit_get_type ()")]
	public enum Unit {
		KM,
		MILES
	}
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MAJOR_VERSION")]
	public const int MAJOR_VERSION;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MAP_SOURCE_MEMPHIS_LOCAL")]
	public const string MAP_SOURCE_MEMPHIS_LOCAL;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MAP_SOURCE_MEMPHIS_NETWORK")]
	public const string MAP_SOURCE_MEMPHIS_NETWORK;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MAP_SOURCE_MFF_RELIEF")]
	public const string MAP_SOURCE_MFF_RELIEF;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MAP_SOURCE_OAM")]
	[Deprecated]
	public const string MAP_SOURCE_OAM;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MAP_SOURCE_OSM_AERIAL_MAP")]
	[Deprecated]
	public const string MAP_SOURCE_OSM_AERIAL_MAP;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MAP_SOURCE_OSM_CYCLE_MAP")]
	public const string MAP_SOURCE_OSM_CYCLE_MAP;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MAP_SOURCE_OSM_MAPNIK")]
	public const string MAP_SOURCE_OSM_MAPNIK;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MAP_SOURCE_OSM_MAPQUEST")]
	[Deprecated]
	public const string MAP_SOURCE_OSM_MAPQUEST;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MAP_SOURCE_OSM_OSMARENDER")]
	[Deprecated]
	public const string MAP_SOURCE_OSM_OSMARENDER;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MAP_SOURCE_OSM_TRANSPORT_MAP")]
	public const string MAP_SOURCE_OSM_TRANSPORT_MAP;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MAP_SOURCE_OWM_CLOUDS")]
	public const string MAP_SOURCE_OWM_CLOUDS;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MAP_SOURCE_OWM_PRECIPITATION")]
	public const string MAP_SOURCE_OWM_PRECIPITATION;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MAP_SOURCE_OWM_PRESSURE")]
	public const string MAP_SOURCE_OWM_PRESSURE;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MAP_SOURCE_OWM_TEMPERATURE")]
	public const string MAP_SOURCE_OWM_TEMPERATURE;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MAP_SOURCE_OWM_WIND")]
	public const string MAP_SOURCE_OWM_WIND;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MAX_LATITUDE")]
	public const double MAX_LATITUDE;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MAX_LONGITUDE")]
	public const double MAX_LONGITUDE;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MICRO_VERSION")]
	public const int MICRO_VERSION;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MINOR_VERSION")]
	public const int MINOR_VERSION;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MIN_LATITUDE")]
	public const double MIN_LATITUDE;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_MIN_LONGITUDE")]
	public const double MIN_LONGITUDE;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_VERSION")]
	public const double VERSION;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_VERSION_HEX")]
	public const int VERSION_HEX;
	[CCode (cheader_filename = "champlain/champlain.h", cname = "CHAMPLAIN_VERSION_S")]
	public const string VERSION_S;
}
