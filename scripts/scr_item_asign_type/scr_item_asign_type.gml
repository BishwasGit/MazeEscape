/// @description scr_item_asign_type(string, type) //'string', 'real', 'asset'
/// @param string
/// @param  type
function scr_item_asign_type(argument0, argument1) {

	//Easy one: read the string, return value into the good type.

	if (argument1 == "string")
	{
	return string(argument0);
	}
	else if (argument1 == "real")
	{
	return real(argument0);
	}

	else if (argument1 == "asset")
	{
	return asset_get_index(argument0);
	}



}
