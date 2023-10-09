/// @description scr_attack_melee(attacker_id, defender_id, damage, type)
/// @param attacker_id
/// @param  defender_id
/// @param  damage
/// @param  type
function scr_attack_melee(argument0, argument1, argument2, argument3) {

	var attacker = argument0;
	var defender = argument1;
	var damage = argument2;
	var type = argument3;

	scr_text_value(x, y, c_white, "", string(attacker.Mysheet[S_TOTAL,S_NAME]) +" attacks "+string(defender.Mysheet[S_TOTAL,S_NAME]));


	//var factor = defender.Mysheet[S_TOTAL,S_AGILITY]-defender.Mysheet[S_TOTAL,S_AGILITY]

	if (scr_dice_test(20, -(defender.Mysheet[S_TOTAL,S_AGILITY])))
	{
	scr_apply_damage(defender, damage, type);
	}
	else
	{
	scr_text_value(attacker.x+Tile_Size/2, attacker.y, c_white, "Miss!", "Miss!");
	}


	Current_Action_Point -= 1;



}
