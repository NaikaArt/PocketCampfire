/// @description Music Transition Play New

if(!audio_group_is_loaded(ag_music))
	alarm[1] = 1;

if(target_music == undefined) return;
	
music_playing = target_music;
	
audio_play_sound(music_playing, 100000, true);
audio_sound_gain(music_playing, 0, 0);
audio_sound_gain(music_playing, music_volume, transition_time);