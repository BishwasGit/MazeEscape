/// @description scr_loot_find_item_name(name(string))
/// @param name(string
function scr_loot_find_item_name(argument0) {
	//return the item ID on the global.items grid.

	var gh = ds_grid_height(global.items)-1;


	return ds_grid_value_y(global.items, 0, 0, 0, gh, argument0);



}
