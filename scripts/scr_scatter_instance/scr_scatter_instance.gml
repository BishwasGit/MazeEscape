/// @description scr_scatter_instance(type, number, free radius around)
/// @param type
/// @param  number
/// @param  free radius around
function scr_scatter_instance(argument0, argument1, argument2) {
	//Scatter and object on the level. Nerver in the same room as the entering point.

	var xx, yy, tmp_chest, created;

	var gw, gh;
	gw = ds_grid_width(obj_creator.Room_Grid);
	gh = ds_grid_height(obj_creator.Room_Grid);

	created = argument0;

	repeat(argument1)
	{
	    do
	    {
	    xx = irandom_range(0,gw-1);
	    yy = irandom_range(0,gh-1);
	    }
	    until (scr_cell_available(xx,yy,argument2,1) && !scr_cells_share_room(xx, yy, obj_enter.x div Tile_Size, obj_enter.y div Tile_Size))

	instance_create(xx * Tile_Size, yy * Tile_Size, created);
	}



}
