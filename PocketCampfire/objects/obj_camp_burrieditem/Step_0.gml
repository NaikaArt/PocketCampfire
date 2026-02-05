/// @description 

if(burried_item_a < 1)
{
	burried_item_a += burried_item_fadespeed / global.game_speed;
}

if(dug_up && item_i < 1)
{
	item_i += 2.5 / global.game_speed;
}
else if(item_i >= 1)
{
	if(!sound_played) audio_play_sound(snd_item_get, 50, false);
	sound_played = true;
}

item_y = burried_item_y - sin(item_i * pi * 0.5) * item_y_dist;