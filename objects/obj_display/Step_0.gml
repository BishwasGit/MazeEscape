if (Console_Max == 0 && mouse_y > __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ) - Tile_Size)
{
Console_Max = 1;
event_user(0);
}
else if (Console_Max == 1 && mouse_y <= __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ) - Tile_Size)
{
Console_Max = 0;
event_user(0);
}

