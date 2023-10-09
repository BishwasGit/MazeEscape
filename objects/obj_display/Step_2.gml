//This make our view follow the camera:

var gap_width = __view_get( e__VW.WView, 0 ) - 2*252;
var gap_height = __view_get( e__VW.HView, 0 ) - 2*252;


if (obj_camera.x-__view_get( e__VW.XView, 0 ) < 252)
{
__view_set( e__VW.XView, 0, obj_camera.x-252 );
}
else if (obj_camera.x > __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )-252)
{
__view_set( e__VW.XView, 0, obj_camera.x-gap_width-252 );
}

if (obj_camera.y-__view_get( e__VW.YView, 0 ) < 252)
{
__view_set( e__VW.YView, 0, obj_camera.y-252 );
}
else if (obj_camera.y > __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )-252)
{
__view_set( e__VW.YView, 0, obj_camera.y-gap_height-252 );
}


__view_set( e__VW.XView, 0, (clamp(__view_get( e__VW.XView, 0 ), 0,room_width-__view_get( e__VW.WView, 0 ))) div Tile_Size * Tile_Size );
__view_set( e__VW.YView, 0, (clamp(__view_get( e__VW.YView, 0 ), 0,room_height-__view_get( e__VW.HView, 0 )))div Tile_Size * Tile_Size );

