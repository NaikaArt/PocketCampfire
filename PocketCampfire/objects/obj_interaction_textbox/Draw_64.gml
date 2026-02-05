/// @description Draw Boxes & Text

// Draw Textbox
draw_sprite(box, 0, box_x, box_y);

// Draw Text
var _current_text = string_copy(text_parsed, 1, text_index);
draw_set_font(text_font); draw_set_color(c_black);

if(string_height_ext(text_parsed, text_separation, text_max_width) < box_height)
{
	draw_set_font(text_font);
	draw_text_ext(text_x, text_y, _current_text, text_separation, text_max_width);
}
else
{
	draw_set_font(text_3line_font);
	draw_text_ext(text_x, text_3line_y, _current_text, text_3line_separation, text_max_width);
}

draw_set_color(c_white);

// Draw option box
if(state == TEXTBOX_STATE.CHOICE)
draw_sprite_stretched(choicebox, 0, choicebox_x - choicebox_width, choicebox_y - choicebox_height, choicebox_width, choicebox_height);