/// @description Play Human Voiceclip

audio_stop_sound(current_humanvoice);

if(mon_name == "Lucario" && mode == SCENE_MODE.ORAL)	// Lucario's oral animation should have muffled voice
	current_humanvoice = audio_play_sound(human_voiceclips_muffled[current_phase], 100, false);
else 
	current_humanvoice = audio_play_sound(human_voiceclips[current_phase], 100, false);