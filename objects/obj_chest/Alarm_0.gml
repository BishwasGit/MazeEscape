var last = ds_list_size(Loot_List_Id)-1;
var item = ds_list_find_value(Loot_List_Id, last);
var i_qty = ds_list_find_value(Loot_List_Qty, last);

ds_list_delete(Loot_List_Id, last);
ds_list_delete(Loot_List_Qty, last);

scr_inventory_drop_item(item, i_qty, x, y);

if (!ds_list_empty(Loot_List_Id))
{
alarm[0] = 10;
}

