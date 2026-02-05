/// @description Insert description here
// You can write your code in this editor

if(audio_group_is_loaded(ag_music))
{
	music_loaded = true;
	//audio_play_sound(snd_music_mainmenu, 1000, true);
}
if(audio_group_is_loaded(ag_sfx))
{
	sfx_loaded = true;
}