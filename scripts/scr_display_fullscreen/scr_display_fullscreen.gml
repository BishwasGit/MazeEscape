/// @description scr_display_fullscreen(true or false)
/// @param true or false
function scr_display_fullscreen(argument0) {
	/*
	When fullscreen, we double the base tile_size and see how much we can enter on the player's monitor. We then adjust the view.
	*/

	if (argument0 == 1)
	{
	window_set_fullscreen(1);
	var nmb_tile_w = display_get_width() div (Tile_Size*2);
	var nmb_tile_h = display_get_height() div (Tile_Size*2);

	__view_set( e__VW.WView, 0, nmb_tile_w*Tile_Size );
	__view_set( e__VW.HView, 0, nmb_tile_h*Tile_Size );
	__view_set( e__VW.WPort, 0, nmb_tile_w*Tile_Size );
	__view_set( e__VW.HPort, 0, nmb_tile_h*Tile_Size );


	surface_resize(application_surface, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));

	Width_Total = __view_get( e__VW.WPort, 0 );
	Height_Total = __view_get( e__VW.HPort, 0 );
	X_Offset = (display_get_width()-nmb_tile_w*(Tile_Size*2))/2;
	Y_Offset = (display_get_height()-nmb_tile_h*(Tile_Size*2))/2;

	display_set_gui_maximise(2, 2, 0, 0);
	}

	else if (argument0 == 0)
	{
	window_set_fullscreen(0);
	var base_w = 768;
	var base_h = 576;
	__view_set( e__VW.WView, 0, base_w );
	__view_set( e__VW.HView, 0, base_h );
	__view_set( e__VW.WPort, 0, base_w );
	__view_set( e__VW.HPort, 0, base_h );
	surface_resize(application_surface, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));
	Width_Total = base_w;
	Height_Total = base_h;
	X_Offset = 0;
	Y_Offset = 0;
	display_set_gui_maximise();
	}



}
