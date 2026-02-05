// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_load_game_data()
{
	if(global.saveload_disabled)
	{
		instance_create_depth(0, 0, 0, obj_saveload_warning);
		return;
	}
	
	if(file_exists("savefile.sav"))
	{
		var _buffer = buffer_load("savefile.sav");
		var _load_string = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
	
		var _wrapper = json_decode(_load_string);
	
		var _root_list = _wrapper[? "ROOT"];
		var _mon_list = _root_list[| 0];
		var _inventory_list = _root_list[| 1];
	
		ds_list_clear(global.ds_mon);
		ds_grid_clear(global.ds_inventory, 0);
		
		with(obj_camp_mon)
		{
			instance_destroy();
		}
	
		for(var _i = 0; _i < ds_list_size(_mon_list); _i++)
		{
			var _map = _mon_list[| _i];
		
			var _species_id = _map[? "species"];
			var _gender = _map[? "gender"];
			var _affection = _map[? "affection"];
			var _hunger = _map[? "hunger"];
			var _arousal = _map[? "arousal"];
			var _location_x = _map[? "location x"];
			var _location_y = _map[? "location y"];
		
			scr_create_mon_ext(_species_id, _gender, _affection, _hunger, _arousal, _location_x, _location_y);
		}

		for(var _i = 0; _i < global.inventory_slots; _i++)
		{
			var _item_map = _inventory_list[| _i];
		
			global.ds_inventory[# 0, _i] = _item_map[? "id"];
			global.ds_inventory[# 1, _i] = _item_map[? "count"];
			global.ds_inventory[# 2, _i] = scr_get_item_description(_item_map[? "id"], false);
		}
	
		ds_map_destroy(_wrapper);
		return true;
	}
	else return false;
}