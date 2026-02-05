/// @description scr_set_music(sound, fade_duration)
function scr_set_music(_sound, _fade_duration) 
{
	with(obj_sound_manager)
	{
		target_music = _sound;
		transition_time = _fade_duration;
		
		event_user(1);
	}
}