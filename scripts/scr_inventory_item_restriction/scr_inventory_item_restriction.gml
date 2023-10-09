/// @description scr_inventory_item_restriction(item id, Cell_Index)
/// @param item id
/// @param  Cell_Index
function scr_inventory_item_restriction(argument0, argument1) {
	/*
	Return true if item meets restriction(Type) on Cell_Index.
	*/

	var tmp_item_id, tmp_cell_index, item_restriction, cell_restriction;

	tmp_item_id = argument0;
	tmp_cell_index = argument1;

	item_restriction = ds_grid_get(global.items, I_TYPE, tmp_item_id);

	cell_restriction = obj_inventory.Array_Inv[tmp_cell_index, 2];


	if (item_restriction == cell_restriction || cell_restriction == "none")
	{
	return 1;
	}
	else
	{
	return 0;
	}



}
