/// @description Load Music + Setup

enum MON_CRIES
{
	NEUTRAL,
	HAPPY,
	AROUSED,
	SAD
}

enum AUDIO_GROUP
{
	MUSIC,
	SOUND,
	VOICE
}

audio_group_load(ag_music);
audio_group_load(ag_sfx);
audio_group_load(ag_voice);
audio_group_load(ag_human_voice);

#region // Mon Cry Maps

var _mon_cries_nickit = ds_map_create();
ds_map_add(_mon_cries_nickit, MON_CRIES.NEUTRAL, snd_nickit_default);
ds_map_add(_mon_cries_nickit, MON_CRIES.HAPPY, snd_nickit_happy);
ds_map_add(_mon_cries_nickit, MON_CRIES.AROUSED, snd_nickit_aroused);
ds_map_add(_mon_cries_nickit, MON_CRIES.SAD, snd_nickit_sad);

var _mon_cries_vulpix = ds_map_create();
ds_map_add(_mon_cries_vulpix, MON_CRIES.NEUTRAL, snd_vulpix_default);
ds_map_add(_mon_cries_vulpix, MON_CRIES.HAPPY, snd_vulpix_happy);
ds_map_add(_mon_cries_vulpix, MON_CRIES.AROUSED, snd_vulpix_aroused);
ds_map_add(_mon_cries_vulpix, MON_CRIES.SAD, snd_vulpix_sad);

var _mon_cries_lucario = ds_map_create();
ds_map_add(_mon_cries_lucario, MON_CRIES.NEUTRAL, snd_lucario_default);
ds_map_add(_mon_cries_lucario, MON_CRIES.HAPPY, snd_lucario_happy);
ds_map_add(_mon_cries_lucario, MON_CRIES.AROUSED, snd_lucario_aroused);
ds_map_add(_mon_cries_lucario, MON_CRIES.SAD, snd_lucario_sad);

var _mon_cries_cinderace = ds_map_create();
ds_map_add(_mon_cries_cinderace, MON_CRIES.NEUTRAL, snd_cinderace_default);
ds_map_add(_mon_cries_cinderace, MON_CRIES.HAPPY, snd_cinderace_happy);
ds_map_add(_mon_cries_cinderace, MON_CRIES.AROUSED, snd_cinderace_aroused);
ds_map_add(_mon_cries_cinderace, MON_CRIES.SAD, snd_cinderace_sad);

var _mon_cries_braixen = ds_map_create();
ds_map_add(_mon_cries_braixen, MON_CRIES.NEUTRAL, snd_braixen_default);
ds_map_add(_mon_cries_braixen, MON_CRIES.HAPPY, snd_braixen_happy);
ds_map_add(_mon_cries_braixen, MON_CRIES.AROUSED, snd_braixen_aroused);
ds_map_add(_mon_cries_braixen, MON_CRIES.SAD, snd_braixen_sad);

var _mon_cries_zoroark = ds_map_create();
ds_map_add(_mon_cries_zoroark, MON_CRIES.NEUTRAL, snd_zoroark_default);
ds_map_add(_mon_cries_zoroark, MON_CRIES.HAPPY, snd_zoroark_happy);
ds_map_add(_mon_cries_zoroark, MON_CRIES.AROUSED, snd_zoroark_aroused);
ds_map_add(_mon_cries_zoroark, MON_CRIES.SAD, snd_zoroark_sad);

#endregion


mon_cries = ds_map_create();
ds_map_add(mon_cries, SPECIES.NICKIT, _mon_cries_nickit);
ds_map_add(mon_cries, SPECIES.VULPIX, _mon_cries_vulpix);
ds_map_add(mon_cries, SPECIES.ALOLANVULPIX, _mon_cries_vulpix);
ds_map_add(mon_cries, SPECIES.LUCARIO, _mon_cries_lucario);
ds_map_add(mon_cries, SPECIES.CINDERACE, _mon_cries_cinderace);
ds_map_add(mon_cries, SPECIES.BRAIXEN, _mon_cries_braixen);
ds_map_add(mon_cries, SPECIES.ZOROARK, _mon_cries_zoroark);


music_playing = snd_music_camp;
music_playing = undefined;
music_list = [snd_music_camp, snd_music_mainmenu];
sfx_list = [asset_sound];

base_music_volume = 0.6;
music_volume = 0.75;
sfx_volume = 0.75;
voice_volume = 0.75;
human_voice_enabled = true;

music_loaded = false;
music_target = 0;
sfx_loaded = false;

target_music = snd_music_camp;
target_music = undefined;
transitioning = false;
transition_time = 1;

event_user(0);