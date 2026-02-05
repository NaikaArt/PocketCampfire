/// @description 

if(delay > (z / 10))
{
	x = pos_x;
	y = pos_y;
	delay -= 1 / global.game_speed;
	
	x_scale = 1;
	if(x <= 480) { x_scale = -1; }
	if(z = 1) {x_scale *= -1; }
}
else
{
	if(shake_time > 0)
	{
		shake_time -= 1 / global.game_speed;
		x = pos_x + (sin(shake_time * 2 * pi * shake_frequency + offset) * shake_distance);
	}
	else
	{
		var _dir = x > 480 ? 1 : -1;	
		x += _dir * move_spd;
	}
}