function scr_draw_surface() {
	if (surface_exists(Mysurf))
	{
	draw_surface(Mysurf, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ));
	}

	else
	{
	Mysurf = surface_create(__view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));
	scr_pre_surface1();
	}



}
