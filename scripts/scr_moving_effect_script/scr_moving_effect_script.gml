/// @description scr_moving_effect_script(Destroy_Scipt, P_Power)
/// @param Destroy_Scipt
/// @param  P_Power
function scr_moving_effect_script(argument0, argument1) {

	var s_script = argument0;
	var p_power = argument1;

	if (s_script == "arrow_normal")
	{
	effect_create_above(ef_explosion, x, y, 0, c_olive);
	}
	else if (s_script == "rock_normal")
	{
	effect_create_above(ef_explosion, x, y, 0, c_orange);
	}

	var entity = instance_position(x, y, obj_monster_rat);

	if (entity != noone)
	{
	scr_apply_damage(entity, p_power, DAMAGE_NORMAL);
	}



}
