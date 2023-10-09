/*
That create event will initialize/create a ds_grid named: global.items.
It will hold all items informations that you wrote on your 'database'.
Item informations will be store like this:

On the ds_grid Y axis you'll have each item. Their id/value will be their index on the Y axis.

On the X axis you'll have their properties. (If you open the .csv file, you'll quickly get the idea.)

For an optimize file reading I suggest you to write down your database on a excel document then export it to a .csv file and turn it into a .txt file.
However reading a .csv file is ok.
*/
var file_name, count_type, line, file, count_1d, count_2d, tmp_char, i, z;

file_name = "item_database.csv"; //You can change it to item_database.txt if you use .txt

my_array = 0;
type = 0;

count_1d = 0;
count_2d = 0;


file = file_text_open_read(working_directory + "\\"+file_name) ;


file_text_readln(file); //We skip the first line. That line is only a guide when we edit our file on notepad or excel.


//The second line define what is each index on the X axis: string, real, asset. Look on the .csv or .txt to see how it's formated.

line = file_text_read_string(file);

count_type = 0;

tmp_char = string_char_at(line, 1);


//First assuring that line is correctly formated.
if (tmp_char == ";" || tmp_char == "")
{
show_message("File wrongly formated!");
game_end();
}

//Asign a type to each index of the X axis.
while(line!="") //Each index of the array type[] will hold a string: 'string', 'real' or 'asset'. type[0] is for index 0 on the X axis. type[1] is for index 1, etc...
    {
    type[count_type] = "";
        do
        {        
        type[count_type]+=tmp_char;
        line = string_delete(line, 1, 1)  ;  
        tmp_char = string_char_at(line, 1);
        }
        until(tmp_char == ";" || line == "")
    
    line = string_delete(line, 1, 1);
    tmp_char = string_char_at(line, 1);
    count_type += 1;
    }
    
file_text_readln(file);


//Now we read the file line by line (item by item) and store each item properties on my_array[x,y]
while(!file_text_eof(file))
{
count_1d = 0;
line = file_text_read_string(file);

    while(line!="")
    {
    my_array[count_1d,count_2d] = "";
    tmp_char = string_char_at(line, 1);
    
        if (tmp_char == ";")
        {
        count_2d -= 1;
        break;
        }
      
        do
        {
        my_array[count_1d,count_2d]+=tmp_char;
        line = string_delete(line, 1, 1); 
        tmp_char = string_char_at(line, 1);
        }
        until(tmp_char == ";" || line == "")
        
    count_1d += 1;
    line = string_delete(line, 1, 1);    
    }
    
    file_text_readln(file);
    count_2d += 1;
}

file_text_close(file);

/*
We now have an 2d array who looks like a grid. ds_grid as plenty of useful functions so we'll use it instead of an array.
So let's convert our 2d array into a ds_grid.
*/

a_h = array_height_2d(my_array);
a_l = array_length_2d(my_array, 0);

//We turn each value(they are all string for now) into the good type: string, real or asset. (we'll look on the array type[].)
for(count_2d=0; count_2d<a_l; count_2d++)
{
    for(count_1d=0; count_1d<a_h; count_1d++)
    {
    my_array[count_1d,count_2d] = scr_item_asign_type(my_array[count_1d,count_2d], type[count_1d]); //look inside scr_item_asign_type to see what it does.
    }
}

global.items = ds_grid_create(a_h, a_l);
ds_grid_clear(global.items, 0);

var xx, yy;

for (yy=0; yy<a_l; yy++)
{
    for (xx=0; xx<a_h; xx++)
    {
    ds_grid_set(global.items, xx, yy, my_array[xx,yy]);
    }
}


/* */
/*  */
