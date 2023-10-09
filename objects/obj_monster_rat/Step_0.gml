event_inherited();

if (Has_Turn)
{
switch (State)
{
    case "sleep": scr_monster_action_sleep(); break;
    case "seek": scr_monster_action_seek(); break;
    case "chase": scr_monster_action_chase(); break;
    case "attack": scr_monster_action_attack(); break;
}
 
    if (ds_grid_get(obj_light.Light_Grid, x div Tile_Size, y div Tile_Size))
    {
    visible = 1;
    }
    else
    {
    visible = 0;
    }

    if (Current_Action_Point == 0)
    {
    Has_Turn = 0;
    }
}

