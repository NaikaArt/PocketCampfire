/// scr_get_volume(audiogroup)
function scr_get_volume(argument0)
{
	with(obj_sound_manager)
	{
		switch(argument0)
		{
			case AUDIO_GROUP.MUSIC:
				return music_volume;
			case AUDIO_GROUP.SOUND:
				return sfx_volume;
			case AUDIO_GROUP.VOICE:
				return voice_volume;
			default:
				return 0;
		}
	}
}