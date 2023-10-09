Loot_List_Id = ds_list_create();
Loot_List_Qty = ds_list_create();

Info = "";
image_index = -1;
Looted = -1;
State = "";
Type = "";
Is_Activated = 0;
Update = 0;


Is_Activated = 0;
List[0] = ds_list_create();
List[1] = ds_list_create();

/*
This three values represent the item's : id, sprite ant quantity of the LAST object on the list. Everytime 2 obj_item ovelaps, the last
ob_item created will  copy its lists to the other one and destroy itself. (see alarm[0])
*/
Item_Value = -1;
Item_Sprite = -1;
Item_Quantity = -1;
Item_Image_Index = -1;

//Info = ''

alarm[0] = 1;

T_Angle = 0; //angle (in degrees) 
Increment = 3; //degrees -- freq = 1 oscillation per second (1Hz)
Amplitude = 4; //pixels of peak oscillation
Shift = 0;

scr_set_depth(id, depth);

/* */
/*  */
