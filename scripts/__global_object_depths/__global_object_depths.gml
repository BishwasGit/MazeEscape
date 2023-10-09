function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 0; // obj_dynamic
	global.__objectDepths[1] = 0; // obj_static
	global.__objectDepths[2] = 0; // obj_item_loader
	global.__objectDepths[3] = -999; // obj_inventory
	global.__objectDepths[4] = -195; // obj_item
	global.__objectDepths[5] = 0; // obj_creator
	global.__objectDepths[6] = 0; // obj_turn
	global.__objectDepths[7] = -200; // obj_door
	global.__objectDepths[8] = 0; // obj_display
	global.__objectDepths[9] = -200; // obj_player
	global.__objectDepths[10] = 0; // obj_camera
	global.__objectDepths[11] = -900; // obj_light
	global.__objectDepths[12] = -190; // obj_chest
	global.__objectDepths[13] = 0; // obj_enter
	global.__objectDepths[14] = 0; // obj_exit
	global.__objectDepths[15] = -200; // obj_monster_rat
	global.__objectDepths[16] = -190; // obj_lamp
	global.__objectDepths[17] = -999; // obj_text_value
	global.__objectDepths[18] = -200; // obj_moving_effect
	global.__objectDepths[19] = -999; // obj_map


	global.__objectNames[0] = "obj_dynamic";
	global.__objectNames[1] = "obj_static";
	global.__objectNames[2] = "obj_item_loader";
	global.__objectNames[3] = "obj_inventory";
	global.__objectNames[4] = "obj_item";
	global.__objectNames[5] = "obj_creator";
	global.__objectNames[6] = "obj_turn";
	global.__objectNames[7] = "obj_door";
	global.__objectNames[8] = "obj_display";
	global.__objectNames[9] = "obj_player";
	global.__objectNames[10] = "obj_camera";
	global.__objectNames[11] = "obj_light";
	global.__objectNames[12] = "obj_chest";
	global.__objectNames[13] = "obj_enter";
	global.__objectNames[14] = "obj_exit";
	global.__objectNames[15] = "obj_monster_rat";
	global.__objectNames[16] = "obj_lamp";
	global.__objectNames[17] = "obj_text_value";
	global.__objectNames[18] = "obj_moving_effect";
	global.__objectNames[19] = "obj_map";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
