function scr_light_update() {
	//scr_light_update
	//This is a variation of Grid shadow casting: https://marketplace.yoyogames.com/assets/489/grid-shadow-casting

	ds_grid_clear(Light_Grid, 0);

	var range, max_width, max_height, t_xxx, t_yyy, move_grid;

	move_grid = obj_creator.Room_Grid;

	t_xxx = Source.x div Tile_Size;
	t_yyy = Source.y div Tile_Size;

	max_width = room_width/Tile_Size-1;
	max_height = room_height/Tile_Size-1;


	range = Fov;



	//Source position on grid
	ds_grid_set(Light_Grid, t_xxx, t_yyy, 1);


	var cx, cy, tt, stop, tt, i;

	for(i = 0; i < 360; i += 1)
	{

	    if (range == 0)
	    {
	    ds_grid_set(Light_Grid, t_xxx, t_yyy, 1);
	    break;
	    }
    
	stop = false;
	tt = 1;

    
	    do
	    {      
	    cx =  (Source.x+(Tile_Size/2)+lengthdir_x(Tile_Size*tt, i)) div Tile_Size;
	    cy =  (Source.y+(Tile_Size/2)+lengthdir_y(Tile_Size*tt, i)) div Tile_Size;
        
	        if (cx < 0 && cx > max_width && cy < 0 && cy > max_width)
	        {
	        stop = true;
	        break;
	        }
   
	            if (ds_grid_get(move_grid, cx, cy) == 1)
	            {
	            ds_grid_set(Light_Grid, cx, cy, 1);
                    
	                if (cx == t_xxx) //Make better lighting on corridors .
	                {
	                ds_grid_set(Light_Grid, cx-1, cy, 1);
	                ds_grid_set(Light_Grid, cx+1, cy, 1);
	                }
                    
	                if (cy == t_yyy) //Make better lighting on corridors .
	                {
	                ds_grid_set(Light_Grid, cx, cy-1, 1);
	                ds_grid_set(Light_Grid, cx, cy+1, 1);
	                }
	            }                
                
                
	            else
	            {
	            ds_grid_set(Light_Grid, cx, cy, 1);
                
	                if (cx == t_xxx) //Make better lighting on corridors .
	                {
	                ds_grid_set(Light_Grid, cx-1, cy, 1);
	                ds_grid_set(Light_Grid, cx+1, cy, 1);
	                }
                    
	                if (cy == t_yyy) //Make better lighting on corridors .
	                {
	                ds_grid_set(Light_Grid, cx, cy-1, 1);
	                ds_grid_set(Light_Grid, cx, cy+1, 1);
	                }
                 
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

	/*
	if the player hasn't find the map, clear the sawgrid to 0 (optional)
	{
	ds_grid_clear(Saw_Grid, 0)
	}
	*/

	ds_grid_add_grid_region(Saw_Grid, Light_Grid, 0, 0, max_width, max_height, 0, 0);

	with(obj_lamp)
	{
	    if (State == "open")
	    {
	        if (x > __view_get( e__VW.XView, 0 ) - 96 && x < __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ) + 96)
	        {
	            if (y > __view_get( e__VW.YView, 0 ) - 96 && y < __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ) + 96)
	            {
	            scr_light_update_lamp();
	            }
        
	        }
    
	    }
	}



}
