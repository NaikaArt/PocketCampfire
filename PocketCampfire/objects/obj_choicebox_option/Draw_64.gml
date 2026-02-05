/// @description Draw Option

var _c = text_color;

// Draw Box & Selection Arrow
if(selected)
{
	draw_sprite(sprite, 0, x, y);
	_c = text_color_selected;
	
	draw_sprite(select_arrow, 0, x - width - select_arrow_width + 8, y - height / 2 - select_arrow_height / 2);
}

// Draw Text
draw_set_font(font);
draw_text_color(x - width + padding_x, y - height + padding_y, text, _c, _c, _c, _c, 1);