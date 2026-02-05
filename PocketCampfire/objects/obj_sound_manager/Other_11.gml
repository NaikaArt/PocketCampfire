/// @description Fade music out

if(music_playing != undefined)
{
	if(music_playing == target_music) return;
	
	audio_sound_gain(music_playing, 0, transition_time);
	alarm[0] = (transition_time / 1000) * global.game_speed + 1;
}
else
{
	event_user(2);
}