function scr_monster_action_sleep() {
	if Target == noone
	{
	    if (visible)
	    {
	    scr_text_value(x, y, c_white, "zzz", "");
	    }
	}
	else
	{
	    if (scr_target_in_earing_range(id, Target.id) )
	    {
	        if (scr_dice_test(Mysheet[S_TOTAL,S_CONSCIOUSNESS], 0)) //Wake up
	        {
	        State = "seek";
	        exit;
	        }
	    }
	    else if (visible) //Keep sleeping
	    {
	    scr_text_value(x, y, c_white, "zzz", "");
	    }
	}
	Current_Action_Point = 0;
	Current_Movement_Point = 0;



}
