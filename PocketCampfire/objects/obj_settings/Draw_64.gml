/// @description Draw the menu

// Draw the background pane
draw_sprite(background, 0, pos_x, pos_y);

// Draw the audio bars
draw_set_font(font);

// Music
var _y = pos_y + padding_y_top;
var _handle_x = lerp(slider_x_min, slider_x_max, slider_pos[0]);

draw_set_color(c_black);
draw_text(pos_x + padding_x, _y + text_y_adjustment, "Music");

draw_set_color(c_gray);
draw_line_width(pos_x + padding_x_bar, _y + item_height / 2, pos_x + width - padding_x, _y + item_height / 2, 2);
draw_set_color(c_white);
draw_sprite(handle, 0, _handle_x, _y + item_height / 2);

// Sound
_y += item_spacing;
_handle_x = lerp(slider_x_min, slider_x_max, slider_pos[1]);

draw_set_color(c_black);
draw_text(pos_x + padding_x, _y + text_y_adjustment, "Sounds");

draw_set_color(c_gray);
draw_line_width(pos_x + padding_x_bar, _y + item_height / 2, pos_x + width - padding_x, _y + item_height / 2, 2);
draw_set_color(c_white);
draw_sprite(handle, 0, _handle_x, _y + item_height / 2);

// Voice
_y += item_spacing;
_handle_x = lerp(slider_x_min, slider_x_max, slider_pos[2]);

draw_set_color(c_black);
draw_text(pos_x + padding_x, _y + text_y_adjustment, "Voices:");

draw_set_color(c_gray);
draw_line_width(pos_x + padding_x_bar, _y + item_height / 2, pos_x + width - padding_x, _y + item_height / 2, 2);
draw_set_color(c_white);
draw_sprite(handle, 0, _handle_x, _y + item_height / 2);

// Draw the text speed setting
_y += item_spacing;
_handle_x = lerp(slider_x_min, slider_x_max, slider_pos[3]);

draw_set_color(c_black);
draw_text(pos_x + padding_x, _y + text_y_adjustment, "Text Speed");

draw_set_color(c_gray);
draw_line_width(pos_x + padding_x_bar, _y + item_height / 2, pos_x + width - padding_x, _y + item_height / 2, 2);
draw_set_color(c_white);
draw_sprite(handle, 0, _handle_x, _y + item_height / 2);

// Draw the done button
var _done_alpha = done_active ? 1 : 0.8;
draw_set_alpha(_done_alpha);
draw_sprite(done_sprite, 0, done_x, done_y);

draw_set_alpha(1);