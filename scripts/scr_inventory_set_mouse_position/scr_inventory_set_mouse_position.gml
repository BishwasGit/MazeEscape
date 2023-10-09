function scr_inventory_set_mouse_position() {
	//scr_inventory_set_mouse_position()
	//Set Cell_Index. Correspond to the first index of the Array_Inv array. -1 if not hovering one.

	var xx1, xx2, yy1, yy2, i, mx, my;

	var xx = (__view_get( e__VW.WView, 0 )-768)/2;
	var yy = (__view_get( e__VW.HView, 0 )-576)/2;

	mx = mouse_x-__view_get( e__VW.XView, 0 )-xx;
	my = mouse_y-__view_get( e__VW.YView, 0 )-yy;
        
	    for(i=0; i<array_height_2d(Array_Inv); i++) //Check if mouse hovers Slots.
	    {        
	    xx1 = Array_Inv[i,3];
	    xx2 = Array_Inv[i,3]+Inv_Cell_Size;
	    yy1 = Array_Inv[i,4];
	    yy2 = Array_Inv[i,4]+Inv_Cell_Size;
                
	        if (point_in_rectangle(mx, my, xx1, yy1, xx2, yy2))
	        {
	        Cell_Index = i; //This is the index of the slot.
	        exit;
	        }
	    }

	Cell_Index = -1;



}
