/// @description scr_inventory_reset_selection(Item_Selected, State)
/// @param Item_Selected
/// @param  State
function scr_inventory_reset_selection(argument0, argument1) {

	obj_inventory.Item_Selected = argument0;
	obj_inventory.State = argument1;
	obj_inventory.Tmp_Selected = -1;
	obj_inventory.Tmp_Sprite = -1;
	obj_inventory.Tmp_Qty = -1;
	obj_inventory.Tmp_Image_Index = -1;



}
