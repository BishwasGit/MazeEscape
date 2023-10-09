if (!Is_Open) //If it's close, exit.
{
exit;
}


//Draw the surface in a safe way.
if (surface_exists(Surf_Inv))
{
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ), __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ), 0);
draw_set_alpha(1);
var xx = __view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )-768)/2;
var yy = __view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )-576)/2;
draw_surface(Surf_Inv, xx, yy);
}
else
{
Surf_Inv = surface_create(768, 576);
event_user(0);
}



//If an item is selected, draw its sprite.
if (State == "drag")
{
draw_sprite(Tmp_Sprite, Tmp_Image_Index, mouse_x-Tile_Size/2, mouse_y-Tile_Size/2);
    
    if (Tmp_Qty > 1)
    {
    draw_set_font(fnt_inv_small);
    draw_set_valign(fa_bottom);
    draw_set_halign(fa_right);
    draw_set_color(c_white);
    draw_text(mouse_x+10, mouse_y+10, string_hash_to_newline(string(Tmp_Qty)));
    }
        
}

