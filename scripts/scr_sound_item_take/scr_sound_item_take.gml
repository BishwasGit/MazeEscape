/// @description scr_sound_item_take(item_value)
/// @param item_value
function scr_sound_item_take(argument0) {
	//Play a sound when an item is droped.

	var item_value = argument0;

	var type = ds_grid_get(global.items, I_TYPE, item_value);

	if  (type == "gold")
	{
	audio_sound_pitch(audio_play_sound(snd_gold, 1, false), choose(0.8, 1, 1.2));
	}
	else if  (type == "potion")
	{
	audio_play_sound(snd_take_item, 1, 0);
	}
	else
	{
	audio_play_sound(snd_take_item, 1, 0);
	}



}
