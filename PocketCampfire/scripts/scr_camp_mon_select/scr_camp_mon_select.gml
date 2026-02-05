/// @desc 'Mon Selected Jump & Wobble Animation
function scr_camp_mon_select() 
{
	if(prev_state != state)
	{	
		speed = 0;
		target[0] = noone;
		target[1] = noone;
		alarm[0] = -1
	
		hop_y_origin = y
		jump_time = 0
		jumping = true
		image_angle = 0;
	}

	if(jumping)
	{
		if(jump_time < global.game_speed / 4)
		{
			y = lerp(hop_y_origin, hop_y_origin - 10, 7 * sin((jump_time / global.game_speed) * pi * 4));
			jump_time++;
		}
		else
		{
			y = hop_y_origin
			jump_time = 0;
			jumping = false;
			wobble_time = 0;
		}
	}
	else
	{
		image_angle = sin((wobble_time * wobble_speed) * (2 * pi)) * (max_angle_selected);
		wobble_time += 1 / global.game_speed;
	}
}