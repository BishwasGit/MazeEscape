if (Update)
{
    if (State == "hiding")
    {
    ds_grid_set(obj_creator.Room_Grid, x div Tile_Size, y div Tile_Size, 0);
    scr_change_grid_to_tile_around_cell(x div Tile_Size, y div Tile_Size);
    State = "hide";
    visible = 0;
    }
    else if (State == "hide")
    {
    ds_grid_set(obj_creator.Room_Grid, x div Tile_Size, y div Tile_Size, 2);
    scr_change_grid_to_tile_around_cell(x div Tile_Size, y div Tile_Size);
    State = "close";
    visible = 1;
    }

Update = 0;
}

var tmp_id;

if (State == "close")
{
tmp_id = instance_position(x, y, obj_dynamic);

    if (tmp_id != noone)
    {
    State = "opening";
    }
}

else if (State == "opening")
{
ds_grid_set(obj_creator.Room_Grid, x div Tile_Size, y div Tile_Size, 1);
obj_light.Light_Update = 1;
image_index = 1;

    if (scr_is_on_view(id))
    {
    audio_play_sound(snd_door, 1, 0);
    }
    
State = "open";
}

else if (State == "open")
{
tmp_id = instance_position(x, y, obj_dynamic);
    
    if (tmp_id == noone)
    {
    ds_grid_set(obj_creator.Room_Grid, x div Tile_Size, y div Tile_Size, 2);
    obj_light.Light_Update = 1;
    image_index = 0;
    State = "close";
    }
}

