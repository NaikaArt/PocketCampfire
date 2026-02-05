/// @description

a = 1;
sprite_fade = 1;
sprite_fade_delay = 1;
grass_blades_a = 1;
grass_blades_i = 0;
grass_blades_ib = -0.15;

grass_blades = spr_encounter_grassblades;
grass_blades_h = sprite_get_height(grass_blades);
grass_blades_w = sprite_get_width(grass_blades);
grass_blades_x = 0;
grass_blades_y = 640;
grass_blades_yb = 640;
grass_blades_time = 1.5;

tall_grass = spr_encounter_tallgrass;
tall_grass_h = sprite_get_height(tall_grass);
tall_grass_w = sprite_get_width(tall_grass);
tall_grass_padding = 100;
tall_grass_active = false;
tall_grass_delay = 0.5;

mon_species = global.active_mon[? "species"]
mon_gender = global.active_mon[? "gender"];

sprite = scr_get_mon_sprite(mon_species, mon_gender);

sprite_w = sprite_get_width(sprite);
sprite_h = sprite_get_height(sprite);
sprite_x = 960 / 2;
sprite_y = 640;

textbox_active = false;
textbox_delay = 5.5;

audio_play_sound(snd_bush_rustle, 100, false);

alarm[1] = 3 * global.game_speed;
alarm[2] = 4 * global.game_speed;
alarm[3] = 5.5 * global.game_speed;