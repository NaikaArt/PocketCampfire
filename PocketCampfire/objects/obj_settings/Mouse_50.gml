/// @description Check if clicking slider

if(done_active)
{
	audio_play_sound(snd_click_3, 100, false);
	event_perform(ev_other, ev_user0);
}
else
{
	for(var _i= 0; _i< item_count; _i++)
	{
		
		var _handle_x = lerp(slider_x_min, slider_x_max, slider_pos[_i]) - handle_width / 2;
		var _handle_y = pos_y + padding_y_top + (item_spacing * _i) + (item_height / 2) - (handle_height / 2);
		
		if(mousex > _handle_x && mousex < _handle_x + handle_width && mousey > _handle_y && mousey < _handle_y + handle_height)
		{
			held_slider = _i;
			
			if(!mouse_held)
			{
				var _rand_sound_id = 0;
				switch(held_slider)
				{
					case 1:
						_rand_sound_id = irandom_range(0, preview_sound_count - 1);
						audio_play_sound(preview_sounds[_rand_sound_id], 50, false);
					break;
					case 2:
						_rand_sound_id = irandom_range(0, preview_voice_count - 1);
						audio_play_sound(preview_voices[_rand_sound_id], 50, false);
					break;
				}
			}
			
			mouse_held = true;
			return;
		}
	}
}

mouse_held = true;