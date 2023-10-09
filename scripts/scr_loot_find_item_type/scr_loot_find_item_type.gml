/// @description scr_loot_find_item_type(I_TYPE(string))
/// @param I_TYPE(string
function scr_loot_find_item_type(argument0) {
	//return a random id with the given type.

	var gh = ds_grid_height(global.items)-1;
	var type;
	var item_type = argument0
	var plane = obj_creator.Current_Plane;
	var tmp_plane;

	if (irandom_range(1,100) <= 5)
	{
	plane = 20;
	}

	do
	{
	item_id = irandom_range(0, gh);

	type = ds_grid_get(global.items, I_TYPE, item_id);
	tmp_plane = ds_grid_get(global.items, I_LOOT_LEVEL, item_id);

	}
	until(type == argument0 && tmp_plane <= plane)

	return item_id;



}
