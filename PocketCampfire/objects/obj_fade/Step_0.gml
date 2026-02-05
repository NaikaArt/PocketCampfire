/// @description Calculate alpha

if(mode == 0)
{
	a += (1 / global.game_speed) / fade_speed;
	if(a >= 1)
	{
		a = 1;
		mode = -1;
		alarm[0] = clamp(delay * global.game_speed, 0.1, delay * global.game_speed);
	}
}
if(mode == 1)
{
	a -= (1 / global.game_speed) / fade_speed;
	if(a <= 0)
	{
		instance_destroy(id);
	}
}