/// @description Draw the GUI & Text

// Draw Box
draw_sprite(box, 0, box_x, box_y);

// Draw Text
var _current_text = string_copy(text_parsed, 1, text_index);

draw_set_font(text_font); draw_set_color(c_black);
draw_text_ext(text_x, text_y, _current_text, text_separation, text_max_width);

// Draw option box
if(state == TEXTBOX_STATE.CHOICE)
draw_sprite_stretched(choicebox, 0, choicebox_x - choicebox_width, choicebox_y - choicebox_height, choicebox_width, choicebox_height);