/// @description scr_dig_corridor_straight(from_xx, from_yy, target_xx, target_yy, diag, grid_block, value_to_set)
/// @param from_xx
/// @param  from_yy
/// @param  target_xx
/// @param  target_yy
/// @param  diag
/// @param  grid_block
/// @param  value_to_set
function scr_dig_corridor_straight(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	//'Dig' a corridor from_xx/yy to target_xx/yy. xx/yy are grid coordinates.
	//grid_block is a grid containing blocked cell.
	//This script is based on a breadth first search algorithm and it's a modification of Grid-path: https://marketplace.yoyogames.com/assets/747/grid-path


	var grid_width, grid_height, fx, fy, tx, ty, cx, cy, tmp_grid, tmp_list, path_stack;

	fx = argument0;
	fy = argument1;
	tx = argument2;
	ty = argument3;

	if (fx == tx && fy == ty)
	{
	exit; //We are already at destination!
	}


	path_stack = ds_stack_create();
	tmp_grid = ds_grid_create(0, 0);
	ds_grid_read(tmp_grid, argument5);
	grid_width = ds_grid_width(tmp_grid);
	grid_height = ds_grid_height(tmp_grid);
	//On that grid, a value of -1 will be a blocked cell. All other values will be the distance(step) they are from the calling starting cell.

	tmp_list[0]= ds_list_create();
	tmp_list[1]= ds_list_create();




	if (ds_grid_get(tmp_grid, tx, ty) == -1) //If we can't move on target cell, exit. But that's not supposed to happen!
	{
	show_message("Can't move there!"); //This is really for debug purpose. It should be removed.
	ds_list_destroy(tmp_list[0]);
	ds_list_destroy(tmp_list[1]);
	ds_grid_destroy(tmp_grid);
	ds_stack_destroy(path_stack);
	exit;
	}


	var tc, xx, yy, sx, sy, cv, cl, blocked, reached, cur_list;

	cv = 1; //current distance value
	cl = 0; //current tmp_list to use.
	ds_list_add(tmp_list[cl], fx, fy); //This is the first cell that we will looking around.
	blocked = false; //If the path is block.
	reached = false; //If the target cell is reach.

	do
	{
	    do
	    {
	    tc = 1;
	    cx = ds_list_find_value(tmp_list[cl], 0);
	    cy = ds_list_find_value(tmp_list[cl], 1);
    
	    repeat(2)
	    {
	    ds_list_delete(tmp_list[cl], 0);
	    }
    
	        repeat(2) //That part looks for cells: up, down, right, left
	        {
	        sx = cx+tc;
	        sy = cy   ;         
        
	            if (sx > -1 && sx < grid_width && ds_grid_get(tmp_grid, sx, sy) == 0)
	            {
	            ds_grid_set(tmp_grid, sx, sy, cv);
	            ds_list_add(tmp_list[!cl], sx);
	            ds_list_add(tmp_list[!cl], sy);
	            }
            
	            if (sx == tx && sy == ty)
	            {
	            reached = true;
	            break;
	            }
            
	        sx = cx;
	        sy = cy+tc;
        
	            if (sy > -1 && sy < grid_height && ds_grid_get(tmp_grid, sx, sy) == 0)
	            {
	            ds_grid_set(tmp_grid, sx, sy, cv);
	            ds_list_add(tmp_list[!cl], sx);
	            ds_list_add(tmp_list[!cl], sy);
	            }
            
	            if (sx == tx && sy == ty)
	            {
	            reached = true;
	            break;
	            }
            
	        tc = -1;
	        }
        
	        if (argument4) //That part handle diagonals the same way as above: (if allowed)
	        {
	        tc = 1;
        
	            repeat(2)
	            {
	            sx = cx+tc;
	            sy = cy+tc;
            
	                if (sx > -1 && sx < grid_width && sy > -1 && sy < grid_height && ds_grid_get(tmp_grid, sx, sy) == 0)
	                {
	                ds_grid_set(tmp_grid, sx, sy, cv);
	                ds_list_add(tmp_list[!cl], sx);
	                ds_list_add(tmp_list[!cl], sy);
	                }
                
	                if (sx == tx && sy == ty)
	                {
	                reached = true;
	                break;
	                }
                
	            sx = cx+tc;
	            sy = cy-tc;
            
	                if (sx > -1 && sx < grid_width && sy > -1 && sy < grid_height && ds_grid_get(tmp_grid, sx, sy) == 0)
	                {
	                ds_grid_set(tmp_grid, sx, sy, cv);
	                ds_list_add(tmp_list[!cl], sx);
	                ds_list_add(tmp_list[!cl], sy);
	                }
                
	                if (sx == tx && sy == ty)
	                {
	                reached = true;
	                break;
	                }
                
	            tc = -1;
	            }
	        }
        
	        if (reached)
	        {        
	        break;
	        }
	    }
	    until(ds_list_empty(tmp_list[cl]))

	if (reached)
	{        
	break;
	}

	if (ds_list_empty(tmp_list[!cl]))
	{
	blocked = true;
	break;
	}


	cv += 1 ;
	cl = !cl;
	}
	until(blocked || reached)


	//Are we block? Again, that's not supposed to happen.
	if (blocked)
	{
	show_message("No path found!");
	ds_list_destroy(tmp_list[0]);
	ds_list_destroy(tmp_list[1]);
	ds_grid_destroy(tmp_grid);
	ds_stack_destroy(path_stack);
	exit;
	}



	/*
	At this point, the value of cv is equal to the number of steps to our target.
	What we need to do now is to backtrack from our target and decrease cv by 1 and add all coordinates of cells on the stack.
	*/

	cx = tx;
	cy = ty;

	var rnd_list, rnd_pos;
	rnd_list = ds_list_create();
	ds_stack_push(path_stack, ty, tx); //This will be our LAST step: the x and y of the target.

	//We will scan around the current_cell and add all matching cell to a rnd_list, shuffle that list and pick a random cell to push it on our stack.

	while(cv>1)
	{
	cv-=1;

	for(yy=-1; yy<2; yy+=1)
	{
	    for(xx=-1; xx<2; xx+=1)
	    {
	    sx = cx+xx;
	    sy = cy+yy;
        
	        if (sx > -1 && sx < grid_width && sy > -1 && sy < grid_height && ds_grid_get(tmp_grid, sx, sy) == cv)
	        {
	        ds_list_add(rnd_list, sy<<16 | sx); //Nice trick to store x and y in 1 variable.
	        }
	    }
	}

	//Now we pick up a random coordinate around the current cell.
	ds_list_shuffle(rnd_list);
	var rnd = ds_list_find_value(rnd_list, 0);

	cx = rnd & $FFFF;
	cy = rnd >> 16;

	ds_stack_push(path_stack, cy, cx);
	ds_list_clear(rnd_list);
	}



	//We now have a stack full of coordinates that corresponds to the shortest way to target cell.


	var x_p, y_p;
   
	do
	{
	x_p = ds_stack_pop(path_stack);
	y_p = ds_stack_pop(path_stack);
	ds_grid_set(Room_Grid, x_p, y_p, argument6);
	}
	until(ds_stack_empty(path_stack))




	//Then, let's destroy the data_structures:

	ds_list_destroy(rnd_list);
	ds_list_destroy(tmp_list[0]);
	ds_list_destroy(tmp_list[1]);
	ds_grid_destroy(tmp_grid);
	ds_stack_destroy(path_stack);



}
