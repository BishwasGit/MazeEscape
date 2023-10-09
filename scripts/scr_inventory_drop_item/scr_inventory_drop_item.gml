/// @description scr_inventory_drop_item(item_id, quantity, x, y)
/// @param item_id
/// @param  quantity
/// @param  x
/// @param  y
function scr_inventory_drop_item(argument0, argument1, argument2, argument3) {
	/*
	Can be use to creates an item at X/Y or drop item from inventory.
	This is a script you'll use when a monster drop something, when a chest is being opened, etc...
	*/

	var item_id, quantity, x1, y1;

	item_id = argument0;
	quantity = argument1;
	x1 = argument2;
	y1 = argument3;



	with(instance_create(x1, y1, obj_item))
	{
	    if (scr_is_on_view(id))
	    {
	        if (ds_grid_get(global.items, I_NAME, item_id) == "Gold")
	        {
	        audio_sound_pitch(audio_play_sound(snd_gold, 1, false), choose(0.8, 1, 1.2));
	        }
	        else
	        {
	        audio_play_sound(snd_drop_item, 1, 0);
	        }
	    }

	ds_list_add(List[0], item_id);
	ds_list_add(List[1], quantity);
	event_user(0);
	alarm[0] = 1;
	}



}
