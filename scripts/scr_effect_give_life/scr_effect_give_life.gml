/// @description scr_effect_give_life(id, amount)
/// @param id
/// @param  amount
function scr_effect_give_life(argument0, argument1) {

	var entity = argument0;
	var amount = argument1;

	with(entity)
	{
	Mysheet[S_MOD,S_LIFE] = min(0,Mysheet[S_MOD,S_LIFE]+amount);
	Update = 1;
	}



}
