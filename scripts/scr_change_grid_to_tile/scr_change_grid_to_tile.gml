function scr_change_grid_to_tile() {
	//scr_change_grid_to_tile()
	//Let's read the Room_Grid and turn 0 to walls, 1 to floor and 2 to door.

	var xx, yy, value, bit_value, debris;

	for(yy=0; yy<Grid_Height; yy++)
	{
	    for(xx=0; xx<Grid_Width; xx++)
	    {
	    value = ds_grid_get(Room_Grid, xx, yy);
    
	        if (value == 0) //add a wall
	        {
	        bit_value = scr_cell_bit_value(xx,yy);
	        tile_add(Style_Wall, 2+bit_value*(Tile_Size+4), 2, Tile_Size, Tile_Size, xx*Tile_Size, yy*Tile_Size, 5555); //5555 if the detph for walls, 6666 is for floor.
	        }
	        else
	        {
	        debris = 0;
        
	            if (!irandom_range(0,25))
	            {
	            debris = irandom_range(1,15); //This choose a floor tile with debris on it.
	            }
                        
	        tile_add(Style_Floor, 2+debris*(Tile_Size+4), 2, Tile_Size, Tile_Size, xx*Tile_Size, yy*Tile_Size, 6666);
            
	            if (value == 2) //add a 'real' door.
	            {
	                with(instance_create(xx*Tile_Size, yy*Tile_Size, obj_door))
	                {
	                sprite_index = obj_creator.Style_Door;
                    
	                    if (irandom_range(1,100) < 30)
	                    {
	                    State = "hiding"; //a door can start hiding.
	                    }
	                    else
	                    {
	                    State = "close";
	                    }
                    
	                Update = 1;
	                }
	            }
	        }
	    }
	}



}
