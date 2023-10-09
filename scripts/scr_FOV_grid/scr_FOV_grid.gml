/// @description scr_FOV_grid(radius, x1, y1)
/// @param radius
/// @param  x1
/// @param  y1
function scr_FOV_grid(argument0, argument1, argument2) {
	//That's nearly the same script as scr_light_update()
	//return a ds_grid(string) that is the FOV of a point.
	//Use it when throwing something like arrow or spell.

	var gw = ds_grid_width(obj_creator.Room_Grid);
	var gh = ds_grid_height(obj_creator.Room_Grid);

	var tmp_grid = ds_grid_create(gw, gh);


	ds_grid_clear(tmp_grid, 0);


	var t_xxx, t_yyy, range, max_width, max_height, move_grid, fx, fy;

	move_grid = obj_creator.Room_Grid;

	fx = argument1 div Tile_Size * Tile_Size + Tile_Size/2;
	fy = argument2 div Tile_Size * Tile_Size + Tile_Size/2;

	t_xxx = fx div Tile_Size;
	t_yyy = fy div Tile_Size;

	max_width = room_width/Tile_Size-1;
	max_height = room_height/Tile_Size-1;

	range = argument0;

	var cx, cy, tt, stop, tt, i;

	for(i = 0; i < 360; i += 1)
	{
	stop = false;
	tt = 1;
    
	    do
	    {      
	    cx =  (fx+lengthdir_x(Tile_Size*tt, i)) div Tile_Size;
	    cy =  (fy+lengthdir_y(Tile_Size*tt, i)) div Tile_Size;
        
	        if (cx <= 0 || cx >= max_width || cy <= 0 || cy >= max_width)
	        {
	        ds_grid_set(tmp_grid, cx, cy, 1);
	        stop = true;
	        break;
	        }
   
	            if (ds_grid_get(move_grid, cx, cy) == 1)
	            {
	            ds_grid_set(tmp_grid, cx, cy, 1);
                    
	                if (cx == t_xxx)
	                {
	                ds_grid_set(tmp_grid, cx-1, cy, 1);
	                ds_grid_set(tmp_grid, cx+1, cy, 1);
	                }
                    
	                if (cy == t_yyy)
	                {
	                ds_grid_set(tmp_grid, cx, cy-1, 1);
	                ds_grid_set(tmp_grid, cx, cy+1, 1);
	                }
	            }                
                
                
	            else
	            {
	            ds_grid_set(tmp_grid, cx, cy, 1);
                
	                if (cx == t_xxx)
	                {
	                ds_grid_set(tmp_grid, cx-1, cy, 1);
	                ds_grid_set(tmp_grid, cx+1, cy, 1);
	                }
                    
	                if (cy == t_yyy)
	                {
	                ds_grid_set(tmp_grid, cx, cy-1, 1);
	                ds_grid_set(tmp_grid, cx, cy+1, 1);
	                }
                 
	            stop = true;
	            i+=3;
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


	var grid_string = ds_grid_write(tmp_grid);
	ds_grid_destroy(tmp_grid);

	return grid_string;



}
