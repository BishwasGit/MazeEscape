function scr_player_action_activate_static() {
	//scr_player_action_activate_static()
	//Look for a static object under the player. If one, it will be activated. (on/off lamp, chest, pick up items, etc...)

	if (keyboard_check_pressed(vk_space))
	{
	io_clear();
	var tmp_list = ds_priority_create();


	    with(obj_static)
	    {
	        if (x == obj_player.x && y == obj_player.y)
	        {
	        ds_priority_add(tmp_list, id, depth); //Acivate by depth.
	        }
	    }

	    if (!ds_priority_empty(tmp_list))
	    {
	    Current_Action_Point -= 1;
	    var item = ds_priority_find_min(tmp_list);
	    item.Is_Activated = 1;
	    }

	ds_priority_destroy(tmp_list);
	}



}
