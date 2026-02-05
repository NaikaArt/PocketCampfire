/// @description 

mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

if(held_slider != -1)
{
	slider_pos[held_slider] = (mousex - slider_x_min) / (slider_x_max - slider_x_min);
	slider_pos[held_slider] = clamp(slider_pos[held_slider], 0, 1);
	
	switch(held_slider)
	{
		case 0:
			with(obj_sound_manager)
			{
				music_volume = other.slider_pos[other.held_slider];
				event_user(0);
			}
		break;
		case 1:
			with(obj_sound_manager)
			{
				sfx_volume = other.slider_pos[other.held_slider];
				event_user(0);
				
				var _video_status = video_get_status()
				if(_video_status != video_status_closed) video_set_volume(sfx_volume);
			}
		break;
		case 2:
			with(obj_sound_manager)
			{
				voice_volume = other.slider_pos[other.held_slider];
				event_user(0);
			}
		break;
		case 3:
			slider_pos[other.held_slider] = round(slider_pos[other.held_slider] * 3) / 3;
			global.text_speed = round(lerp(1, 4, slider_pos[other.held_slider]));
		break;
	}
}

if(mousex > done_x - done_width / 2 && mousex < done_x + done_width / 2 && mousey > done_y - done_height / 2 && mousey < done_y + done_height / 2)
{
	if(!done_active) 
	{
		audio_play_sound(snd_button_hover, 100, false);
		done_active = true;
	}
}
else
{
	if(done_active) done_active = false;
}