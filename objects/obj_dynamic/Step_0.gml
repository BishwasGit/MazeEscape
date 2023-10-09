if (Update)
{
scr_mysheet_update(id);

    if (id == obj_player.id) //Only player update the HUD.
    {
        with(obj_display)
        {
        event_user(0);
        }
    }

    if (Mysheet[S_TOTAL,S_LIFE] <= 0)
    {
        if (id == obj_player.id)
        {
        show_message("You died!#Game end!");
        game_end();
        }
        else
        {
        instance_destroy();
        }
    
    }
    
Update = 0;
}

