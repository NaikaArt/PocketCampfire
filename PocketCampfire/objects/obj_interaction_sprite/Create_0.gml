/// @description Insert description here

enum SPRITE_MODES	// This enum corresponds to the index layout of sprites 
{
	SHY_NEUTRAL = 0,
	SHY_HAPPY = 1,
	SHY_UPSET = 2,
	
	FRIENDLY_NEUTRAL = 3,
	FRIENDLY_NEUTRAL_X_COVER = 4,
	FRIENDLY_NEUTRAL_X = 5,
	FRIENDLY_HAPPY = 6,
	FRIENDLY_HAPPY_X_COVER = 7,
	FRIENDLY_HAPPY_X = 8,
	FRIENDLY_UPSET = 9,
	FRIENDLY_SHOWOFF = 10,
	FRIENDLY_SHOWOFF_X = 11,
	FRIENDLY_INTIMATE = 12,
	FRIENDLY_INTIMATE_CUM = 13,
	
	LOVE_NEUTRAL = 14,
	LOVE_NEUTRAL_X = 15,
	LOVE_HAPPY = 16,
	LOVE_HAPPY_X = 17,
	LOVE_UPSET = 18,
	LOVE_SHOWOFF = 19,
	LOVE_SHOWOFF_X = 20,
	LOVE_INTIMATE = 21,
	LOVE_INTIMATE_CUM = 22
}

enum SPRITE_PROMPTS
{
	NEUTRAL,
	HAPPY,
	SHOWOFF,
	INTIMATE,
	INTIMATE_CUM,
	UPSET
}

mon_species = global.active_mon[? "species"];
mon_gender = global.active_mon[? "gender"];

sprite = scr_get_mon_sprite(mon_species, mon_gender)

mon_height = global.mon_height[? mon_species];
mon_scale = global.mon_scale[? mon_species];

mode = 0;

x = global.game_width / 2;
y = global.game_height;

adjusted_x = x;
adjusted_y = y - (global.game_height * mon_height);