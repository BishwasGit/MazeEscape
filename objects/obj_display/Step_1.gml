if (keyboard_check_pressed(vk_f1))
{
Fullscreen = !Fullscreen;

obj_light.Light_Update = 1;
scr_display_fullscreen(Fullscreen);
event_user(0);

    with(obj_inventory)
    {
    scr_inventory_position();
    event_user(0);
    }
    
obj_map.alarm[0] = 5; //Update the mini-map
}

