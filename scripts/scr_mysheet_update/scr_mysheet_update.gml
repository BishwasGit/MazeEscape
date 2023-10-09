/// @description scr_mysheet_update(id)
/// @param id
function scr_mysheet_update(argument0) {
	//Total of S_BASE and S_MOD on Mysheet array

	var count = 0;
	repeat(array_length_2d(argument0.Mysheet, 0))
	{
	argument0.Mysheet[S_TOTAL,count] = argument0.Mysheet[S_BASE,count] + argument0.Mysheet[S_MOD,count];
	count++;
	}



}
