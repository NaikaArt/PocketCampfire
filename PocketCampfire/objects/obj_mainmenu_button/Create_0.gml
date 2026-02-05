/// @description Insert description here
// You can write your code in this editor

locked = false;
selected = false;
save_found = file_exists("savefile.sav");
is_active = button_id == 2 && !save_found ? false : true;

image_speed = 0;
image_index = sprite_index_id;
image_alpha = is_active ? 1 : 0.4;