function scr_inventory_position() {
	//scr_inventory_position()
	//recalculate the position of each cell on the 'main' inventory. (Not slots.)

	var xx, yy, tmp_cell_index, tmp_width, tmp_height;

	xx = 0;
	yy = 0;
	tmp_width = obj_inventory.Inv_Width;
	tmp_height = obj_inventory.Inv_Height;
	tmp_cell_index = obj_inventory.Nmb_of_Slots;

	repeat(tmp_height)
	{
	xx = 0;

	    repeat(tmp_width)
	    {
	    obj_inventory.Array_Inv[tmp_cell_index,3] = obj_inventory.Xbox+xx*obj_inventory.Inv_Cell_Size;
	    obj_inventory.Array_Inv[tmp_cell_index,4] = obj_inventory.Ybox+yy*obj_inventory.Inv_Cell_Size;
	    xx += 1;
	    tmp_cell_index += 1;
	    }
    
	yy += 1;
	}



}
