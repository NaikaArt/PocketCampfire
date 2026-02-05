/// @description Insert description here

if(global.game_state != GAME_STATE.CAMP) { return; }

active = true;
image_index = 1;

audio_play_sound(snd_grab, 100, false);