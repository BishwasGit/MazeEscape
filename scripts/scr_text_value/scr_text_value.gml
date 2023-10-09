/// @description scr_text_value(x, y, color, text, console_text)
/// @param x
/// @param  y
/// @param  color
/// @param  text
/// @param  console_text
function scr_text_value(argument0, argument1, argument2, argument3, argument4) {

	var t_color = argument2;
	var o_text = argument3;
	var consoletext = argument4;

	if (o_text != "")
	{
	var aaa = instance_create(argument0, argument1, obj_text_value);
	aaa.Color = t_color;
	aaa.Text = o_text;
	}



	if (consoletext != "")
	{  
	    with(obj_display)
	    {
	    ds_list_add(Text_List, consoletext);
	    event_user(0);
	    }
	}



}
