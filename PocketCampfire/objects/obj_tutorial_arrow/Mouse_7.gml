/// @description Insert description here

if(!selected) { return; }

var _increment = forward ? 1 : -1;
audio_play_sound(snd_click_1, 100, false);

with(tutorial)
{
	if(image_index == last_image) { scr_fade_scene(rm_mainmenu, 0.25, 0.1); return; }
	image_index = clamp(image_index + _increment, 0, last_image);	
}