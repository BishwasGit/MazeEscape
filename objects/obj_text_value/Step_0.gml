if (instance_exists(Target) && Target.visible)
{
x = Target.x+Tile_Size/2;
y = Target.y;
}
else
{
instance_destroy();
}


