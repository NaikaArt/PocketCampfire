/// @description Update Audio Group Volume

audio_group_set_gain(ag_music, music_volume, 0);
audio_group_set_gain(ag_sfx, sfx_volume, 0);
audio_group_set_gain(ag_voice, voice_volume, 0);

var _human_volume = human_voice_enabled ? voice_volume : 0;
audio_group_set_gain(ag_human_voice, _human_volume, 0);