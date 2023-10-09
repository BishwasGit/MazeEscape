/// @description scr_moving_effect(sprite,image_index,fx,fy,tx,ty,sound1,rotate,script,power)
/// @param sprite
/// @param image_index
/// @param fx
/// @param fy
/// @param tx
/// @param ty
/// @param sound1
/// @param rotate
/// @param script
/// @param power
function scr_moving_effect(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) {

	var sprite = argument0;
	var i_index = argument1;
	var fx = argument2;
	var fy = argument3;
	var tx = argument4;
	var ty = argument5;
	var sound1 = argument6;
	var rotate = argument7;
	var s_script = argument8;
	var p_power = argument9;


	audio_play_sound(sound1, 1, 0);
	global.wait_effect = 1;

	with(instance_create(fx, fy, obj_moving_effect))
	{
	sprite_index = sprite;
	image_index = i_index;
	image_speed = 0.2;
	Target_X = tx;
	Target_Y = ty;
	Destroy_Scipt = s_script;
	Rotate = rotate;
	P_Power = p_power;
	D_Direction = point_direction(x, y, Target_X, Target_Y);
	}



}
