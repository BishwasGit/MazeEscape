function scr_door_can_be_place(argument0, argument1) {
	//scr_door_can_be_place(x, y)
	//Return true if a door can be place at x y

	var xx, yy, t_cell;

	xx = argument0;
	yy = argument1;


	t_cell[0] = ds_grid_get(Room_Grid, xx, yy-1);
	t_cell[1] = ds_grid_get(Room_Grid, xx+1, yy);
	t_cell[2] = ds_grid_get(Room_Grid, xx, yy+1);
	t_cell[3] = ds_grid_get(Room_Grid, xx-1, yy);
    
	if ((t_cell[0]+t_cell[2] == 2 && t_cell[1]+t_cell[3] == 0) || (t_cell[0]+t_cell[2] == 0 && t_cell[1]+t_cell[3] == 2))
	{
	return true;
	}
	else
	{
	return false;
	}

	/*
	On the Room_Grid, a door can be place if:

	 1
	020
	 1

	or

	 0
	121
	 0


/* end scr_door_can_be_place */
}
