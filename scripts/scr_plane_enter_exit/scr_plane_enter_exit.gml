/// @description scr_plane_enter_exit()
function scr_plane_enter_exit() {
	//Place the entering point and the exit.

	var x1, y1, x2, y2, tmp_room;

	tmp_room = scr_room_list(1);

	x1 = floor(Area[tmp_room,4] + (Area[tmp_room,6] - Area[tmp_room,4])/2);
	y1 = floor(Area[tmp_room,5] + (Area[tmp_room,7] - Area[tmp_room,5])/2);

	instance_create(x1*Tile_Size, y1*Tile_Size, obj_enter);

	tmp_room = scr_room_list(1);

	x1 = floor(Area[tmp_room,4] + (Area[tmp_room,6] - Area[tmp_room,4])/2);
	y1 = floor(Area[tmp_room,5] + (Area[tmp_room,7] - Area[tmp_room,5])/2);

	instance_create(x1*Tile_Size, y1*Tile_Size, obj_exit);

	obj_player.x = obj_enter.x;
	obj_player.y = obj_enter.y;



}
