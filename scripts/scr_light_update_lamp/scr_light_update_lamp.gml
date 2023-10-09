function scr_light_update_lamp() {
	//scr_light_update_lamp
	//Nearly the same script as scr_light_update.

	var light_grid = obj_light.Light_Grid;

	var range, max_width, max_height, t_xxx, t_yyy, move_grid;

	move_grid = obj_creator.Room_Grid;

	t_xxx = x div Tile_Size;
	t_yyy = y div Tile_Size;

	max_width = room_width/Tile_Size-1;
	max_height = room_height/Tile_Size-1;


	range = 2;


	//Source position on grid
	ds_grid_set(light_grid, t_xxx, t_yyy, 1);


	var cx, cy, tt, stop, tt, i;

	for(i = 0; i < 360; i += 1)
	{
	stop = false;
	tt = 1;
    
	    do
	    {      
	    cx =  (x+12+lengthdir_x(Tile_Size*tt, i)) div Tile_Size;
	    cy =  (y+12+lengthdir_y(Tile_Size*tt, i)) div Tile_Size;
        
	        if (cx < 0 && cx > max_width && cy < 0 && cy > max_width)
	        {
	        stop = true;
	        break;
	        }
   
	            if (ds_grid_get(move_grid, cx, cy) == 1)
	            {
	            ds_grid_set(light_grid, cx, cy, 1);
	            }               
                
	            else
	            {
	            ds_grid_set(light_grid, cx, cy, 1)  ;               
	            stop = true;
	            }
                
                
                
	        if (tt >= range)
	        {
	        stop = true;
	        }
	        else
	        {
	        tt += 1;
	        }
	    }
	    until(stop == true)
    
	}



}
