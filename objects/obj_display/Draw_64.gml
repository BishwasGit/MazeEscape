if (surface_exists(Hud_Surface))
{
draw_surface(Hud_Surface, 0+X_Offset/2, 0+Y_Offset/2);
}
else
{
Hud_Surface = surface_create(__view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));
event_user(0);
}

