//The HUD:

if (surface_exists(Hud_Surface))
{
surface_resize(Hud_Surface, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));
}
else
{
Hud_Surface = surface_create(__view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));
}

surface_set_target(Hud_Surface);
draw_clear_alpha(c_black, 0);

//Console
while(ds_list_size(Text_List) >= 10)
{
ds_list_delete(Text_List, 0);
}

draw_set_font(fnt_txt_value);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_white);

var size = ds_list_size(Text_List);
var s_h = surface_get_height(application_surface);
var s_w = surface_get_width(application_surface);


//This is for debug purpose. It's the top-left corner and the bottom-right corner:
//draw_sprite(spr_door_crypt, 0, 0, 0)
//draw_sprite(spr_door_crypt, 0, s_w-Tile_Size, s_h-Tile_Size)


if (size)
{
    if (Console_Max == 1)
    {
        for (var i=0; i<size; i++)
        {
        draw_text(2, s_h-2-(size*12)+i*12, string_hash_to_newline(string(ds_list_find_value(Text_List, i))));
        }
    }
    else
    {
    draw_text(2, s_h-14, string_hash_to_newline(string(ds_list_find_value(Text_List, size-1))));
    }   
    
}

//Life
if (instance_exists(obj_player))
{
var life_max = obj_player.Mysheet[S_BASE,S_LIFE];
var life_current = obj_player.Mysheet[S_TOTAL,S_LIFE];
var i;
var www = sprite_get_width(spr_icon_life);

    for(i=0; i<life_max; i++)
    {
        if (i < life_current)
        {
        draw_sprite(spr_icon_life, 0, i*www, 0);
        }
        else
        {
        draw_sprite(spr_icon_life, 1, i*www, 0);
        }
    }
}

//Current Level
draw_sprite(spr_icon_plane, 0, s_w-sprite_get_width(spr_icon_plane), 0);
draw_set_font(fnt_txt_value);
draw_set_valign(fa_bottom);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(s_w-sprite_get_width(spr_icon_plane)/2, sprite_get_height(spr_icon_plane), string_hash_to_newline(string(obj_creator.Current_Plane)));

surface_reset_target();

