/// @description scr_is_on_view(id)
/// @param id
function scr_is_on_view(argument0) {
	//Return true if instance is on view[0]


	if (argument0.x >= __view_get( e__VW.XView, 0 ) && argument0.x < __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+Tile_Size && argument0.y >= __view_get( e__VW.YView, 0 ) && argument0.y < __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )+Tile_Size)
	{
	return true;
	}
	else
	{
	return false;
	}



}
