/// @description scr_item_use_potion(id, item id)
/// @param id
/// @param  item id
function scr_item_use_potion(argument0, argument1) {

	var category = ds_grid_get(global.items, I_CATEGORY, argument1);
	var value = ds_grid_get(global.items, I_VAL_1, argument1);

	if (category == "healing")
	{
	scr_effect_give_life(argument0, value);
	}
	else
	{
	//add more like antidote, strength, etc...
	}



}
