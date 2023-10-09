/// @description scr_target_in_earing_range(entity, target)
/// @param entity
/// @param  target
function scr_target_in_earing_range(argument0, argument1) {
	//Return true is target is in range of 'earing' (Less consuming than scr_LOS() )

	var entity = argument0;
	var target = argument1;

	if (point_distance(entity.x+Tile_Size/2, entity.y+Tile_Size/2, target.x+Tile_Size/2, target.y+Tile_Size/2) <= entity.Mysheet[S_TOTAL,S_FOV]*Tile_Size)
	{
	return true;
	}
	else
	{
	return false;
	}



}
