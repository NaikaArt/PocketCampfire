/// @description 

if(grass_blades_a > 0)
{
	if(grass_blades_i < 0.5) { grass_blades_i += (1 / grass_blades_time) / global.game_speed; }
	else { grass_blades_i += (1 / grass_blades_time) / global.game_speed / 1.4; }
	if(grass_blades_ib < 0.5) { grass_blades_ib += (1 / grass_blades_time) / global.game_speed; }
	else { grass_blades_ib += (1 / grass_blades_time) / global.game_speed / 1.4; }

	grass_blades_y = lerp(640, 0, sin(grass_blades_i * pi));
	grass_blades_yb = lerp(640, 0, sin(grass_blades_ib * pi));

	if(grass_blades_i > 0.7)
	{
		grass_blades_a -= 3/global.game_speed;
	}
}
else
{
	if(tall_grass_delay > 0) { tall_grass_delay -= 1 / global.game_speed; }
}

if(tall_grass_delay <= 0)
{
	if(!tall_grass_active)
	{
		tall_grass_active = true;
		event_perform(ev_other, ev_user0);
	}
	a -= 1 / global.game_speed;
	sprite_fade_delay -= 1 / global.game_speed;
	
	if(sprite_fade_delay <= 0 && sprite_fade > 0)
	{
		sprite_fade -= 2 / global.game_speed;
	}
}