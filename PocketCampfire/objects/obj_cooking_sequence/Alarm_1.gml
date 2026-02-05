/// @description Mon Cries

if(current_mon_cry_id < mons_count)
{
	var _mon_map = global.ds_mon[| current_mon_cry_id];
	var _species_id = _mon_map[? "species"];
	scr_play_mon_cry(_species_id, MON_CRIES.HAPPY);
	
	current_mon_cry_id++;
	alarm[1] = mon_cry_interval * global.game_speed;
}