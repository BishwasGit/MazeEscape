/// @description scr_inventory_sort()
function scr_inventory_sort() {
	//Regroups items by type, stacking the maximum possible. (Slots are not sorted. Only cells on the 'main' inventory will be.)


	if (obj_inventory.Tmp_Selected != -1) //First, place Selected item on the inventory if one selected.
	{
	scr_inventory_add_item(obj_inventory.Tmp_Selected, obj_inventory.Tmp_Qty);
	}

	//Reset
	scr_inventory_reset_selection(-1, "wait");


	var list, cell_val, cell_qty, index_val, index_qty, tmp_cells_qty, tmp_nmb_of_slots;

	list[0] = ds_list_create();
	list[1] = ds_list_create();

	//One list for item id/value and one list for the quantity


	//Scan the inventory grid and fill both list
	tmp_cells_qty = array_height_2d(obj_inventory.Array_Inv);
	tmp_nmb_of_slots = obj_inventory.Nmb_of_Slots;
    
	    for(i=tmp_nmb_of_slots; i<tmp_cells_qty; i++)
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


	var size, tmp_item, tmp_qty;

	//Refill inventory and emptied both list at the same time.
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



}
