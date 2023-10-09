/// @description scr_change_grid_to_tile_around_cell(xx,yy)
/// @param xx
/// @param yy
function scr_change_grid_to_tile_around_cell(argument0, argument1) {
	//Update a tile when Room_Grid changes. Use it when removing a wall.

	var sx, sy, xx, yy, value, bit_value, tile_value;

	sx = argument0;
	sy = argument1;

	for(yy=-1; yy<2; yy++)
	{
	    for(xx=-1; xx<2; xx++)
	    {
	    value = ds_grid_get(obj_creator.Room_Grid, sx+xx, sy+yy);
	    tile_value = tile_layer_find(5555, (sx+xx)*Tile_Size, (sy+yy)*Tile_Size);
    
	        if (tile_value != -1)
	        {
	        tile_layer_delete_at(5555, (sx+xx)*Tile_Size, (sy+yy)*Tile_Size);
	        }
    
	        if (value == 0)
	        {
	        bit_value = scr_cell_bit_value(sx+xx,sy+yy);
	        tile_add(obj_creator.Style_Wall, 2+bit_value*(Tile_Size+4), 2, Tile_Size, Tile_Size, (sx+xx)*Tile_Size, (sy+yy)*Tile_Size, 5555);
	        }
	    }
	}



}
