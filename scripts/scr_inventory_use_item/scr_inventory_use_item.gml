/// @description scr_inventory_use_item(id, item id)
/// @param id
/// @param  item id
function scr_inventory_use_item(argument0, argument1) {

	var name = ds_grid_get(global.items, I_NAME, argument1);
	var type = ds_grid_get(global.items, I_TYPE, argument1);

	if (type == "potion")
	{
	audio_play_sound(snd_bubble, 1, false);
	scr_item_use_potion(argument0, argument1);
	}
	//add more like scroll, artefact, etc...



}
