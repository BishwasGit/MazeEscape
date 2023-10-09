if (!scr_is_on_view(id))
{
exit;
}

if (Is_Activated)
{
Update = 1;
    
    if (State == "close")
    {
    State = "open";
        
        if (x == obj_player.x && y == obj_player.y)
        {
        audio_sound_pitch(audio_play_sound(snd_set_fire, 1, false), 1.75);
        }
    }
    else if (State == "open")
    {
    State = "close";
    }
    
Is_Activated = 0;
}

if (Update)
{
    
    if (State == "close")
    {
    image_speed = 0;
    sprite_index = spr_lamp_off;
        
    }
    else if (State == "open")
    {
    image_speed = 0.1;
    sprite_index = spr_lamp_on;
    }
    
Update = 0;
}



