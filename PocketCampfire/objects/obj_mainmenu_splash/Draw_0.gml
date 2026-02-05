/// @description Draw

draw_set_color(c_white);
//draw_sprite_ext(bg_sprite, 0, bg_sprite_x_offset, bg_sprite_y_offset, 1, 1, 0, c_white, 1);

draw_sprite(panel_sprite, 0, 0, 0);
var _index = mon_is_happy ? mon_index_happy : mon_index;
draw_sprite(mon_sprite, _index, mon_x + mon_x_offset, mon_y);