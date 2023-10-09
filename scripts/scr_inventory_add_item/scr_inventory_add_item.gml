/// @description scr_inventory_add_item(item_id, quantity)
/// @param item_id
/// @param  quantity
function scr_inventory_add_item(argument0, argument1) {
	/*
	Add a quantity of an item on inventory. It prioritizes to fill stack of the same type.
	If no place available, that item is dropped on the floor at obj_player.x/y
	*/

	var item_val, item_qty, max_stack, cell_qty, nmb_of_cells, amount, i, tmp_nmb_of_slots;

	item_val = argument0;
	item_qty = argument1;
	max_stack = ds_grid_get(global.items, I_STACK, item_val);

	if (item_qty < 1)
	{
	exit;
	}

	nmb_of_cells = array_height_2d(obj_inventory.Array_Inv);
	cell_qty = 0;

	//First scan will fill cell containing the same item
	for(i=0; i<nmb_of_cells; i++)
	{
	    if (obj_inventory.Array_Inv[i,0] == item_val)
	    {
	    cell_qty = obj_inventory.Array_Inv[i,1];
	    amount = min(item_qty, max_stack-cell_qty);
	    obj_inventory.Array_Inv[i, 1] += amount;
	    item_qty -= amount;
        
	        if (item_qty == 0) //No more item, break!
	        {
	        break;
	        }
	    }

	}

	tmp_nmb_of_slots = obj_inventory.Nmb_of_Slots;

	//Second scan will fill first empty cell met if restriction is met. No item will be added on the slots.
	if (item_qty > 0)
	{
	    for(i=tmp_nmb_of_slots; i<nmb_of_cells; i++)
	    {
	        if (obj_inventory.Array_Inv[i,0] == -1 && scr_inventory_item_restriction(item_val, i))
	        {
	        obj_inventory.Array_Inv[i,0] = item_val;
	        amount = min(item_qty, max_stack);
	        obj_inventory.Array_Inv[i, 1] += amount;
	        item_qty -= amount;
            
	            if (item_qty == 0) //No more item, break!
	            {
	            break;
	            }
	        }
    
	    }
	}


	with(obj_inventory)
	{
	event_user(0);
	}


	if (item_qty)//We can't place items on the inventory, drop them.
	{
	scr_inventory_drop_item(item_val, item_qty, obj_player.x, obj_player.y);
	}



}
