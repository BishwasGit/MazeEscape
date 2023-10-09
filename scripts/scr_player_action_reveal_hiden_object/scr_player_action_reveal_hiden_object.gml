function scr_player_action_reveal_hiden_object() {
	//scr_player_action_reveal_hiden_object() 
	if (keyboard_check_pressed(ord("F")))
	{
	io_clear();

	var xxi, yyi, ddd;


	xxx = obj_player.x div Tile_Size;
	yyy = obj_player.y div Tile_Size;
	fov = obj_player.Mysheet[3,S_FOV];

	var tmp_grid = ds_grid_create(0,0);

	ds_grid_read(tmp_grid, scr_FOV_grid(fov, x, y));

	    for (yyi = yyy-fov; yyi < yyy+fov+1; yyi += 1)
	    {
	        for (xxi = xxx-fov; xxi < xxx+fov+1; xxi += 1)
	        {
	            if (xxi > 0 && xxi < obj_creator.Grid_Width && yyi > 0 && yyi < obj_creator.Grid_Height)
	            {
	                if (ds_grid_get(tmp_grid, xxi, yyi) == 1)
	                {
	                effect_create_above(ef_spark, xxi*Tile_Size+12, yyi*Tile_Size+12, 0, c_lime);
	                ddd = instance_position(xxi*Tile_Size, yyi*Tile_Size, obj_static);
                    
	                    if (ddd != noone)
	                    {
	                        with(ddd)
	                        {
	                            if (State == "hide")
	                            {
	                            audio_play_sound(snd_sparkle, 1, false);
	                            Update = 1;
	                            }
	                        }
	                    }
	                }
	            }  
	        }
	    }

	ds_grid_destroy(tmp_grid);
	Current_Action_Point = 0;

	scr_text_value(x, y, c_white, "Searching!", "Hidden things revealed!");
	obj_map.alarm[0] = 1;
	}

	/*
	//scr_player_action_reveal_hiden_object() 
	if (keyboard_check_pressed(ord('F')))
	{
	io_clear();

	var xxi, yyi, ddd;


	xxx = obj_player.x div Tile_Size;
	yyy = obj_player.y div Tile_Size;
	fov = obj_player.Mysheet[3,S_FOV];

	var tmp_grid = ds_grid_create(0,0);

	ds_grid_read(tmp_grid, scr_FOV_grid(fov, x, y));

	    for (yyi = yyy-fov; yyi < yyy+fov+1; yyi += 1)
	    {
	        for (xxi = xxx-fov; xxi < xxx+fov+1; xxi += 1)
	        {
            
	            if (ds_grid_get(tmp_grid, xxi, yyi) == 1)
	            {
	            effect_create_above(ef_spark, xxi*Tile_Size+12, yyi*Tile_Size+12, 0, c_lime);
	            ddd = instance_position(xxi*Tile_Size, yyi*Tile_Size, obj_static);
                
	                if (ddd != noone)
	                {
	                    with(ddd)
	                    {
	                        if (State == 'hide')
	                        {
	                        audio_play_sound(snd_sparkle, 1, false);
	                        Update = 1;
	                        }
	                    }
	                }
	            }    
	        }
	    }

	ds_grid_destroy(tmp_grid);
	Current_Action_Point = 0;

	scr_text_value(x, y, c_white, 'Searching!', 'Hidden things revealed!');
	obj_map.alarm[0] = 1;
	}


/* end scr_player_action_reveal_hiden_object */
}
