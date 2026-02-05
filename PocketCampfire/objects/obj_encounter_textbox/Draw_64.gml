/// @description Draw the GUI & Text

// Draw Box
draw_sprite(box, 0, box_x, box_y);

// Draw Text
var _current_text = string_copy(text, 1, text_index);
draw_set_font(text_font); draw_set_color(c_black);
draw_text_ext(text_x, text_y, _current_text, text_separation, text_max_width);

draw_set_color(c_white);