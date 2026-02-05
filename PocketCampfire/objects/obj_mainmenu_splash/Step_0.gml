/// @description 

if(mon_shake_speed > 0)
{
	mon_shake_val += mon_shake_speed * (1 / global.game_speed);
	mon_x_offset = sin(mon_shake_val * (2 * pi)) * mon_shake_amplitude;
}
else
{
	mon_x_offset = 0;
}