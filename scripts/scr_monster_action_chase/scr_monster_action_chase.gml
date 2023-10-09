function scr_monster_action_chase() {
	//scr_monster_action_chase
	//Take steps to the target.

	scr_find_grid_path(id, Target.x, Target.y, 0, Tile_Size);
	State = "seek";



}
