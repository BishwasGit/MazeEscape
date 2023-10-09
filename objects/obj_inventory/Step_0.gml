//First on/off trigger of the inventory. 
if (keyboard_check_pressed(ord("R")))
{
Is_Open = !Is_Open;

    if (!Is_Open) //When closing, drop the item you were dragging.   
    {
        if (Tmp_Selected != -1)
        {
        scr_inventory_drop_item(Tmp_Selected, Tmp_Qty, obj_player.x, obj_player.y);
        }
     
    scr_inventory_reset_selection(-1, "wait");
    exit;
    }
    else
    {
    event_user(0);
    }
}


//You can't use inventory is it's not open.
if (!Is_Open)
{
exit;
}

var tmp_cell_value, tmp_cell_qty, tmp_cell_index;

//THE WAIT STATE//
if (State == "wait")
{
    if (mouse_check_button_pressed(mb_left))
    {
    scr_inventory_set_mouse_position(); //That script set Cell_Index.
                
        if (Cell_Index == -1) //Click outside all slots
        {
        Item_Selected = -1;
        }
        else //Click on a slot
        {
        tmp_cell_value = Array_Inv[Cell_Index, 0];
        
            if (tmp_cell_value != -1) //Occupied slot
            {
            State = "selected";
            Item_Selected = Array_Inv[Cell_Index, 0];
            }
            else //Empty slot
            {
            Item_Selected = -1;
            }
        }
        
            
    event_user(0);  
    }  
        
}
    
//THE SELECTED STATE//
else if (State == "selected")
{

    if (mouse_check_button_pressed(mb_left))
    {
    tmp_cell_index = Cell_Index; 
    scr_inventory_set_mouse_position();
    
        if (Cell_Index == -1) //Click outside slots = reset
        {
        Item_Selected = -1;
        State = "wait";
        }
        else
        {
        tmp_cell_value =  Array_Inv[Cell_Index, 0]; 
        tmp_cell_qty =  Array_Inv[Cell_Index, 1];    
                         
            if (Cell_Index == tmp_cell_index) //Click on a selected item to drag it.
            {
            Tmp_Selected = Item_Selected;
            Tmp_Sprite = ds_grid_get(global.items, I_SPRITE, Tmp_Selected);
            Tmp_Image_Index = ds_grid_get(global.items, I_IMAGE, Tmp_Selected);
            
                if (keyboard_check(vk_alt) && tmp_cell_qty > 1) //Take half round down if at least 2 items on that cell.
                {                 
                Tmp_Qty = floor(tmp_cell_qty/2);
                Array_Inv[Cell_Index, 1] -= Tmp_Qty;
                }
                else //Take all item on that cell.
                {
                Tmp_Qty = tmp_cell_qty;
                Array_Inv[Cell_Index, 0] = -1;
                Array_Inv[Cell_Index, 1] = 0;
                }
                
            Cell_Index = -1;  
            State = "drag";        
            }
            else if (tmp_cell_value != -1) //Select another item.
            {
            Item_Selected = Array_Inv[Cell_Index, 0];
            }
            else
            {
            Item_Selected = -1;
            State = "wait";
            }
        }
        
    event_user(0);     
    }
    else if (mouse_check_button_pressed(mb_right)) //This is where you could use an item.
    {
    tmp_cell_index =  Cell_Index;
    scr_inventory_set_mouse_position();
    
        if (tmp_cell_index == Cell_Index) //That means you can only use an item if it were previously selected.
        {
        tmp_cell_value =  Array_Inv[Cell_Index, 0];
        tmp_cell_qty =  Array_Inv[Cell_Index, 1];
        
        var t_type = ds_grid_get(global.items, I_TYPE, tmp_cell_value);
        
        if (t_type == "potion")
        {
        scr_inventory_use_item(obj_player.id, tmp_cell_value);
        }
        else
        {
        exit;
        }
        
        tmp_cell_qty -= 1;
                
            if (tmp_cell_qty == 0) //Clear the cell if no item left.
            {
            Array_Inv[Cell_Index, 0] = -1;
            Array_Inv[Cell_Index, 1] = 0;
            Item_Selected = -1;
            State = "wait";
            }
            else
            {
            Array_Inv[Cell_Index, 1] -= 1;
            }
        }
        else //If right-clicking on another cell than the selected, selection resets.
        {
        scr_inventory_reset_selection(-1, "wait");
        Cell_Index = -1;
        }
        
    event_user(0);
    }
}
    
//THE DRAG STATE//
else if (State == "drag")
{
    if (mouse_check_button_pressed(mb_left))
    {
    scr_inventory_set_mouse_position();
        
        if (Cell_Index == -1) //Drop all dragged items on the floor at obj_player x/y
        {
        scr_inventory_drop_item(Tmp_Selected, Tmp_Qty, obj_player.x, obj_player.y);
        scr_inventory_reset_selection(-1, "wait");
        }
        else
        {
        tmp_cell_value =  Array_Inv[Cell_Index, 0];
            
            if (tmp_cell_value == -1 && scr_inventory_item_restriction(Tmp_Selected, Cell_Index)) //Place all dragged items on an empty cell if restriction is met..
            {
            scr_sound_item_take(Tmp_Selected);
            scr_inventory_add_item_pos(Tmp_Selected, Tmp_Qty, Cell_Index);
            scr_inventory_reset_selection(Tmp_Selected, "selected");
            }
            else if (tmp_cell_value == Tmp_Selected) //Add dragged item on a cell with the same type, keep remains selected.
            {
            scr_sound_item_take(Tmp_Selected);
            scr_inventory_add_item_pos_remains(Tmp_Selected, Tmp_Qty, Cell_Index);          
            }
            else if scr_inventory_item_restriction(Tmp_Selected, Cell_Index) //Swap dragged item whit a new item if restriction is met.
            {
            scr_sound_item_take(Tmp_Selected);
            var t_se, s_qt;
            
            t_se = Tmp_Selected;
            t_qt = Tmp_Qty;
            
            Tmp_Selected = tmp_cell_value;
            Tmp_Sprite = ds_grid_get(global.items, I_SPRITE, Tmp_Selected);
            Tmp_Image_Index = ds_grid_get(global.items, I_IMAGE, Tmp_Selected);
            Tmp_Qty = Array_Inv[Cell_Index, 1];
            
            Array_Inv[Cell_Index, 0] = t_se;
            Array_Inv[Cell_Index, 1] = t_qt;
            Item_Selected = Tmp_Selected;
            }
                               
        event_user(0);
        } 
    }       
    else if (mouse_check_button_pressed(mb_right))
    {
    scr_inventory_set_mouse_position();
    
        if (Cell_Index == -1) //Drop 1 dragged item on the floor.
        {
        scr_inventory_drop_item(Tmp_Selected, 1, obj_player.x, obj_player.y);
        Tmp_Qty -= 1;
        }
        else if (scr_inventory_item_restriction(Tmp_Selected, Cell_Index)) //Drop 1 dragged item on a cell if restriction is met.
        {
        scr_inventory_add_item_pos(Tmp_Selected, 1, Cell_Index);
        Tmp_Qty -= 1;
        }
        
        if (Tmp_Qty == 0) //No items left to drag. Reset!
        {
        scr_inventory_reset_selection(-1, "wait");
        }
        
    event_user(0);
    }
}



//Sort inventory
if (keyboard_check_pressed(ord("T")))
{
scr_inventory_sort();
}


//Drop all items on cell on the floor.
if (keyboard_check(vk_control) && mouse_check_button_pressed(mb_left) && (State == "wait" || State == "selected"))
{
scr_inventory_set_mouse_position();
    
    if (Cell_Index != -1)
    {    
    tmp_cell_value = Array_Inv[Cell_Index, 0];
    
        if (tmp_cell_value != -1)
        {
        tmp_cell_qty = Array_Inv[Cell_Index, 1];
        scr_inventory_drop_item(tmp_cell_value, tmp_cell_qty, obj_player.x, obj_player.y);
        scr_inventory_reset_selection(-1, "wait");
        Array_Inv[Cell_Index, 0] = -1;
        Array_Inv[Cell_Index, 1] = 0;
        event_user(0);
        }
    }                  
}
    
  
/*
This is features of the original Inventory DB and it's unused here:

//That moves the inventory box.
if (keyboard_check(vk_alt) && mouse_check_button(mb_right) && State != 'drag')
{
scr_inventory_reset_selection(-1, 'wait');
Xbox = mouse_x div 32 * 32;
Ybox = mouse_y div 32 * 32;
scr_inventory_position();
event_user(0);
}

//Resize inventory. That can be run when the player gain access to a larger bag or something else!
if (keyboard_check_pressed(ord('Z')))
{
scr_inventory_resize();
event_user(0);
}



/* */
/*  */
