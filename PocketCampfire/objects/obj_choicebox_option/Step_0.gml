/// @description Update Mouse Input

selected = point_in_rectangle(mouse_x, mouse_y, x - width, y - height, x, y);

if(selected && !last_selected) audio_play_sound(snd_button_hover, 100, false);
last_selected = selected;