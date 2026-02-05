/// @description Open or close inventory

save_exists = file_exists("savefile.sav");

if(!active)
{
	animation_direction = 1;
	active = true;
	is_toggling = true;
	
	audio_play_sound(snd_slide_woosh, 100, false);
	
	global.game_state = GAME_STATE.INVENTORY;
}
else
{
	animation_direction = -1;
	active = false;
	is_toggling = true;
	
	audio_play_sound(snd_slide_woosh, 100, false, 1, 0, 0.8);
	
	with(obj_cooking_menu) 
	{
		if(active) global.game_state = GAME_STATE.COOKING;
		else global.game_state = GAME_STATE.CAMP;
	}
}