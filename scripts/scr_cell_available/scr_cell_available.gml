/// @description scr_cell_available(xx,yy, radius, dynamic)
/// @param xx
/// @param yy
/// @param  radius
/// @param  dynamic
function scr_cell_available(argument0, argument1, argument2, argument3) {
	//Return true if cell is available (no obj_static is standing on cell and if == 1 on Room_Grid.)
	//Set Dynamic to true to check for dynamic instance too.

	var xx, yy, occupied, dynamic;

	var cx = argument0;
	var cy = argument1;
	var factor = argument2;
	var dynamic = argument3;

	occupied = 0;

	for(yy=-factor; yy<factor+1; yy++)
	{
	    for(xx=-factor; xx<factor+1; xx++)
	    {
	        if (ds_grid_get(obj_creator.Room_Grid, cx+xx, cy+yy) != 1 || instance_position((cx+xx)*Tile_Size, (cy+yy)*Tile_Size, obj_static) != noone)
	        {
	        occupied++;
	        }
        
	        if (dynamic)
	        {
	            if (instance_position((cx+xx)*Tile_Size, (cy+yy)*Tile_Size, obj_dynamic) != noone)
	            {
	            occupied++;
	            }
	        }
	    }
	}

	if (occupied)
	{
	return 0;
	}
	else
	{
	return 1;
	}



}
