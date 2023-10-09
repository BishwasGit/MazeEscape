event_inherited();
image_speed = 0.1;

sprite_index = spr_monster_rat;

Target = obj_player.id;
State = "sleep"; //Can be 'sleep', 'seek', 'chase', 'attack'

//Attributes
Mysheet[S_ATTRIBUTE,S_NAME] = "Name";
Mysheet[S_ATTRIBUTE,S_CLASS] = "Class";
Mysheet[S_ATTRIBUTE,S_STRENGTH] = "Strength";
Mysheet[S_ATTRIBUTE,S_AGILITY] = "Agility";
Mysheet[S_ATTRIBUTE,S_MAGIC] = "Magic";
Mysheet[S_ATTRIBUTE,S_LIFE] = "Life";
Mysheet[S_ATTRIBUTE,S_CONSCIOUSNESS] = "Consciousness";
Mysheet[S_ATTRIBUTE,S_PROTECTION] = "Protection";
Mysheet[S_ATTRIBUTE,S_ACTION_POINT] = "Action point";
Mysheet[S_ATTRIBUTE,S_MOVEMENT] = "Movement";
Mysheet[S_ATTRIBUTE,S_FOV] = "Field of view";


//Base
Mysheet[S_BASE,S_NAME] = "Grey Rat";
Mysheet[S_BASE,S_CLASS] = "Monster";
Mysheet[S_BASE,S_STRENGTH] = 1;
Mysheet[S_BASE,S_AGILITY] = 1;
Mysheet[S_BASE,S_MAGIC] = 0;
Mysheet[S_BASE,S_LIFE] = 2;
Mysheet[S_BASE,S_CONSCIOUSNESS] = 8;
Mysheet[S_BASE,S_PROTECTION] = 0;
Mysheet[S_BASE,S_ACTION_POINT] = 1;
Mysheet[S_BASE,S_MOVEMENT] = 1;
Mysheet[S_BASE,S_FOV] = 8;


//Mod
Mysheet[S_MOD,S_NAME] = "";
Mysheet[S_MOD,S_CLASS] = "";
Mysheet[S_MOD,S_STRENGTH] = 0;
Mysheet[S_MOD,S_AGILITY] = 0;
Mysheet[S_MOD,S_MAGIC] = 0;
Mysheet[S_MOD,S_LIFE] = 0;
Mysheet[S_MOD,S_CONSCIOUSNESS] = 0;
Mysheet[S_MOD,S_PROTECTION] = 0;
Mysheet[S_MOD,S_ACTION_POINT] = 0;
Mysheet[S_MOD,S_MOVEMENT] = 0;
Mysheet[S_MOD,S_FOV] = 0;

scr_mysheet_update(id);










