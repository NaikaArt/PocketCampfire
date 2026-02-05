function scr_abort_scene() 
{
	var _fadetime = 0.4 * global.game_speed;
	with(obj_scene_video)
	{
		alarm[1] = _fadetime;
		audio_group_set_gain(ag_voice, ag_voice_gain, _fadetime);
	}
	
	scr_fade_scene(rm_camp);
	scr_set_music_gain(1, 0.5);
}