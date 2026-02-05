/// @description Select / deselect Pokémon

if(global.game_state != GAME_STATE.CAMP) { return; }

var _other_selected = false;
with(obj_camp_mon)
{
	if(id != other.id && active_button >= 0) _other_selected = true;
}

if(_other_selected) { return; }

switch(active_button)
{
	case 0:
		scr_fade_scene(rm_interact);
		scr_set_music_gain(0.5, 0.5);
		var _whistle_id = irandom_range(0, array_length(whistle_sounds) - 1);
		audio_play_sound(whistle_sounds[_whistle_id], 100, false);
		break;
	case 1:
		scr_create_confirmation("Are you sure you want to release " + global.active_mon[? "name"] + "?", scr_camp_release_mon);
		audio_play_sound(snd_click_1, 100, false);
		break;
	default:
		if(mouse_over && state != POKEMON_STATES.SELECTED)
		{
			state = POKEMON_STATES.SELECTED;
			global.active_mon = global.ds_mon[| mon_id];
		
			interact_button_x = x - (interact_button_w / 2);
			interact_button_y = y + 10;
			release_button_x = interact_button_x + interact_button_w + 10;
			release_button_y = interact_button_y;
			
			audio_play_sound(snd_click_2, 100, false);
			alarm[3] = 0.25 * global.game_speed;
		}
		else
		{
			if(state == POKEMON_STATES.SELECTED)
			{
				state = POKEMON_STATES.IDLE;
				alarm[0] = irandom_range(idle_time_min, idle_time_max) * global.game_speed; 
				target[0] = -1;
				target[0] = -1;
				
				audio_play_sound(snd_click_3, 100, false);
			}
		}
}