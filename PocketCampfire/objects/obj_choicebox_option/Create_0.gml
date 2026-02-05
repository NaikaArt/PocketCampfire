/// @description Creation

textbox = instance_find(obj_interaction_textbox, 0);

// Own Box Variables
sprite = spr_choicebox_option;
width = sprite_get_width(sprite);
height = sprite_get_height(sprite);
depth = -2;

// State Variables
selected = false;
last_selected = false;
option_id = 0;
affection_threshold = 0;
arousal_threshold = 0;
arousal_cost = 0;

// Text Variables
font = fnt_default; draw_set_font(font);
text_height = string_height("M");
text_height_adjustment = 16;
text_color = c_black;
text_color_selected = c_white;

padding_x = 12;
padding_y = 6 - text_height_adjustment;
text_max_width = width - (2 * padding_x);

select_arrow = spr_select_arrow;
select_arrow_width = sprite_get_width(select_arrow);
select_arrow_height = sprite_get_height(select_arrow);

text = "";