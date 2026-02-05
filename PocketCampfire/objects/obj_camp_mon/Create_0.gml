//description Create a new mon object

map = noone;
mon_id = 0;
gender = GENDERS.F;
released = false;
mouse_over = false;

whistle_sounds = [snd_whistle_1, snd_whistle_1, snd_whistle_2];

image_index = species_id;
image_xscale = 0.5;
image_yscale = 0.5;
depth = 1;

width = sprite_get_width(sprite_index) * image_yscale;
height = sprite_get_height(sprite_index) * image_yscale;

interact_button = spr_camp_interact_button;
interact_button_w = sprite_get_width(interact_button);
interact_button_h = sprite_get_height(interact_button);
interact_button_x = x - (interact_button_w / 2);
interact_button_y = y + 10;

release_button = spr_camp_release_button;
release_button_w = sprite_get_width(release_button);
release_button_h = sprite_get_height(release_button);
release_button_x = interact_button_x + interact_button_w + 10;
release_button_y = interact_button_y;

state = POKEMON_STATES.IDLE;
prev_state = state;
active_button = -1;
last_active_button = -1;
arousal = 10;

base_spd = 4;
max_angle = 5;
max_angle_selected = 15;
angle = 0;
arousal_regen = 0.5;

jumping = false;
jump_time = 0
idle_time_min = 2;
idle_time_max = 10;
hop_y_origin = 0
hop_speed = 4
wobble_time = irandom(100) / 100;
wobble_speed = 1
wobble_speed_min = 0.35;
wobble_speed_max = 1.2;
wobble_offset = irandom(10) / 10;

target[0] = -1;
target[1] = -1;

distance_factor = 0.5;
camp_upper_bounds = 200;
camp_lower_bounds = 540;
upper_bounds_scale = 0.8;
lower_bounds_scale = 1.2;
camp_size_y = camp_lower_bounds - camp_upper_bounds;

gendericon = spr_camp_gendericons;	// Pivot is bottom left
gendericon_size = sprite_get_height(gendericon);
gendericon_size_a = 0;
gendericon_transition_speed = 8;


var _camp_hitbox = instance_find(obj_camp_hitbox, 0);

if(_camp_hitbox != noone)
{
	var _hit = noone;
	while(_hit == noone)
	{
		x = irandom_range(_camp_hitbox.x, _camp_hitbox.x + _camp_hitbox.sprite_width);
		y = irandom_range(_camp_hitbox.y, _camp_hitbox.y + _camp_hitbox.sprite_height);
		_hit = collision_point(x, y, _camp_hitbox, true, false);
	}
}

alarm[0] = irandom_range(idle_time_min, idle_time_max) * global.game_speed; 