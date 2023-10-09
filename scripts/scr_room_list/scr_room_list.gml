/// @description scr_room_list(0 to initialize, 1 to get a number, 3 to destroy)
/// @param 0 to initialize
/// @param  1 to get a number
/// @param  3 to destroy
function scr_room_list(argument0) {
	/*
	This list is to avoid putting things on the same room.
	Like the entering point and the exit
	*/

	var count;

	if (argument0 == 0) //initialize
	{
	Room_List = ds_list_create();
	count = Nmb_of_Room-1;

	    repeat(Nmb_of_Room)
	    {
	    ds_list_add(Room_List, count);
	    count++;
	    }

	ds_list_shuffle(Room_List);
	}

	else if (argument0 == 3) //destroy the list when level creation is done.
	{
	ds_list_destroy(Room_List);
	}

	else if (!ds_list_empty(Room_List)) //Pick a room and remove it from the list.
	{
	var value = ds_list_find_value(Room_List, 0);
	ds_list_delete(Room_List, 0);
	return value;
	}



}
