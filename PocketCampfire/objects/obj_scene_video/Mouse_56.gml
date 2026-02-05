/// @description Insert description here

if(fading || finished || video_close_pending || video_open_pending || global.game_state == GAME_STATE.LOCKED) { return; }

if(selected_menubutton != -1)
{
	switch(selected_menubutton)
	{
		case 0:
			scr_create_confirmation("Are you sure you want to leave?", scr_abort_scene); 
			break;
		case 1:
			scr_open_settings();
			break;
		case 2:
			voice_enabled = !voice_enabled;
			with(obj_sound_manager) 
			{
				human_voice_enabled = other.voice_enabled;
				event_user(0);
			}
		break;
	}
	
	return;
}

if(selected_button == -1) 
{
	if(current_phase == 4) 
	{ 
		scr_end_scene();
		alarm[1] = 1 * global.game_speed; 
		finished = true;
	}
	return; 
}

if(selected_button >= 2)
{
	if(selected_button != 5)
	{
		fading = true;
		fade_dir = 1;
		target_phase = selected_button - 2;
	}
	else
	{
		current_phase = 3;
		video_last_position = -100;
		event_user(3);
	}
}
else
{
	if(selected_button == 0) { target_mode = SCENE_MODE.ORAL; }
	else { target_mode = SCENE_MODE.SEX; }
	
	fading = true;
	fade_dir = 1;
	target_phase = 0;
}