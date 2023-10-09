{
  "resourceType": "GMExtension",
  "resourceVersion": "1.2",
  "name": "Rogue_Lock",
  "androidactivityinject": "",
  "androidclassname": "",
  "androidcodeinjection": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidPermissions": [],
  "androidProps": false,
  "androidsourcedir": "",
  "author": "",
  "classname": "",
  "copyToTargets": -1,
  "date": "2023-07-09T21:55:44.7057199+05:45",
  "description": "",
  "exportToGame": true,
  "extensionVersion": "1.0.9",
  "files": [],
  "gradleinject": "",
  "hasConvertedCodeInjection": true,
  "helpfile": "",
  "HTML5CodeInjection": "",
  "html5Props": false,
  "IncludedResources": [
    "Sprites\\Doors\\spr_door_crypt",
    "Sprites\\spr_player",
    "Sprites\\spr_shadow",
    "Sprites\\Chests\\spr_chest_regular",
    "Sprites\\spr_collision",
    "Sprites\\spr_enter",
    "Sprites\\spr_exit",
    "Sprites\\spr_lock",
    "Sprites\\spr_shadow_under",
    "Sprites\\Monsters\\spr_monster_rat",
    "Sprites\\Icons\\spr_icon_life",
    "Sprites\\Icons\\spr_icon_plane",
    "Sprites\\spr_selector",
    "Sprites\\spr_description_box",
    "Sprites\\spr_item_potion_small",
    "Sprites\\spr_item_potion_medium",
    "Sprites\\spr_item_potion_big",
    "Sprites\\spr_item_ring",
    "Sprites\\spr_item_scroll",
    "Sprites\\spr_item_weapon_ranged",
    "Sprites\\spr_item_rock",
    "Sprites\\spr_item_arrow",
    "Sprites\\Items\\Weapons\\spr_item_weapon_axe",
    "Sprites\\Items\\Weapons\\spr_item_weapon_dagger",
    "Sprites\\Items\\Weapons\\spr_item_weapon_sword",
    "Sprites\\Items\\Weapons\\spr_weapon_battleaxe",
    "Sprites\\Items\\Weapons\\spr_weapon_morningstar",
    "Sprites\\Items\\Armors\\spr_item_armor",
    "Sprites\\Items\\Armors\\spr_item_belt",
    "Sprites\\Items\\Armors\\spr_item_boot",
    "Sprites\\Items\\Armors\\spr_item_cape",
    "Sprites\\Items\\Armors\\spr_item_glove",
    "Sprites\\Items\\Armors\\spr_item_hat",
    "Sprites\\Items\\Armors\\spr_item_helm",
    "Sprites\\Items\\Armors\\spr_item_shield",
    "Sprites\\Items\\spr_gold",
    "Sprites\\spr_lamp_on",
    "Sprites\\spr_lamp_off",
    "Sprites\\FX\\moving_effect\\spr_fx_arrow",
    "Sprites\\FX\\moving_effect\\spr_fx_fireball",
    "Sprites\\FX\\moving_effect\\spr_fx_frostball",
    "Sprites\\FX\\moving_effect\\spr_fx_poison_ball",
    "Sprites\\FX\\moving_effect\\spr_fx_rock",
    "Sounds\\snd_chest",
    "Sounds\\snd_door",
    "Sounds\\snd_set_fire",
    "Sounds\\snd_gold",
    "Sounds\\snd_take_item",
    "Sounds\\snd_drop_item",
    "Sounds\\snd_sparkle",
    "Sounds\\snd_bubble",
    "Backgrounds\\bck_walls_crypt",
    "Backgrounds\\bck_floor_crypt",
    "Backgrounds\\bck_inventory",
    "Scripts\\Attributes\\scr_dice_test.gml",
    "Scripts\\Attributes\\scr_mysheet_update.gml",
    "Scripts\\Attributes\\scr_attack_melee.gml",
    "Scripts\\Attributes\\scr_apply_damage.gml",
    "Scripts\\Attributes\\scr_player_set_damage_and_armor.gml",
    "Scripts\\Display\\scr_display_fullscreen.gml",
    "Scripts\\Display\\scr_text_value.gml",
    "Scripts\\FX\\scr_moving_effect.gml",
    "Scripts\\FX\\scr_moving_effect_script.gml",
    "Scripts\\Grid_cells_info\\scr_cell_available.gml",
    "Scripts\\Grid_cells_info\\scr_cell_is_around_cell.gml",
    "Scripts\\Grid_cells_info\\scr_cells_share_room.gml",
    "Scripts\\Grid_cells_info\\scr_FOV_grid.gml",
    "Scripts\\Grid_cells_info\\scr_is_on_view.gml",
    "Scripts\\Grid_cells_info\\scr_LOS.gml",
    "Scripts\\Grid_cells_info\\scr_target_in_earing_range.gml",
    "Scripts\\Inventory\\scr_inventory_add_item",
    "Scripts\\Inventory\\scr_inventory_add_item_pos",
    "Scripts\\Inventory\\scr_inventory_add_item_pos_remains",
    "Scripts\\Inventory\\scr_inventory_drop_item",
    "Scripts\\Inventory\\scr_inventory_item_restriction",
    "Scripts\\Inventory\\scr_inventory_position",
    "Scripts\\Inventory\\scr_inventory_reset_selection",
    "Scripts\\Inventory\\scr_inventory_resize",
    "Scripts\\Inventory\\scr_inventory_set_mouse_position",
    "Scripts\\Inventory\\scr_inventory_sort",
    "Scripts\\Inventory\\scr_item_asign_type",
    "Scripts\\Inventory\\scr_sound_item_take",
    "Scripts\\Inventory\\Use items\\scr_inventory_use_item.gml",
    "Scripts\\Inventory\\Use items\\scr_item_use_potion.gml",
    "Scripts\\Lights\\scr_light_update.gml",
    "Scripts\\Lights\\scr_light_update_lamp.gml",
    "Scripts\\Lights\\scr_pre_surface1.gml",
    "Scripts\\Lights\\scr_draw_surface.gml",
    "Scripts\\Planes Creation\\scr_add_door.gml",
    "Scripts\\Planes Creation\\scr_area_random_cell.gml",
    "Scripts\\Planes Creation\\scr_dig_corridor_straight.gml",
    "Scripts\\Planes Creation\\scr_door_can_be_place.gml",
    "Scripts\\Planes Creation\\scr_scatter_instance.gml",
    "Scripts\\Planes Creation\\scr_plane_enter_exit.gml",
    "Scripts\\Planes Creation\\scr_room_list.gml",
    "Scripts\\Planes Look\\scr_change_grid_to_tile.gml",
    "Scripts\\Planes Look\\scr_change_grid_to_tile_around_cell.gml",
    "Scripts\\Planes Look\\scr_cell_bit_value.gml",
    "Scripts\\Planes Look\\scr_initialize_plane_asset.gml",
    "Scripts\\Player Actions\\scr_player_action_activate_static.gml",
    "Scripts\\Player Actions\\scr_player_action_reveal_hiden_object.gml",
    "Scripts\\Player Actions\\scr_player_action_movement.gml",
    "Scripts\\Random loots\\scr_random_item_id.gml",
    "Scripts\\Random loots\\scr_loot_find_item_name.gml",
    "Scripts\\Random loots\\scr_loot_find_item_type.gml",
    "Scripts\\Random loots\\scr_random_item_id_quantity.gml",
    "Scripts\\Random loots\\scr_fill_static_with_random_loot.gml",
    "Scripts\\scr_set_depth",
    "Scripts\\Effects on Entity\\scr_effect_give_life.gml",
    "Scripts\\Monsters actions\\scr_monster_action_sleep.gml",
    "Scripts\\Monsters actions\\scr_monster_action_seek.gml",
    "Scripts\\Monsters actions\\scr_find_grid_path.gml",
    "Scripts\\Monsters actions\\scr_monster_action_chase.gml",
    "Scripts\\Monsters actions\\scr_monster_action_attack.gml",
    "Fonts\\fnt_txt_value",
    "Fonts\\fnt_inv_small",
    "Objects\\Parents\\obj_dynamic",
    "Objects\\Parents\\obj_static",
    "Objects\\Inventory\\obj_item_loader",
    "Objects\\Inventory\\obj_inventory",
    "Objects\\Inventory\\obj_item",
    "Objects\\obj_creator",
    "Objects\\obj_turn",
    "Objects\\obj_door",
    "Objects\\obj_display",
    "Objects\\obj_player",
    "Objects\\obj_camera",
    "Objects\\obj_light",
    "Objects\\obj_chest",
    "Objects\\obj_enter",
    "Objects\\obj_exit",
    "Objects\\obj_monster_rat",
    "Objects\\obj_lamp",
    "Objects\\obj_text_value",
    "Objects\\obj_moving_effect",
    "Objects\\obj_map",
    "Rooms\\rm_plane",
    "Included Files\\Rogue-Lock_Readme.txt",
    "Included Files\\item_database.csv",
    "Included Files\\item_database.txt",
    "Included Files\\constants.txt",
    "Included Files\\Rogue-lock-bundle.zip",
  ],
  "installdir": "",
  "iosCocoaPodDependencies": "",
  "iosCocoaPods": "",
  "ioscodeinjection": "",
  "iosdelegatename": "",
  "iosplistinject": "",
  "iosProps": false,
  "iosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "license": "Free to use, also for commercial games.",
  "maccompilerflags": "",
  "maclinkerflags": "",
  "macsourcedir": "",
  "options": [],
  "optionsFile": "options.json",
  "packageId": "com.naztail.roguelock",
  "parent": {
    "name": "Extensions",
    "path": "folders/Extensions.yy",
  },
  "productId": "ACBD3CFF4E539AD869A0E8E3B4B022DD",
  "sourcedir": "",
  "supportedTargets": -1,
  "tvosclassname": "",
  "tvosCocoaPodDependencies": "",
  "tvosCocoaPods": "",
  "tvoscodeinjection": "",
  "tvosdelegatename": "",
  "tvosmaccompilerflags": "",
  "tvosmaclinkerflags": "",
  "tvosplistinject": "",
  "tvosProps": false,
  "tvosSystemFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
}