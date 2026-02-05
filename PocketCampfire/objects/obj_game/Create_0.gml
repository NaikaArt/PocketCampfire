/// @description Game Initialization

enum GAME_STATE
{
	MAINMENU,
	CAMP,
	INTERACTION,
	INVENTORY,
	COOKING,
	LOCKED
}

enum POKEMON_STATES
{
	IDLE,
	MOVING,
	SELECTED
}

enum TEXTBOX_STATE
{
	DONE,
	WRITING,
	CHOICE
}

enum ITEM
{
	NONE			= 0,
	RICE			= 1,
	SWEET_POTATOES	= 2,
	SWAP_SHROOMS	= 3,
	ORAN_BERRY		= 4,
	CHERI_BERRY		= 5,
	COLBUR_BERRY	= 6,
	KEBIA_BERRY		= 7,
	BELUE_BERRY		= 8,
	PECHA_BERRY		= 9,
	SITRUS_BERRY	= 10,
	QUALOT_BERRY	= 11,
	ENIGMA_BERRY	= 12,
	HEIGHT			= 13
}

enum SPECIES
{
	NICKIT			= 0,
	VULPIX			= 1,
	ALOLANVULPIX	= 2,
	LUCARIO			= 3,
	CINDERACE		= 4,
	BRAIXEN			= 5,
	ZOROARK			= 6,
	AMOUNT			= 7
}

enum GENDERS
{
	M				= 0,
	F				= 1
}

//Create the mon list
global.ds_mon = ds_list_create();

#region //Mon interaction placement lookup maps

global.mon_height = ds_map_create();

ds_map_add(global.mon_height, SPECIES.NICKIT, 0.12);
ds_map_add(global.mon_height, SPECIES.VULPIX, 0.12);
ds_map_add(global.mon_height, SPECIES.ALOLANVULPIX, 0.12);
ds_map_add(global.mon_height, SPECIES.LUCARIO, 0);
ds_map_add(global.mon_height, SPECIES.CINDERACE, 0);
ds_map_add(global.mon_height, SPECIES.BRAIXEN, 0);
ds_map_add(global.mon_height, SPECIES.ZOROARK, 0);

global.mon_scale = ds_map_create();

ds_map_add(global.mon_scale, SPECIES.NICKIT, 0.93);
ds_map_add(global.mon_scale, SPECIES.VULPIX, 0.93);
ds_map_add(global.mon_scale, SPECIES.ALOLANVULPIX, 0.93);
ds_map_add(global.mon_scale, SPECIES.LUCARIO, 1.05);
ds_map_add(global.mon_scale, SPECIES.CINDERACE, 1.05);
ds_map_add(global.mon_scale, SPECIES.BRAIXEN, 1.1);
ds_map_add(global.mon_scale, SPECIES.ZOROARK, 1.05);

global.interact_bg_height = ds_map_create();

ds_map_add(global.interact_bg_height, SPECIES.NICKIT, 0);
ds_map_add(global.interact_bg_height, SPECIES.VULPIX, 0);
ds_map_add(global.interact_bg_height, SPECIES.ALOLANVULPIX, 0);
ds_map_add(global.interact_bg_height, SPECIES.LUCARIO, 0.6);
ds_map_add(global.interact_bg_height, SPECIES.CINDERACE, 0.65);
ds_map_add(global.interact_bg_height, SPECIES.BRAIXEN, 0.5);
ds_map_add(global.interact_bg_height, SPECIES.ZOROARK, 0.6);

#endregion

// Global game variables
global.game_width = 960
global.game_height = 640
display_set_gui_size(global.game_width, global.game_height);
global.saveload_disabled = true;

global.game_speed = 60;
game_set_speed(global.game_speed, gamespeed_fps);

global.game_state = GAME_STATE.MAINMENU;
global.prev_game_state = GAME_STATE.MAINMENU;
global.encounter_imminent = false;
global.prompt_history = ds_map_create();
global.prompt_fail = false;

global.active_mon = noone;
global.text_speed = 2;

//Create the inventory
global.inventory_slots = 24;
global.ds_inventory = ds_grid_create(3, global.inventory_slots);

for(var _i = 0; _i < global.inventory_slots; _i++)
{
	global.ds_inventory[# 0, _i] = 0;
	global.ds_inventory[# 1, _i] = 0;
	global.ds_inventory[# 2, _i] = scr_get_item_description(0, false);
}

global.interaction_sprite_object = noone;

alarm[0] = 5;

randomize();