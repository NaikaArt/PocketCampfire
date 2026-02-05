/// @description 

enum BERRYCATCH_STATES
{
	START,
	PLAYING,
	FINISHED,
	SHOWING_RESULTS,
	PAUSED
}

state = BERRYCATCH_STATES.START;
max_berry_count = 20;
berry_num = 0;
delay_min = 0.15;
delay_max = 1.2;
spd_min = 350;
spd_max = 800;

font = fnt_default_large; draw_set_font(font);
font_count = fnt_default_small;

basket = instance_create_layer(global.game_width / 2, 500, "Objects", obj_berrycatch_basket);
basket.game = id;

drop_sounds = [snd_berry_drop_1, snd_berry_drop_2, snd_berry_drop_3];
drop_sound_pitch_range = 0.3;

instructions = spr_berrycatch_instructions;
instructions_w = sprite_get_width(instructions);
instructions_h = sprite_get_height(instructions);
instructions_x = global.game_width / 2 - instructions_w / 2;
instructions_y = 60;

summary = spr_berrycatch_summary;
summary_w = sprite_get_width(summary);
summary_h = sprite_get_height(summary);
summary_x = global.game_width / 2 - summary_w / 2;
summary_y = global.game_height / 2 - summary_h / 2;
summary_padding_x = 50;
summary_padding_y = 80;
summary_text = "You caught " + string(max_berry_count) + " out of " + string(max_berry_count) + " berries!";
summary_text_w = string_width(summary_text);
summary_text_x = summary_x + (summary_w / 2) - (summary_text_w / 2);


berries = spr_berrycatch_berries;
berry_sprite_count = sprite_get_number(berries);
berry_summary_spacing = 1;
berries_w = summary_text_w / berry_sprite_count;
berries_h = berries_w;

mousex = mouse_x;
mousey = mouse_y;

berry_size = sprite_get_height(spr_berrycatch_berries);
drop_padding = 100;
drop_delay = delay_max * global.game_speed;

berries_caught = ds_map_create();
berries_spawned = ds_map_create();
berries_total = 0;

for(var _i = 0; _i < berry_sprite_count; _i++;)
{
	ds_map_add(berries_caught, _i, 0);
	ds_map_add(berries_spawned, _i, 0);
}