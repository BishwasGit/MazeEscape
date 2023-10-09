/// @description scr_cell_is_around_cell(x1, y1, x2, y2)
/// @param x1
/// @param  y1
/// @param  x2
/// @param  y2
function scr_cell_is_around_cell(argument0, argument1, argument2, argument3) {
	//Return true is point x2,y2 is around on a cell around point x1,y1

	var xx1 = argument0 div Tile_Size;
	var yy1 = argument1 div Tile_Size;
	var xx2 = argument2 div Tile_Size;
	var yy2 = argument3 div Tile_Size;

	if (xx2 >= xx1-1 && xx2 <= xx1+1 && yy2 >= yy1-1 && yy2 <= yy1+1 && !(xx1 == xx2 && yy1 == yy2))
	{
	return 1;
	}
	else
	{
	return 0;
	}



}
