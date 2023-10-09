Map_Width = room_width/Tile_Size;
Map_Height = room_height/Tile_Size;
Map_Surf = surface_create(Map_Width, Map_Height); //That creates a surface the size of the room/Tile_Size. Each pixel is a cell on the grid.
Grid = obj_creator.Room_Grid;
Saw_Grid = obj_light.Saw_Grid;
Update = 1;
Show = 0;
Scale = 2;
Alpha = 1;
Col1 = make_colour_rgb(102,90,57);
Col2 = make_colour_rgb(131,115,69);
Col3 = make_colour_rgb(120,108,71);

