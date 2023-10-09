//Set Is_Activated to 1 to initialize 'pick up' sequence. It only pick up the last object on the list.

if (Is_Activated)
{
scr_sound_item_take(Item_Value);
scr_inventory_add_item(Item_Value, Item_Quantity);
var size = ds_list_size(List[0]);
ds_list_delete(List[0], size-1);
ds_list_delete(List[1], size-1);
event_user(0);
Is_Activated = 0;
}

if (Item_Value != -1)
{
T_Angle = (T_Angle + Increment) mod 360;
Shift = Amplitude * sin(degtorad(T_Angle));
}

