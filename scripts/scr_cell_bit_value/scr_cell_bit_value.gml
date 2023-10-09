/// @description scr_cell_bit_value(xx,yy)
/// @param xx
/// @param yy
function scr_cell_bit_value(argument0, argument1) {
	//Return the bit value of the cell according to the 4 sides. up down left and right.
	/*
	The tile has a starting value of 0.
	If a tile is up we add 1.
	If a tile is right we add 2.
	If a tile is down we add 4.
	If a tile is left we add 8.
	So we'll have a value from 0 to 15, the 16 possibilities.
	*/

	var xx, yy, t_cell, value;

	xx = argument0;
	yy = argument1;
	value = 0;


	if (yy > 0 && ds_grid_get(obj_creator.Room_Grid, xx, yy-1) == 0)
	{
	value += 1;
	}
	if (xx < obj_creator.Grid_Width-1 && ds_grid_get(obj_creator.Room_Grid, xx+1, yy) == 0)
	{
	value += 2;
	}
	if (yy < obj_creator.Grid_Height-1 && ds_grid_get(obj_creator.Room_Grid, xx, yy+1) == 0)
	{
	value += 4;
	}
	if (xx > 0 && ds_grid_get(obj_creator.Room_Grid, xx-1, yy) == 0)
	{
	value += 8;
	}

	return value;



}
