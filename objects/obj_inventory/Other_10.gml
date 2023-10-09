//When inventory is updated:
scr_player_set_damage_and_armor();



//Then draw all information on surface:
surface_set_target(Surf_Inv);

draw_clear_alpha(c_black, 0.8);

draw_background(bck_inventory, 0, 0);

draw_set_blend_mode(bm_normal);

//Loop through all cells.

var cell_id, nmb_cells;

cell_id = 0;
nmb_cells = array_height_2d(Array_Inv);

repeat(nmb_cells)
{
var c_val = Array_Inv[cell_id,0];
        
        if (c_val > -1) //If there is an item on that cells draw its sprite and its quantity.
        {
        draw_sprite(ds_grid_get(global.items, I_SPRITE, c_val), ds_grid_get(global.items, I_IMAGE, c_val),  Array_Inv[cell_id,3],  Array_Inv[cell_id,4]);
        
            if (Array_Inv[cell_id,1] > 1)
            {
            draw_set_color(c_white);
            draw_set_font(fnt_inv_small);
            draw_set_valign(fa_bottom);
            draw_set_halign(fa_right);
            draw_text(Array_Inv[cell_id,3]+Inv_Cell_Size-2, Array_Inv[cell_id,4]+Inv_Cell_Size-2, string_hash_to_newline(Array_Inv[cell_id,1]));
            }
        }

cell_id += 1;
}

//Draw a selection square on a selected item.
if (State == "selected")
{
draw_sprite(spr_selector, 0, Array_Inv[Cell_Index,3], Array_Inv[Cell_Index,4]);
}




/*
That part draw the description box.
That could be done hundreds of way, I choose a simple one.
Everything is drawn according to the Xbox_D and Ybox_D variable.
Guess what happen if you change those...
Change them both to change the position of the description box.
*/

if (State == "selected" || State == "drag")
{
draw_sprite(spr_description_box, 0, Xbox_D, Ybox_D);

draw_set_color(c_black);
draw_set_font(fnt_txt_value);

var name, type, picture, img_index, val1, val2, restriction, price, enchant1, enchant2, description;

name = ds_grid_get(global.items, I_NAME, Item_Selected);
type = ds_grid_get(global.items, I_TYPE, Item_Selected);
picture = ds_grid_get(global.items, I_SPRITE, Item_Selected);
img_index = ds_grid_get(global.items, I_IMAGE, Item_Selected);
val1 = ds_grid_get(global.items, I_VAL_1, Item_Selected);
val2 = ds_grid_get(global.items, I_VAL_2, Item_Selected);
restriction = ds_grid_get(global.items, I_RESTRICTION, Item_Selected);
price = ds_grid_get(global.items, I_PRICE, Item_Selected);
enchantment = ds_grid_get(global.items, I_ENCHANTMENT, Item_Selected);
category = ds_grid_get(global.items, I_CATEGORY, Item_Selected);
description = ds_grid_get(global.items, I_DESCRIPTION, Item_Selected);
    
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text(Xbox_D+108, Ybox_D+12, string_hash_to_newline(name));
draw_sprite_ext(picture, img_index, Xbox_D+168, Ybox_D, 2, 2, 0, c_white, 1);

draw_set_halign(fa_left);

draw_text(Xbox_D+6, Ybox_D+30, string_hash_to_newline("Category : "+string(category)));
draw_text(Xbox_D+6, Ybox_D+46, string_hash_to_newline("Restriction : "+string(restriction)));
draw_text(Xbox_D+6, Ybox_D+62, string_hash_to_newline("Value : "+string(price)));
draw_text(Xbox_D+6, Ybox_D+78, string_hash_to_newline("Enchantment : "+string(enchantment)));

var c_power;

if (type == "weapon")
{
c_power = "Damage : "+string(val1)+"/"+string(val2);
}
else if (type == "helm" || type == "armor" || type == "glove" || type == "belt" || type == "cape" || type == "boot")
{
c_power = "Protection : "+string(val1);
}
else
{
c_power = "Power : "+string(val1);
}

draw_text(Xbox_D+6, Ybox_D+94, string_hash_to_newline(c_power));



draw_set_halign(fa_center);
draw_text_ext(Xbox_D+108, Ybox_D+144, string_hash_to_newline(description+" This line is added just to show how much space you have to enter a better description. 12345678910 11 12 13 14 15 16 17..."), 12, 202);

}

//Mysheet
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_set_color(c_black);
draw_set_font(fnt_txt_value);

for(var i=0; i<10; i++)
{
draw_text(60, 60+Tile_Size*i, string_hash_to_newline(string(obj_player.Mysheet[S_ATTRIBUTE,i])+": "+string(obj_player.Mysheet[S_TOTAL,i])));
}

surface_reset_target();

/* */
/*  */
