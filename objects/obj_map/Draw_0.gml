if (Show)
{
    if (surface_exists(Map_Surf))
    {
    draw_surface_ext(Map_Surf, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 )+24, Scale, Scale, 0, c_white, Alpha); //You can play with its position and its alpha at will.
    }
    else
    {
    Map_Surf = surface_create(Map_Width, Map_Height);
    }
}

