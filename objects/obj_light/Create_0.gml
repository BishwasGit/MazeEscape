//Manage text on console and flying text

Source = obj_player;
Fov = Source.Mysheet[S_TOTAL,S_FOV];
Disco = 0.85; //Discovred part alpha.

Light_Grid = ds_grid_create(room_width/Tile_Size, room_height/Tile_Size);
Saw_Grid = ds_grid_create(room_width/Tile_Size, room_height/Tile_Size);

ds_grid_clear(Light_Grid, 0);
ds_grid_clear(Saw_Grid, 0);


Mysurf = surface_create(__view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));

Light_Update = 1;


