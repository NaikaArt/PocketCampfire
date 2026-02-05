/// @description 

if(!dug_up)
{
	draw_sprite_ext(burried_item, 0, burried_item_x, burried_item_y, 1, 1, 0, c_white, burried_item_a);
}
else
{
	draw_sprite_stretched_ext(item_sprite, item_type, burried_item_x - item_w / 2, item_y - item_h / 2, item_w, item_h, c_white, item_alpha);
}