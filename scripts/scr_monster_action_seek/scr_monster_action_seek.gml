function scr_monster_action_seek() {
	//scr_monster_action_seek()
	//Decide what to do: attack, get back to sleep or chase target.

	if (scr_cell_is_around_cell(x, y, Target.x, Target.y))
	{
	State = "attack";
	}
	else if (scr_target_in_earing_range(id, Target))
	{
	State = "chase";
	}
	else
	{
	State = "sleep";
	Current_Action_Point = 0;
	}



}
