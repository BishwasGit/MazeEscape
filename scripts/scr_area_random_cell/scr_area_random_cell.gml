/// @description scr_area_random_cell(Area, array, value)
/// @param Area
/// @param  array
/// @param  value
function scr_area_random_cell(argument0, argument1, argument2) {
	//return an array of 2 indexes: X and Y of a cell with a value on an area.

	argument1[0] = 0; //x
	argument1[1] = 1; //y

	var x1, y1, value, t_c;

	t_c = argument2;

	value = 0;

	do
	{
	x1 = irandom_range(Area[argument0,0], Area[argument0,2]);
	y1 = irandom_range(Area[argument0,1], Area[argument0,3]);
	value = ds_grid_get(Room_Grid, x1, y1);
	}
	until(value == t_c)

	argument1[0] = x1; //x
	argument1[1] = y1; //y


	return argument1;



}
