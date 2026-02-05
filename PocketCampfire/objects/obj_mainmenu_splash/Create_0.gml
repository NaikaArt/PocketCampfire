/// @description Create

panel_sprite = spr_mainmenu_background_new;

//bg_sprite = spr_interaction_background;
//bg_sprite_width = sprite_get_width(bg_sprite);
//bg_sprite_height = sprite_get_width(bg_sprite);

//bg_center = 0.25
//bg_sprite_x_offset = -bg_sprite_width * bg_center;

// Get the last Mon for the splash screen
scr_load_game_data();
mon = noone;
mon_count = ds_list_size(global.ds_mon);
mon_id = irandom_range(0, mon_count - 1);
mon_index = SPRITE_MODES.LOVE_NEUTRAL;
mon_index_happy = SPRITE_MODES.LOVE_HAPPY;
if(mon_count > 0) mon = ds_list_find_value(global.ds_mon, mon_id);

if(mon == noone || mon == -1)
{
	mon_species = SPECIES.CINDERACE;
	mon_gender = GENDERS.M;
}
else
{
	mon_species = mon[? "species"];
	mon_gender = mon[? "gender"];
	mon_affection_level = scr_get_affection_level(mon[? "affection"]);
	switch(mon_affection_level)
	{
		case AFFECTION_LEVEL.NEW:
			mon_index = SPRITE_MODES.SHY_NEUTRAL;
			mon_index_happy = SPRITE_MODES.SHY_HAPPY;
		break;
		case AFFECTION_LEVEL.LOW:
		case AFFECTION_LEVEL.MEDIUM:
			mon_index = SPRITE_MODES.FRIENDLY_NEUTRAL;
			mon_index_happy = SPRITE_MODES.FRIENDLY_HAPPY;
		break;
		case AFFECTION_LEVEL.HIGH:
		case AFFECTION_LEVEL.MAX:
			mon_index = SPRITE_MODES.LOVE_NEUTRAL;
			mon_index_happy = SPRITE_MODES.LOVE_HAPPY;
		break;
	}
}

mon_name = scr_get_species_name(mon_species);
mon_height = global.mon_height[? mon_species];
mon_height *= 0.3; // Reduce offset for smaller mons
mon_is_happy = false;

mon_scale = global.mon_scale[? mon_species];
mon_bgheight = global.interact_bg_height[? mon_species];
//bg_sprite_y_offset = lerp((bg_sprite_height - global.game_height) * -1, 0, mon_bgheight);

gender_text = mon_gender == GENDERS.M ? "m" : "f";
mon_sprite = scr_get_mon_sprite(mon_species, mon_gender)

var _y_offset = 0;
switch(mon_species)
{
	case SPECIES.NICKIT:
	case SPECIES.ALOLANVULPIX:
	case SPECIES.VULPIX:
		_y_offset = 10;
}

mon_x = (global.game_width * 0.7);
mon_y = global.game_height + _y_offset; // - (global.game_height * mon_height)

mon_x_offset = 0;
mon_shake_speed = 0;
mon_shake_amplitude = 2;
mon_shake_val = 0;

keyframe = 0;

alarm[0] = 0.65 * global.game_speed;