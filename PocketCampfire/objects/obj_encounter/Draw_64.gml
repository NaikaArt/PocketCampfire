/// @description 

draw_set_alpha(a);
draw_set_color(c_black);

draw_rectangle(0, 0, 960, 640, 0);

draw_set_alpha(grass_blades_a * 0.5);
draw_set_color(c_white);

draw_sprite(grass_blades, 0, grass_blades_x, grass_blades_yb);

draw_set_alpha(grass_blades_a);

draw_sprite(grass_blades, 0, grass_blades_x, grass_blades_y);

draw_set_alpha(1);

if(grass_blades_a <= 0)
{
	var _fade_col = merge_color(c_white, c_black, sprite_fade);
	draw_sprite_ext(sprite, 0, sprite_x, sprite_y, 1, 1, 0, _fade_col, 1);
}