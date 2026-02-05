/// @function play_mon_cry(species, cry_type);

function scr_play_mon_cry(_species, _cry_type)
{
	with(obj_sound_manager)
	{
		var _cry_map = mon_cries[? _species];
		var _cry_sound = _cry_map[? _cry_type];
		audio_play_sound(_cry_sound, 200, false);
	}
}