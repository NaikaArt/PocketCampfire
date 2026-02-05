/// @description Calculate movement

spd = spd * (1 + grav / global.game_speed);
y += spd / global.game_speed;
image_angle += rotation_speed * 360 * (1 / global.game_speed);
if(y > global.game_height)
{
	instance_destroy(id);
}