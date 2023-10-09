/// @description scr_random_item_id_quantity(item id)
/// @param item id
function scr_random_item_id_quantity(argument0) {
	//Return a random quantiy of an item.

	var type = ds_grid_get(global.items, I_TYPE, argument0);

	if (type == "gold")
	{
	return irandom_range(1, obj_creator.Current_Plane*25);
	}

	else if (type == "missile")
	{
	return irandom_range(1,10);
	}
	else if (type == "potion")
	{
	var val = ds_grid_get(global.items, I_VAL_1, argument0);
	var roll = irandom_range(1,100);

	    if (val == 1)
	    {
	        if (roll < 70)
	        {
	        return 2;
	        }
	    }
	    else if (val == 2)
	    {
	        if (roll < 90)
	        {
	        return 2;
	        }
	    }
	    else
	    {
	        if (roll == 100)
	        {
	        return 2;
	        }
	    }
	}

	return 1;



}
