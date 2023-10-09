if (State == "give_action_point")
{
Turn_Index += 1;

    with (obj_dynamic)
    {
    Current_Action_Point = Mysheet[S_TOTAL,S_ACTION_POINT];
    Current_Movement_Point = Mysheet[S_TOTAL,S_MOVEMENT];
    }

alarm[0] = 3;
State = "delay";
}

else if (State == "fill_list")
{
    with(obj_dynamic)
    {
        if (visible)
        {
        ds_priority_add(obj_turn.Turn_List, id, Mysheet[3,6]);
        }
        else
        {
        Has_Turn = 1;
        }
    }
State = "pick_selected";
}

if (State == "pick_selected")
{
    if (ds_priority_empty(Turn_List))
    {
    State = "give_action_point";
    Selected = noone;
    }
    else
    {
    Selected = ds_priority_delete_max(Turn_List);
        
        if (instance_exists(Selected))
        {
        Selected.Has_Turn = 1;
        Selected.Status_Update = 1;
        State = "wait_for_selected";
        }
    }
}

else if (State == "wait_for_selected")
{
    if (instance_exists(Selected))
    {
        if (Selected.Has_Turn == 0)
        {
        State = "pick_selected";
        }
    }
    else
    {
    State = "pick_selected";
    }
    
}

