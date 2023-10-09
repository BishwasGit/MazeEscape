/// @description scr_add_door()
function scr_add_door() {
	//Scan areas to add doors where a door can stand:

	var area, x1, x2, y1, y2, xx, yy, t_cell, area_surface;

	area = Nmb_of_Room-1;

	repeat(Nmb_of_Room)
	{

	x1 = Area[area,4]-1;
	y1 = Area[area,5]-1;
	x2 = Area[area,6]+1;
	y2 = Area[area,7]+1;

	    for(yy=y1; yy<y2+1; yy++)
	    {
	        for(xx=x1; xx<x2+1; xx++)
	        {
	            if ((xx == x1 || xx == x2 || yy == y1 || yy == y2) && ds_grid_get(Room_Grid, xx, yy) == 1 && scr_door_can_be_place(xx,yy))
	            {
	            ds_grid_set(Room_Grid, xx, yy, 2);
	            }
	        }
	    }
 
	area++;
	}



}
