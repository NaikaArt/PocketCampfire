/// @description Insert description here
// You can write your code in this editor

state = TEXTBOX_STATE.WRITING;
linger_time = 3;

mon_name = global.active_mon[? "name"];
mon_species = global.active_mon[? "species"]
mon_gender = global.active_mon[? "gender"];
gender_text = mon_gender == GENDERS.F ? "♀" : "♂";

text = mon_name + gender_text + " smelled your cooking and joined your camp!";
str_length = string_length(text);
text_index = 0;

// Text Box
box = spr_textbox_default;  // Anchor is Bottom Center
box_width = sprite_get_width(box);
box_height = sprite_get_height(box);
box_margin = 15;
box_x = global.game_width / 2;
box_y = global.game_height - box_margin;
box_padding_x = 60;
box_padding_y = 26;

text_font = fnt_default; draw_set_font(text_font);
text_height_adjustment = 16;
text_charheight = string_height("M");
text_separation = 44;
text_x = box_x - (box_width / 2) + box_padding_x;
text_y = box_y - box_height + box_padding_y - text_height_adjustment;
text_max_width = box_width - (2 * box_padding_x);

audio_play_sound(snd_encounter_jingle, 200, false);