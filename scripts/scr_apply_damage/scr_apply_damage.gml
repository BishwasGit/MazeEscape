/// @description scr_apply_damage(id, damage, type)
/// @param id
/// @param  damage
/// @param  type
function scr_apply_damage(argument0, argument1, argument2) {


	var target = argument0;
	var damage = argument1;
	var type = argument2;

	if (type == DAMAGE_NORMAL) //You should add more type like poison, fire, etc...
	{
	var protection = target.Mysheet[S_TOTAL,S_PROTECTION];
	var hit = 0;
	var miss = 0;

	    repeat(damage)
	    {
	        if (irandom_range(1,20) <= protection)
	        {
	        miss++;
	        }
	        else
	        {
	        hit++;
	        }
	    }


	    if (hit >= 0)
	    {
	    target.Mysheet[S_MOD,S_LIFE] -= 1;
	    target.Update = 1;
	    scr_text_value(target.x+Tile_Size/2, target.y, c_white, string(hit)+"/"+string(damage), "Life decreased.");
	    }
	    else
	    {
	    scr_text_value(target.x+Tile_Size/2, target.y, c_white, string(hit)+"/"+string(damage), "Armor saves!");
	    }    
	}



}
