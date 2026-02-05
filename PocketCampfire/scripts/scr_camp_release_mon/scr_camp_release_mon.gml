///description
function scr_camp_release_mon()
{
	var _mon_id = global.active_mon[? "id"];

	ds_map_destroy(global.ds_mon[| _mon_id]);
	ds_list_delete(global.ds_mon, _mon_id);
	
	for(var _i = 0; _i < ds_list_size(global.ds_mon); _i++)
	{
		var _map = global.ds_mon[| _i];
		_map[? "id"] = _i;
	}

	with(obj_camp_mon)
	{
		if(mon_id == _mon_id) { released = true; }
	}
	
	audio_play_sound(snd_release, 200, false);

	scr_fade_scene(rm_camp, 0.3, 0.12);
}