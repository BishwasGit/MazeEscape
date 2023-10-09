/// @description scr_inventory_add_item_pos(item_id, quantity, Cell index)
/// @param item_id
/// @param  quantity
/// @param  Cell index
function scr_inventory_add_item_pos(argument0, argument1, argument2) {
	//Add item on inventory at a fixed position(Cell_Index). If no place available, it will be place where it's free or dropped.

	var item_val, item_qty, max_stack, cell_val, cell_qty, amount, tmp_cell_index;

	item_val = argument0;
	item_qty = argument1;
	max_stack = ds_grid_get(global.items, I_STACK, item_val);
	tmp_cell_index = argument2;

	if (item_qty < 1)
	{
	exit;
	}


	cell_val = 0;
	cell_qty = 0;

    
	cell_val = obj_inventory.Array_Inv[tmp_cell_index, 0];
	cell_qty = obj_inventory.Array_Inv[tmp_cell_index, 1];
           
	if (cell_val == -1 && scr_inventory_item_restriction(item_val, tmp_cell_index)) //Empty cell if restriction is met.
	{
	obj_inventory.Array_Inv[tmp_cell_index, 0] = item_val;
	amount = min(item_qty, max_stack);
	obj_inventory.Array_Inv[tmp_cell_index, 1] += amount;
	item_qty -= amount;
	}
	else if (cell_val == item_val) //Cell with the same type.
	{
	amount = min(item_qty, max_stack-cell_qty);
	obj_inventory.Array_Inv[tmp_cell_index, 1] += amount;
	item_qty -= amount;
	}
           
	if (item_qty) //We can't place that item on that cell, we'll try to place it elsewhere:
	{
	scr_inventory_add_item(item_val, item_qty);
	}

	with(obj_inventory)
	{
	event_user(0);
	}



}
