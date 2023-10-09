function scr_monster_action_attack() {
	//scr_monster_action_attack()
	scr_attack_melee(id, Target.id, 1, DAMAGE_NORMAL);
	effect_create_above(ef_spark, x+Tile_Size/2, y+Tile_Size/2, 1, c_red);

	Current_Action_Point = 0;
	State = "seek";



}
