/// @description scr_inventory_resize()
function scr_inventory_resize() {
	//Not use on that project.

	/*
	Resizes the inventory and sorts items by type, stacking the maximum possible.
	Note that SLOTS are keeped.
	You can make it 500x500...but that's huge! :)
	Also, you may fix a minimum and a maximum size.
	*/
	/*
	var tmp_width, tmp_height;
	tmp_width = get_integer('Enter new width', 4);
	tmp_height = get_integer('Enter new height', 4);

	var min_height_size, min_width_size, min_height_size, min_width_size;

	//Set the maximum and minimum size.
	min_width_size = 2;
	min_height_size = 2;
	max_width_size = 16;
	max_height_size = 16;

	//Security control! We need a valid size. 
	if ((!is_real(tmp_width) || !is_real(tmp_height)) || (tmp_width < min_width_size || tmp_height < min_height_size) || (tmp_width > max_width_size || tmp_height > max_height_size))
	{
	show_message('Invalid size!');
	exit;
	}



	if (obj_inventory.Tmp_Selected != -1) //First, place Selected item on the inventory. (if one selected!)
	{
	scr_inventory_add_item(obj_inventory.Tmp_Selected, obj_inventory.Tmp_Qty);
	}

	//Reset selection
	obj_inventory.Tmp_Selected = -1;
	obj_inventory.Tmp_Sprite = -1;
	obj_inventory.Tmp_Qty = -1;
	obj_inventory.Item_Selected = -1;
	obj_inventory.State = 'wait';

	var new_inv_height, new_inv_width, list, tmp_cell_qty, tmp_nmb_of_slots, cell_val, cell_qty, index_val, index_qty;

	new_inv_width = tmp_width;
	new_inv_height = tmp_height;

	//Backup inventory into 2 lists. 1 list for id and 1 list for quantity. (Index of second list matches with the first list)
	list[0] = ds_list_create();
	list[1] = ds_list_create();
	tmp_cell_qty = array_height_2d(obj_inventory.Array_Inv);
	tmp_nmb_of_slots = obj_inventory.Nmb_of_Slots;
  
	//Scan the inventory (not ehe slots) and fill both list.
	    for(i=tmp_nmb_of_slots; i<tmp_cell_qty; i++) //i=tmp_nmb_of_slots = If we have slots, we start scanning for backup after.
	    {
	    cell_val = obj_inventory.Array_Inv[i,0];
        
	        if (cell_val != -1)
	        {
	        cell_qty = obj_inventory.Array_Inv[i,1];
	        index_val = ds_list_find_index(list[0], cell_val);
            
	            if (index_val !=-1) //Stack together items of the same type
	            {
	            index_qty = ds_list_find_value(list[1], index_val);
	            ds_list_replace(list[1], index_val, index_qty+cell_qty);
	            }
	            else
	            {
	            ds_list_add(list[0], cell_val);
	            ds_list_add(list[1], cell_qty);
	            }
	        }
	    obj_inventory.Array_Inv[i,0] = -1;
	    obj_inventory.Array_Inv[i,1] = 0;
	    }

	//Backup slots on tmp_array.
	var tmp_2d_length, tmp_array, tmp_nmb_of_slots, i, z;

	tmp_2d_length = array_length_2d(obj_inventory.Array_Inv, 0);
	tmp_array = 0;
	tmp_nmb_of_slots = obj_inventory.Nmb_of_Slots;

	for(i=0; i<tmp_nmb_of_slots; i++)
	{
	    for(z=0; z<tmp_2d_length; z++)
	    {
	    tmp_array[i,z] = obj_inventory.Array_Inv[i,z];
	    }
	}

	obj_inventory.Array_Inv = 0; //Delete the Array_Inv array.

	for(i=0; i<tmp_nmb_of_slots; i++)
	{
	    for(z=0; z<tmp_2d_length; z++)
	    {
	    obj_inventory.Array_Inv[i,z] = tmp_array[i,z];
	    }
	}


	//Resize inventory.
	obj_inventory.Inv_Width = new_inv_width;
	obj_inventory.Inv_Height = new_inv_height;

	var xx, yy, tmp_cell_index;

	xx = 0;
	yy = 0;

	tmp_cell_index = obj_inventory.Nmb_of_Slots;

	//Rebuild array with the new size.
	repeat(new_inv_height)
	{
	xx = 0;

	    repeat(new_inv_width)
	    {
	    obj_inventory.Array_Inv[tmp_cell_index,0] = -1;
	    obj_inventory.Array_Inv[tmp_cell_index,1] = 0;
	    obj_inventory.Array_Inv[tmp_cell_index,2] = 'none';
	    obj_inventory.Array_Inv[tmp_cell_index,3] = obj_inventory.Xbox+xx*obj_inventory.Inv_Cell_Size;
	    obj_inventory.Array_Inv[tmp_cell_index,4] = obj_inventory.Ybox+yy*obj_inventory.Inv_Cell_Size;
	    xx += 1;
	    tmp_cell_index += 1;
	    }
    
	yy += 1;
	}



	var tmp_item, tmp_qty;

	//Re-fill it up
	while (!ds_list_empty(list[0]))
	{
	tmp_item = ds_list_find_value(list[0], 0);
	tmp_qty = ds_list_find_value(list[1], 0);
	scr_inventory_add_item(tmp_item, tmp_qty);
	ds_list_delete(list[0], 0);
	ds_list_delete(list[1], 0);
	}

	//Clean up memory.
	ds_list_destroy(list[0]);
	ds_list_destroy(list[1]);


/* end scr_inventory_resize */
}
