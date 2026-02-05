// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_load_settings()
{
	if(global.saveload_disabled)
	{
		instance_create_depth(0, 0, 0, obj_saveload_warning);
		return;
	}
	
	if(file_exists("settings.sav"))
	{
		var _buffer = buffer_load("settings.sav");
		var _load_string = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
	
		var _wrapper = json_decode(_load_string);
	
		var _root_list = _wrapper[? "ROOT"];
		var _settings_map = ds_map_create();
		_settings_map = _root_list[| 0];
		
		var _music_volume = ds_map_find_value(_settings_map, "music volume");
		var _sfx_volume = ds_map_find_value(_settings_map, "sfw volume");
		var _voice_volume = ds_map_find_value(_settings_map, "voice volume");
		var _human_voice = ds_map_find_value(_settings_map, "human voice");
		var _text_speed = ds_map_find_value(_settings_map, "text speed");
		
		with(obj_sound_manager)
		{
			if(_music_volume != undefined)
			music_volume = _music_volume;
			if(_music_volume != undefined)
			sfx_volume = _sfx_volume;
			if(_music_volume != undefined)
			voice_volume = _voice_volume;
			if(_music_volume != undefined)
			human_voice_enabled = _human_voice;
		}
		
		if(_text_speed != undefined)
		global.text_speed = _text_speed;
	
		ds_map_destroy(_wrapper);
		return true;
	}
	else return false;
}