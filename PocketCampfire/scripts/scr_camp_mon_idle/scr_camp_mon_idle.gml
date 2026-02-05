/// @desc Idle Wobble Animation
function scr_camp_mon_idle() 
{
	image_angle = sin((wobble_time * (wobble_speed / 2)) * (2 * pi)) * (max_angle);
	wobble_time += 1 / global.game_speed;

	if(jumping) { y = hop_y_origin; jump_time = 0; jumping = false; }

	if(alarm[0] == -1) {alarm[0] = random_range(3, 10) * global.game_speed}
}