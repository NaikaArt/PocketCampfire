/// @description Insert description here
// You can write your code in this editor

state = TEXTBOX_STATE.WRITING;
linger_time = 3;

box = spr_textbox_default;
box_width = sprite_get_width(box);
box_height = sprite_get_height(box);
box_padding_x = (global.game_width / 2) - (box_width / 2);
box_padding_y = 15;
box_x = box_padding_x;
box_y = global.game_height - box_height - box_padding_y;

text_margin = 40;
text_y = box_y;
text_max_width = box_width - (2 * text_margin);

name = global.active_mon[? "name"];
gender_id = global.active_mon[? "gender"];
gender = gender_id == GENDERS.F ? "♀" : "♂";

text = name + gender + " smelled your cooking and joined the camp!";
str_length = string_length(text);

font = fnt_default; draw_set_font(font);

text_index = 0;

audio_play_sound(snd_encounter_jingle, 200, false);