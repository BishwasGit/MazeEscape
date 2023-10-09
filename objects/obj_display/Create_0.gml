Fullscreen = 0;
Width_Total = 0;
Height_Total = 0;
X_Offset = 0;
Y_Offset = 0;
scr_display_fullscreen(Fullscreen);

//The console:
Text_List = ds_list_create();
Console_Max = 0;

Hud_Surface = surface_create(__view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));

event_user(0);

application_surface_draw_enable(0);

