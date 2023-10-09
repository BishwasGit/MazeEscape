x = x + lengthdir_x(5, D_Direction);
y = y + lengthdir_y(5, D_Direction);

if (Rotate)
{
image_angle += 30;
}
else
{
image_angle = D_Direction-90;
}

if (x div Tile_Size == Target_X div Tile_Size && y div Tile_Size == Target_Y div Tile_Size)
{
x = x div Tile_Size * Tile_Size + Tile_Size/2;
y = y div Tile_Size * Tile_Size + Tile_Size/2;
scr_moving_effect_script(Destroy_Scipt, P_Power);
instance_destroy();
}


