function scr_camp_spawn_mon(_index) 
{	
	if(ds_list_size(global.ds_mon) == 0) { return; }
	var _mon_map = ds_list_find_value(global.ds_mon, _index);
	var _x = _mon_map[? "location x"];
	var _y = _mon_map[? "location y"];
	
	if(_x <= 0 || _y <= 0)
	{
		var _camp_hitbox = instance_find(obj_camp_hitbox, 0);
		var _hit = noone;
	
		while(_hit == noone)
		{
			_x = irandom_range(_camp_hitbox.x, _camp_hitbox.x + _camp_hitbox.sprite_width);
			_y = irandom_range(_camp_hitbox.y, _camp_hitbox.y + _camp_hitbox.sprite_height);
			_hit = collision_point(_x, _y, _camp_hitbox, true, false);
		}
	}
	
	var _mon = instance_create_layer(_x, _y, "Mons", obj_camp_mon)
	_mon.mon_id = _index;
	_mon.species_id = _mon_map[? "species"];
	_mon.gender = _mon_map[? "gender"];
	_mon.arousal = _mon_map[? "arousal"];
	_mon.x = _x;
	_mon.y = _y;
	_mon.map = _mon_map;
	_mon.alarm[1] = 1;
}