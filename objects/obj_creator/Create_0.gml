//Level are created using a BSP tree algorithm: http://www.roguebasin.com/index.php?title=Basic_BSP_Dungeon_generation
//On my previous project, Runelock, Level were called Plane. Sometimes, you can see the word plane or level.
/// @description Insert description here
// You can write your code in this editor

randomize();
show_debug_message("SEED:"+string(random_get_seed()));
//To re-create the same level when debugging, use the function under:
//random_set_seed(yourseed!)

//WARNING remove the line below when you want!
//show_message("Before running Rogue-Lock for the first time, don't forget to add the CONSTANT.TXT. It is in the included files. Go to Resources>Define Macros>load> and select the constants.txt file.");


//All variable beginning with a capital letter are Instance Variables.
Grid_Width = room_width/Tile_Size; //Tile_Size are a constant fixed at 24. Change it is you want a different size of tile.
Grid_Height = room_height/Tile_Size;
Room_Grid = ds_grid_create(Grid_Width, Grid_Height);
Area_Grid = ds_grid_create(Grid_Width, Grid_Height);
ds_grid_clear(Room_Grid, 0);
ds_grid_clear(Area_Grid, 0);

Current_Plane = 1;
global.wait_effect = 0;

/*
On Room_Grid:
0 = walls
1 = floor
2 = door
*/

var slice_nmb = 6; //Number of slices. 1 slice = 2 rooms, 2 slices = 4 rooms, 3 slices = 8 rooms, etc...
var min_area_size = 4; //Don't set this too small or too large.
//Important: The more slices you add, the bigger the room you need. Do tests. If you don't give the rooms some space, you'll end up with a broken map!


var cell = 0;

Nmb_of_Room = power(2,slice_nmb);


/*
The Area array:
cell if the number of the area.
The area-0 is the entire room.
When performing the first split, you'll end up with area-1 and area-2
After the second split area-3, area-4, area-5 and area-6
Then on the third: area-7-8-9-10-11-12-13-14
etc...
The last rooms created by the final split will be use very often.
But the the others can be use to. (Area-0 will always be 'All your rooms'.

so:

cell = 1
Area[cell,0] = 0 //x1
Area[cell,1] = 0 //y1
Area[cell,2] = 63 //x2
Area[cell,3] = 63 //y2
Thats the coordinates on the ds_grid of the entire area 1.

*/


Area = 0;

Area[cell,0] = 0; //x1
Area[cell,1] = 0; //y1
Area[cell,2] = room_width/Tile_Size-1; //x2
Area[cell,3] = room_height/Tile_Size-1; //y2

var root = 0;
var slice_qty = 1;
var slice_dir = choose(0, 1); //0 is verticalsplit and 1 is horizontal split

repeat(slice_nmb)
{
slice_dir = !slice_dir;

    repeat(slice_qty)
    {    
    cell++;
    
        if slice_dir = 0 //vertical
        {
        Area[cell,0] = Area[root,0];
        Area[cell,1] = Area[root,1];
        Area[cell,2] = floor(Area[root,0]+(Area[root,2]-Area[root,0])*random_range(0.4, 0.6));
        Area[cell,3] = Area[root,3];
        cell++;
        Area[cell,0] = Area[cell-1,2]+1;
        Area[cell,1] = Area[cell-1,1];
        Area[cell,2] = Area[root,2];
        Area[cell,3] = Area[cell-1,3];
        }
        else //horizontal
        {
        Area[cell,0] = Area[root,0];
        Area[cell,1] = Area[root,1];
        Area[cell,2] = Area[root,2];
        Area[cell,3] = floor(Area[root,1]+(Area[root,3]-Area[root,1])*random_range(0.4, 0.6));
        cell++;
        Area[cell,0] = Area[cell-1,0];
        Area[cell,1] = Area[cell-1,3]+1;
        Area[cell,2] = Area[cell-1,2];
        Area[cell,3] = Area[root,3];
        }
        
    root++;
    }
    
slice_qty = slice_qty*2;
}


//Now, we'll set the walkable area on each area.
var max_area_width, max_area_heigth, area_size, x1, x2, y1, y2, tmp_area;


cell = Nmb_of_Room-1;

repeat(Nmb_of_Room)
{
ds_grid_set_region(Area_Grid, Area[cell,0], Area[cell,1], Area[cell,2], Area[cell,3], cell);
max_area_width = Area[cell,2]-Area[cell,0]-2;
area_size = irandom_range(min_area_size, max_area_width);
x1 = Area[cell,0]+1+irandom_range(0, (max_area_width-area_size));
x2 = x1+area_size;

max_area_heigth = Area[cell,3]-Area[cell,1]-2;
area_size = irandom_range(min_area_size, max_area_heigth);
y1 = Area[cell,1]+1+irandom_range(0, (max_area_heigth-area_size));
y2 = y1+area_size;

ds_grid_set_region(Room_Grid, x1, y1, x2, y2, 1);

/*
That part under set the 'walkable' area of the area.
Only rooms of the final split have a 'walkable area'.
*/
Area[cell,4] = x1;
Area[cell,5] = y1;
Area[cell,6] = x2;
Area[cell,7] = y2;
cell++;
}

tmp_area = 1;


/*
Now we'll pickup 1 point of each splited area and connect a corridor.
Connect area-1 to area-2, connect area-3 to area-4, etc...
*/
var coord1, coord2, xx, yy, tmp_grid, tmp_grid_string;

coord1[0] = 0;
coord1[1] = 0;

coord2[0] = 0;
coord2[1] = 0;

tmp_grid = ds_grid_create(Grid_Width, Grid_Height);
ds_grid_clear(tmp_grid, -1);
ds_grid_set_region(tmp_grid, 1, 1, Grid_Width-2, Grid_Height-2, 0);
tmp_grid_string = ds_grid_write(tmp_grid);

repeat(Nmb_of_Room-1)
{
coord1 = scr_area_random_cell(tmp_area, coord1, 1); //return a coordinates of a cell that has a value of 1.
tmp_area++;
coord2 = scr_area_random_cell(tmp_area, coord2, 1);
tmp_area++;
scr_dig_corridor_straight(coord1[0], coord1[1], coord2[0], coord2[1], 0, tmp_grid_string, 2); //The corridor will be set to 2.
}

ds_grid_destroy(tmp_grid);


/*
set corridors value from 2 to 1)
Why not set it to 1 before? Because when searching for 2 random point, we're searching for a value of 1
and we don't want to pick a point outside the walkable area, on a corridor.
*/
for(yy=0; yy<Grid_Height; yy++)
{
    for(xx=0; xx<Grid_Width; xx++)
    {
        if ds_grid_get(Room_Grid, xx, yy) == 2
        {
        ds_grid_set(Room_Grid, xx, yy, 1);
        }
    }
}

//Whhoooaa! Now let's add things:

scr_add_door();

scr_initialize_plane_asset();

scr_change_grid_to_tile();

instance_create(0,0,obj_display); //There is no obligation to spawn all that at Tile_Size,Tile_Size
instance_create(Tile_Size, Tile_Size, obj_player);
instance_create(Tile_Size, Tile_Size, obj_camera);
instance_create(Tile_Size, Tile_Size, obj_light);
instance_create(Tile_Size, Tile_Size, obj_turn);
instance_create(Tile_Size, Tile_Size, obj_item_loader);
instance_create(Tile_Size, Tile_Size, obj_inventory);


scr_room_list(0);

scr_plane_enter_exit();

scr_scatter_instance(obj_chest, 30, 0);

scr_scatter_instance(obj_monster_rat, 10, 0);

    
    with(obj_chest)
    {
        repeat(choose(1,1,1,1,1,1,1,1,1,2))
        {
        scr_fill_static_with_random_loot();
        }
    }
    
scr_scatter_instance(obj_lamp, 20, 0);

with(obj_lamp)
{
    if !irandom_range(0,5)
    {
    State = "open";
    }
}

with(obj_static)
{
scr_set_depth(id, depth);
}

with(obj_dynamic)
{
scr_set_depth(id, depth);
}

scr_room_list(3);

instance_create(10, 10, obj_map);












/* */
/*  */
