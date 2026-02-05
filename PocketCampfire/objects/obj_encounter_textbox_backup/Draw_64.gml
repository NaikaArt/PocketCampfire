/// @description Draw the GUI & Text

// Draw Box
draw_sprite(box, 0, box_x, box_y);

// Draw Text
if(text_index < str_length) { text_index += global.text_speed; }
else 
{
	if(state == TEXTBOX_STATE.WRITING) { alarm[0] = linger_time * global.game_speed; state = TEXTBOX_STATE.DONE; }
}
var _substr = string_copy(text, 1, text_index);

draw_set_font(font);
text_y = box_y + (box_height - string_height_ext(text, 26, text_max_width)) / 2;
draw_text_ext(box_x + text_margin, text_y, _substr, 26, text_max_width);