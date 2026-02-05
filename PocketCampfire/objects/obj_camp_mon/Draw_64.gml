/// @description Draw interaction buttons

// Draw Gender Icon
if(gendericon_size_a > 0) 
draw_sprite_ext(gendericon, gender, x + width / 2, y - height, gendericon_size_a, gendericon_size_a, 0, c_white, gendericon_size_a);

// Draw Selected Mode Buttons
if(state == POKEMON_STATES.SELECTED)
{
	var _interact_active = active_button == 0 ? 1 : 0;
	var _release_active = active_button == 1 ? 1 : 0;
	
	draw_sprite(interact_button, _interact_active, interact_button_x, interact_button_y);
	draw_sprite(release_button, _release_active, release_button_x, release_button_y);
}