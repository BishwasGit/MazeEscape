/// @description scr_random_item_id()
function scr_random_item_id() {
	//return a random id of an item on the global.items grid.

	var chance = irandom_range(1,100);
	var loot = "gold";

	if (chance <=50)
	{
	loot = "gold";
	}
	else if (chance > 50 && chance < 75)
	{
	loot = "gear";
	}
	else
	{
	loot = "tool";
	}

	if (loot == "gold")
	{
	return scr_loot_find_item_name("Gold");
	}
	else if (loot == "gear")
	{
	var result, t_type;

	t_type[0] = "weapon";
	t_type[1] = "shield";
	t_type[2] = "helm";
	t_type[3] = "cape";
	t_type[4] = "armor";
	t_type[5] = "glove";
	t_type[6] = "boot";
	t_type[7] = "belt";
	t_type[8] = "helm";
	t_type[9] = "missile";



	    if (irandom_range(1,100) <= 40)
	    {
	        if (irandom_range(1,100) <= 70)
	        {
	        result = 0;
	        }
	        else
	        {
	        result = 9;
	        }
	    }
	    else
	    {
	    result = irandom_range(0, 8);
	    }

	return scr_loot_find_item_type(t_type[result]);
	}
	else if (loot == "tool")
	{
	return scr_loot_find_item_type("potion");
	}



}
