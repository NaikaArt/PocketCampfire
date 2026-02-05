function scr_set_music_gain(_gain, _transition_time)
{
	with(obj_sound_manager)
	{
		if(music_playing != undefined)
		audio_sound_gain(music_playing, _gain * music_volume * base_music_volume, _transition_time * 1000);
	}
}