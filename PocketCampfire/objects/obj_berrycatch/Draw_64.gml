/// @description Insert description here

if(state == BERRYCATCH_STATES.START)
{
	draw_sprite(instructions, 0, instructions_x, instructions_y);
}

if(state == BERRYCATCH_STATES.SHOWING_RESULTS)
{
	draw_sprite(summary, 0, summary_x, summary_y);
	
	draw_set_font(font); draw_set_color(c_black);
	var _string_x = summary_x + (summary_w / 2) - (summary_text_w / 2);
	draw_text(_string_x, summary_y + summary_padding_y, summary_text);
	
	draw_set_color(c_white);
	
	for(var _i = 0; _i < berry_sprite_count; _i++)
	{
		//var _x = summary_x + summary_padding_x + (berry_sprite_spacing * _i);
		var _x = _string_x + _i * (berries_w + berry_summary_spacing);
		draw_sprite_stretched(berries, _i, _x, 320, berries_w, berries_h);
		
		draw_set_font(font_count); draw_set_color(c_black);
		var _count = string(berries_caught[? _i]) + "/" + string(berries_spawned[? _i]);
		var _count_w = string_width(_count);
		draw_text(_x + berries_w / 2 - _count_w / 2, 320 + berries_h, _count);
		draw_set_color(c_white);
	}
}