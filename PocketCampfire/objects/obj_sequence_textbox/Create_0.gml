/// @description Insert description here
// You can write your code in this editor

state = TEXTBOX_STATE.DONE;
linger_duration = 4;

depth = -1000;

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

text_3line_font = fnt_default_small; draw_set_font(text_font);
text_3line_height_adjustment = 20;
text_3line_charheight = string_height("M");
text_3line_separation = 30;
text_3line_y = box_y - box_height + box_padding_y - text_3line_height_adjustment;

// 'Mon stats
name = "";
gender_id = 0;
gender = "";

if(ds_exists(global.active_mon, ds_type_map))
{
	name = global.active_mon[? "name"];
	gender_id = global.active_mon[? "gender"];
	gender = gender_id == GENDERS.F ? "♀" : "♂";
}

text = "       ";
pompt_type = TEXT_PROMPT_TYPE.COOKING_SEQUENCE;
str_length = string_length(text);
text_index = 0; 