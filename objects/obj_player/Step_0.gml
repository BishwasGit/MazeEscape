event_inherited();

if (Has_Turn)
{

scr_player_action_movement();

scr_player_action_reveal_hiden_object();

scr_player_action_activate_static();

    //Attack
    if (mouse_check_button_pressed(mb_left) && scr_cell_is_around_cell(x, y, mouse_x, mouse_y))
    {        
    Target = instance_position(mouse_x, mouse_y, obj_dynamic);

        if (Target != noone)
        {
        scr_attack_melee(id, Target, Damage, Damage_Type);
        }
    Target = noone;
    }
    
    else if (mouse_check_button_pressed(mb_right) && scr_LOS(Mysheet[S_TOTAL,S_FOV], x, y, mouse_x, mouse_y)) //This is an imcomplete way the throw a rock or an arrow
    {
        if (choose(0,1))
        {    
        scr_moving_effect(spr_fx_rock, 0, x+Tile_Size/2, y+Tile_Size/2, mouse_x, mouse_y, snd_sparkle, 1, "rock_normal", 1);
        }
        else
        {
        scr_moving_effect(spr_fx_arrow, 0, x+Tile_Size/2, y+Tile_Size/2, mouse_x, mouse_y, snd_sparkle, 0, "arrow_normal", 1);
        }
    }
    
    if (Current_Action_Point < 1 || Current_Movement_Point < 1)
    {
    Has_Turn = 0;
    }
}

