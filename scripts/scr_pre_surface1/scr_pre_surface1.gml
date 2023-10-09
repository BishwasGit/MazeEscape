function scr_pre_surface1() {
	//black surface
	//We punch hole where it's lite.
	var xx, yy, gw, gh, gx, gy, light, saw, gvx, gvy, fovw, fovh;

	gvx = ceil(__view_get( e__VW.XView, 0 )/Tile_Size);
	gvy = ceil(__view_get( e__VW.YView, 0 )/Tile_Size);
	fovw = ceil(__view_get( e__VW.WView, 0 )/Tile_Size);
	fovh = ceil(__view_get( e__VW.HView, 0 )/Tile_Size);

	surface_set_target(Mysurf);
	draw_clear_alpha(c_black, 1);


	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_blend_mode(bm_subtract);

	for (xx = 0; xx < fovw; xx+=1)
	{
	    for (yy = 0; yy < fovh; yy+=1)
	    {
	    light = ds_grid_get(Light_Grid, xx+gvx, yy+gvy);
	    saw = ds_grid_get(Saw_Grid, xx+gvx, yy+gvy);
    
	        if (light == 0 && saw)
	        {
	        draw_sprite(spr_shadow, 1, xx*Tile_Size, yy*Tile_Size);
	        }
	        else if (light == 1)
	        {
	        draw_sprite(spr_shadow, 0, xx*Tile_Size, yy*Tile_Size);
	        }           
	    }
	}

	draw_set_blend_mode(bm_normal);
	surface_reset_target();



}
