/// @description Zipper Sound & Stat Award

instance_destroy(textbox);
audio_play_sound(snd_zipper_open, 200, false);

scr_modify_stat(global.active_mon, "affection", 100, "add", noone);