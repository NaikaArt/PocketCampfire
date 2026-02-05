/// @desc Save the game
function scr_save_game() 
{
	if(global.saveload_disabled)
	{
		instance_create_depth(0, 0, 0, obj_saveload_warning);
		return;
	}
	
	if(global.game_state == GAME_STATE.LOCKED) { scr_reset_gamestate(); }

	//Creat root list

	var _root_list = ds_list_create();

	var _mon_list = ds_list_create();
	var _inventory_list = ds_list_create();

	ds_list_add(_root_list, _mon_list);
	ds_list_mark_as_list(_root_list, ds_list_size(_root_list) - 1);
	ds_list_add(_root_list, _inventory_list);
	ds_list_mark_as_list(_root_list, ds_list_size(_root_list) - 1);

	for(var _i = 0; _i < ds_list_size(global.ds_mon); _i++)
	{
		var _source_map = global.ds_mon[| _i];
		var _map = ds_map_create();
		ds_list_add(_mon_list, _map);
		ds_list_mark_as_map(_mon_list, ds_list_size(_mon_list) - 1);

		ds_map_copy(_map, _source_map);
	}

	for(var _j = 0; _j < global.inventory_slots; _j++)
	{
		var _item_map = ds_map_create();
		ds_list_add(_inventory_list, _item_map);
		ds_list_mark_as_map(_inventory_list, ds_list_size(_inventory_list) - 1);
	
		ds_map_add(_item_map, "id", global.ds_inventory[# 0, _j]);
		ds_map_add(_item_map, "count", global.ds_inventory[# 1, _j]);
	}

	// Wrap root list in a map
	var _wrapper = ds_map_create();
	ds_map_add_list(_wrapper, "ROOT", _root_list);

	// Save all to a string

	var _save_string = json_encode(_wrapper);

	// Save to file

	var _buffer = buffer_create(string_byte_length(_save_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _save_string);
	buffer_save(_buffer, "savefile.sav");
	buffer_delete(_buffer);

	// Clean up
	ds_map_destroy(_wrapper);
}