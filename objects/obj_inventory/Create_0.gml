/*
obj_inventory works with state(written in string): 'wait', 'selected' and 'drag'.
'wait' - Nothing is selected.
'selected' - A cell occupied by an item is selected.
'drag' - An item is selected and it is dragging around, following the mouse.
Note that all sprites of this project are made by Oryx from www.oryxdesignlab.com
*/
x = __view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )-background_get_width(bck_inventory))/2;
y = __view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )-background_get_height(bck_inventory))/2;


Inv_Width = 7;
Inv_Height = 6;
Inv_Cell_Size = Tile_Size;

//X and Y of the inventory box
Xbox = 552;
Ybox = 96;

//X and Y of the description box
Xbox_D = 288;
Ybox_D = 48;

Cell_Index = -1; //Which cell is selected. (First index of the array Array_Inv) -1 = no cell selected.
Item_Selected = -1; //VALUE/ID of the selected item. Thats the index of the Y axis on our global.items grid.

//Information of the item being dragged.
Tmp_Selected = -1;
Tmp_Sprite = -1;
Tmp_Image_Index = -1;
Tmp_Qty = -1;

Is_Open = 0; //This is the on/off variable of the inventory.

State = "wait"; //Can be 'wait', 'selected' or 'drag'.


//Nearly everything is drawn on a surface. You'll get better performance. Surface is updated each time you change something on the inventory.
Surf_Inv = surface_create(768, 576);

Array_Inv = 0;

/*
This is the SLOTS. It's here that you have to set special slots for armor, rings, etc...
You can specify a restriction (for example: armor only) and their coordinates X/Y will not follow all the inventory if you move it.
If you don't want to use any slots, delete them under:
*/

//Left hand
Array_Inv[0,0] = -1; //Item id
Array_Inv[0,1] = 0; //Quantity
Array_Inv[0,2] = "none"; //Restriction.
Array_Inv[0,3] = 600; //X of that slot.
Array_Inv[0,4] = 48; //Y of that slot.

//Right hand //Main weapon!
Array_Inv[1,0] = -1;
Array_Inv[1,1] = 0;
Array_Inv[1,2] = "none";
Array_Inv[1,3] = 648;
Array_Inv[1,4] = 48;

//helm
Array_Inv[2,0] = -1;
Array_Inv[2,1] = 0;
Array_Inv[2,2] = "helm";
Array_Inv[2,3] = 624;
Array_Inv[2,4] = 264;

//Gloves
Array_Inv[3,0] = -1;
Array_Inv[3,1] = 0;
Array_Inv[3,2] = "glove";
Array_Inv[3,3] = 576;
Array_Inv[3,4] = 312;

//Armor
Array_Inv[4,0] = -1;
Array_Inv[4,1] = 0;
Array_Inv[4,2] = "armor";
Array_Inv[4,3] = 624;
Array_Inv[4,4] = 312;

//Cape
Array_Inv[5,0] = -1;
Array_Inv[5,1] = 0;
Array_Inv[5,2] = "cape";
Array_Inv[5,3] = 672;
Array_Inv[5,4] = 312;

//Belt
Array_Inv[6,0] = -1;
Array_Inv[6,1] = 0;
Array_Inv[6,2] = "belt";
Array_Inv[6,3] = 624;
Array_Inv[6,4] = 360;

//Boots
Array_Inv[7,0] = -1;
Array_Inv[7,1] = 0;
Array_Inv[7,2] = "boot";
Array_Inv[7,3] = 624;
Array_Inv[7,4] = 408;

//Left ring
Array_Inv[8,0] = -1;
Array_Inv[8,1] = 0;
Array_Inv[8,2] = "ring";
Array_Inv[8,3] = 576;
Array_Inv[8,4] = 360;

//Right Ring
Array_Inv[9,0] = -1;
Array_Inv[9,1] = 0;
Array_Inv[9,2] = "ring";
Array_Inv[9,3] = 672;
Array_Inv[9,4] = 360;

//Don't forget to increment the first dimension of the array.



//Here, we are initializing our 'main' inventory. The index of our first cell will be equal to Nmb_of_Slots.
if (is_array(Array_Inv))
{
Nmb_of_Slots = array_height_2d(Array_Inv);
}
else
{
Nmb_of_Slots = 0;
}

var xx, yy, tmp_cell_index;

xx = 0;
yy = 0;

tmp_cell_index = Nmb_of_Slots;

repeat(Inv_Height)
{
xx = 0;

    repeat(Inv_Width)
    {
    Array_Inv[tmp_cell_index,0] = -1;
    Array_Inv[tmp_cell_index,1] = 0;
    Array_Inv[tmp_cell_index,2] = "none"; //Should be no restriction for all cell on 'main' inventory.
    Array_Inv[tmp_cell_index,3] = Xbox+xx*Inv_Cell_Size; //All cells will get a coordinates relative to Xbox and Ybox.
    Array_Inv[tmp_cell_index,4] = Ybox+yy*Inv_Cell_Size;
    xx += 1;
    tmp_cell_index += 1;
    }
    
yy += 1;
}


//This user defined event is where everything is drawn of the surface.
event_user(0);



/* */
/*  */
