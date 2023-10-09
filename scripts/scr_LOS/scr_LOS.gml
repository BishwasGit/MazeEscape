/// @description scr_LOS(radius, x1, y1, x2, y2)
/// @param radius
/// @param  x1
/// @param  y1
/// @param  x2
/// @param  y2
function scr_LOS(argument0, argument1, argument2, argument3, argument4) {
	//return true if x2/y2 is on the FOV of x1/y1

	if (argument1 div Tile_Size == argument3 div Tile_Size && argument2 div Tile_Size == argument4 div Tile_Size)
	{
	return 1;
	}

	var tmp_grid = ds_grid_create(0,0);

	var tx, ty, fov;

	fov = argument0;

	tx = argument3 div Tile_Size;
	ty = argument4 div Tile_Size;

	ds_grid_read(tmp_grid, scr_FOV_grid(fov, argument1, argument2));

	var is_on_sight = ds_grid_get(tmp_grid, tx, ty);

	ds_grid_destroy(tmp_grid);

	return is_on_sight;



}
