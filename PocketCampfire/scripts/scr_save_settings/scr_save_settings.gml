// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_save_settings()
{
	if(global.saveload_disabled)
	{
		instance_create_depth(0, 0, 0, obj_saveload_warning);
		return;
	}
	
	//Creat root list

	var _root_list = ds_list_create();
	var _settings_map = ds_map_create();
	ds_list_add(_root_list, _settings_map);
	ds_list_mark_as_map(_root_list, ds_list_size(_root_list) - 1);
	
	var _music_volume = 0;
	var _sfx_volume = 0;
	var _voice_volume = 0;
	var _human_voice = true;
	
	with(obj_sound_manager)
	{
		_music_volume = music_volume;
		_sfx_volume = sfx_volume;
		_voice_volume = voice_volume;
		_human_voice = human_voice_enabled;
	}
	
	ds_map_add(_settings_map, "music volume", _music_volume);
	ds_map_add(_settings_map, "sfw volume", _sfx_volume);
	ds_map_add(_settings_map, "voice volume", _voice_volume);
	ds_map_add(_settings_map, "human voice", _human_voice);
	ds_map_add(_settings_map, "text speed", global.text_speed);
	
	
	// Wrap root list in a map
	var _wrapper = ds_map_create();
	ds_map_add_list(_wrapper, "ROOT", _root_list);

	// Save all to a string

	var _save_string = json_encode(_wrapper);

	// Save to file

	var _buffer = buffer_create(string_byte_length(_save_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _save_string);
	buffer_save(_buffer, "settings.sav");
	buffer_delete(_buffer);

	// Clean up
	ds_map_destroy(_wrapper);
}