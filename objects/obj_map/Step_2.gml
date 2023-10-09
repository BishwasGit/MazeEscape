if (keyboard_check_pressed(ord("M")))
{
Show = !Show;
Update = 1; 
}


if (Update && Show) //Creation of the map.
{    
surface_set_target(Map_Surf);
draw_clear_alpha(Col1, 1);
draw_set_blend_mode(bm_normal);

var xx, yy;

    for(yy=0; yy<Map_Height; yy++) //Scanning each cell one by one.
    {
        for(xx=0; xx<Map_Width; xx++)
        {
            if (ds_grid_get(Saw_Grid, xx, yy) != 0)
            {
                if (ds_grid_get(Grid, xx, yy) == 0)
                {
                draw_point_colour(xx, yy, Col3);
                }
                else if (ds_grid_get(Grid, xx, yy) == 1)
                {
                draw_point_colour(xx, yy, Col2);
                }
                else if (ds_grid_get(Grid, xx, yy) == 2)
                {
                draw_point_colour(xx, yy, c_yellow);
                }
            }
        }
    }

surface_reset_target();

Update = 0;
}

if (mouse_wheel_up())//If you want to scale it.
{
Scale++
}
else if (mouse_wheel_down())
{
Scale--
}

Scale = clamp(Scale, 1, 4);

