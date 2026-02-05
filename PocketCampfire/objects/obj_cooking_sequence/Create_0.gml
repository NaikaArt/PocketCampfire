/// @description Insert description here

mons_count = ds_list_size(global.ds_mon);
mon_cry_interval = 0.25;
dynamic_mon_delay = mons_count * mon_cry_interval;
current_mon_cry_id = 0;

audio_play_sound(snd_click_1, 100, false);
event_user(0);