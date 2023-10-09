/// @description scr_set_depth(id, depth)
/// @param id
/// @param  depth
function scr_set_depth(argument0, argument1) {


	with(argument0)
	{
	depth =  argument1 - (y div Tile_Size) * 5;
	}



}
