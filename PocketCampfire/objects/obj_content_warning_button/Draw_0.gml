/// @description 

if(assets_loaded)
{
	draw_sprite(sprite_index, 0, x, y);
	if(over) 
	{ 
		gpu_set_blendmode(bm_add);
		draw_sprite(sprite_index, 0, x, y); 
		gpu_set_blendmode(bm_normal);
	}
}
else
{
	draw_sprite_ext(sprite_index, 1, x, y, 1, 1, 0, c_white, 0.5);
}