/// @description scr_dice_test(Base_chance, Modifier) 
/// @param Base_chance
/// @param  Modifier
function scr_dice_test(argument0, argument1) {
	//A simple test dice test! 20 == failed, 1 == success.

	var roll = irandom_range(1,20);
	var chance = argument0+argument1;

	if (roll == 20)
	{
	return 0;
	}
	else if (roll == 1 || roll <= chance)
	{
	return 1;
	}
	else
	{
	return 0;
	}



}
