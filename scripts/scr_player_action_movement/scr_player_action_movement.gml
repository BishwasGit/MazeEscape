function scr_player_action_movement() {
	//scr_player_action_movement()

	var move_x = 0;
	var move_y = 0;


	if (keyboard_check(ord("W")))
	{
	move_y -= Tile_Size;
	}
	else if (keyboard_check(ord("S")))
	{
	move_y += Tile_Size;
	}
	else if (keyboard_check(ord("A")))
	{
	Face_Right = 0;
	move_x -= Tile_Size;
	}
	else if (keyboard_check(ord("D")))
	{
	Face_Right = 1;
	move_x += Tile_Size;
	}

	if (move_x != 0 || move_y != 0)
	{
	var cell_value = ds_grid_get(obj_creator.Room_Grid, (x+move_x) div Tile_Size, (y+move_y) div Tile_Size);
	var can_move = 0;

	    if (cell_value != 0 && instance_position(x+move_x, y+move_y, obj_dynamic) == noone)
	    {
	        if (cell_value == 1)
	        {
	        can_move = 1;
	        }
	        else if (cell_value == 2)
	        {
	        var door_id = instance_position(x+move_x, y+move_y, obj_door);
        
	            if (door_id != noone)
	            {
	                if (door_id.Type != "locked door")
	                {
	                can_move = 1;
	                }
	            }
	            else
	            {
	            can_move = 1;
	            }
	        }
        
	        if (can_move)
	        {
	        x += move_x;
	        y += move_y;
	        obj_light.Light_Update = 1;
	        obj_map.alarm[0] = 1;            
	        Current_Movement_Point -= 1;
	        }
	    }
    
	scr_set_depth(id, -200);
	}



}
