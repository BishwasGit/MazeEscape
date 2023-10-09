function scr_player_set_damage_and_armor() {
	//Scr_player_set_damage()
	/*
	Considering that the 'main weapon' is on the right hand: Array_Inv[1,0]
	*/


	with(obj_player)
	{
	Damage = 1;
	Damage_Type = DAMAGE_NORMAL;
	Mysheet[S_MOD,S_PROTECTION] = 0;

	//Damage
	var cell = obj_inventory.Array_Inv[1,0];

	    if (cell != -1 && ds_grid_get(global.items, I_TYPE, cell) == "weapon")
	    {
	    Damage = ds_grid_get(global.items, I_VAL_1, cell);
	    Damage_Type = DAMAGE_NORMAL; //modify that value if you add enchantment...maybe...
	    }
    
	//Armor
	var i;

	    for(i=2; i<8; i++)
	    {
	    cell = obj_inventory.Array_Inv[i,0];
        
	        if (cell != -1)
	        {
	        Mysheet[S_MOD,S_PROTECTION] += ds_grid_get(global.items, I_VAL_1, cell);
	        }
        
	    }
    
	Update = 1;
	}



}
