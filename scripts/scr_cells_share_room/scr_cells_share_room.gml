/// @description scr_cells_share_room(xx1, yy1, xx2, yy2)
/// @param xx1
/// @param  yy1
/// @param  xx2
/// @param  yy2
function scr_cells_share_room(argument0, argument1, argument2, argument3) {
	//Return true if xx1/yy1 is in the same room(area) of xx2/yy2

	var x1, x2, y1, y2, cell, zone1, zone2;

	x1 = argument0;
	y1 = argument1;
	x2 = argument2;
	y2 = argument3;
	grid = obj_creator.Area_Grid;


	if (ds_grid_get(grid, x1, y1) == ds_grid_get(grid, x2, y2))
	{
	return true;
	}
	else
	{
	return false;
	}



}
