/// @description 

var _progress = berry_num / max_berry_count;

if(_progress >= 1 && !instance_exists(obj_berrycatch_berry) && state != BERRYCATCH_STATES.FINISHED  && state != BERRYCATCH_STATES.SHOWING_RESULTS)
{
	state = BERRYCATCH_STATES.FINISHED;
	alarm[1] = 1 * global.game_speed;
}

mousex = mouse_x;
mousey = mouse_y;

if(state != BERRYCATCH_STATES.START)
{
	basket.x_origin = mousex;
	basket.y_origin = mousey;
}
if(state == BERRYCATCH_STATES.PLAYING && _progress < 1)
{
	if(drop_delay <= 0)
	{
		// Drop a new berry, item type is determined by berry object in its Create event
		var _berry_x = random_range(drop_padding, global.game_width - drop_padding);
		var _new_berry = instance_create_layer(_berry_x, -berry_size, "Objects", obj_berrycatch_berry);
		
		var _sound_id = irandom(array_length(drop_sounds) - 1);
		var _pitch_range = drop_sound_pitch_range * 100;
		var _pitch = irandom_range(100 - _pitch_range, 100 + _pitch_range) / 100;
		audio_play_sound(drop_sounds[_sound_id], 200, false, 1, 0, _pitch);
		
		_new_berry.spd = lerp(spd_min, spd_max, sin(_progress * pi * 0.5));
		drop_delay = lerp(delay_max * global.game_speed, delay_min * global.game_speed, sin(_progress * pi * 0.5));
		
		if(ds_map_exists(berries_spawned, _new_berry.berry_id)) berries_spawned[? _new_berry.berry_id] += 1;
		else ds_map_add(berries_spawned, _new_berry.berry_id, 1);
		
		berry_num++;
	}
	else drop_delay--;
}