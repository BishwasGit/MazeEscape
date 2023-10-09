function scr_fill_static_with_random_loot() {
	var rnd_loot = scr_random_item_id();
	var rnd_nmb = scr_random_item_id_quantity(rnd_loot);

	var t_position, t_qty;

	t_position = ds_list_find_index(Loot_List_Id, rnd_loot);

	if (t_position == -1)
	{
	ds_list_add(Loot_List_Id, rnd_loot);
	ds_list_add(Loot_List_Qty, rnd_nmb);
	}
	else
	{
	t_qty = ds_list_find_value(Loot_List_Qty, t_position);
	ds_list_replace(Loot_List_Qty, t_position, rnd_nmb+t_qty);
	}

         
	event_user(0);



}
