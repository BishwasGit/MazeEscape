/*
The obj_turn add all obj_dynamic child's id to a priority list and gives turn one by one.
When it gives a turn, it waits for that instance that its variable Has_Turn turn back to 0.
*/
Turn_Index = 0;

State = "give_action_point";

Turn_List = ds_priority_create();

Selected = noone;

/* */
/*  */
