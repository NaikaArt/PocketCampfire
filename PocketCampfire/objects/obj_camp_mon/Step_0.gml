/// @description Every step

var _mousex = device_mouse_x_to_gui(0);
var _mousey = device_mouse_y_to_gui(0);

mouse_over = collision_point(mouse_x, mouse_y, obj_camp_mon, false, false) == id;

// Update Gender Icon Scale Transition Value
if(mouse_over || state == POKEMON_STATES.SELECTED) gendericon_size_a += (1 / global.game_speed) * gendericon_transition_speed;
else gendericon_size_a -= (1 / global.game_speed) * gendericon_transition_speed;
gendericon_size_a = clamp(gendericon_size_a, 0, 1);

switch (state) 
{
	case POKEMON_STATES.IDLE:
		scr_camp_mon_idle();
		break;
	case POKEMON_STATES.MOVING:
		scr_camp_mon_move();
		break;
	case POKEMON_STATES.SELECTED:
		scr_camp_mon_select();
		break;
}

prev_state = state;

#region // Get if mouse is over button

active_button = -1;

if(global.game_state == GAME_STATE.CAMP)
{
	if(state == POKEMON_STATES.SELECTED && _mousey >= interact_button_y && _mousey <= interact_button_y + interact_button_h)
	{
		if(_mousex >= interact_button_x && _mousex <= interact_button_x + interact_button_w) 
		{ 
			active_button = 0; 
			if(active_button != last_active_button) audio_play_sound(snd_button_hover, 100, false);
		}
		if(_mousex >= release_button_x && _mousex <= release_button_x + release_button_w) 
		{ 
			active_button = 1; 
			if(active_button != last_active_button) audio_play_sound(snd_button_hover, 100, false);
		}
	}
}
else 
{
	if(state == POKEMON_STATES.SELECTED) state = POKEMON_STATES.IDLE;
}

last_active_button = active_button;

#endregion


distance_factor = (y - camp_upper_bounds) / camp_size_y;
depth = layer_get_depth("Mons") - (distance_factor * 99);

// Scale the sprite based on distance
image_xscale = lerp(upper_bounds_scale, lower_bounds_scale, distance_factor) / 2;
image_yscale = image_xscale;

wobble_speed = lerp(wobble_speed_min, wobble_speed_max, arousal / 100);

if(!released)
{
	if(map != undefined)
	{
		map[? "location x"] = round(x);
		map[? "location y"] = round(y);
	}
	
	if(arousal < 100)
	{
		arousal = map[? "arousal"];
		arousal += arousal_regen / global.game_speed;
		arousal = clamp(arousal, 0, 100);
		map[? "arousal"] = arousal;
	}
}

if(alarm[2] == -1 && arousal > 20)
{
	alarm_set(2, lerp(2.5, 0.3, (arousal - 20) / 80) * global.game_speed);
}