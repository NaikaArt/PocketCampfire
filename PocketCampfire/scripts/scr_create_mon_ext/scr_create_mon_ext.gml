///scr_create_mon_ext(species, gender, affection, hunger, arousal)
function scr_create_mon_ext(_species, _gender, _affection, _hunger, _arousal, _location_x, _location_y) 
{
	var _name = scr_get_species_name(_species);

	var _ds_new_mon = ds_map_create();

	ds_map_add(_ds_new_mon, "species", _species);
	ds_map_add(_ds_new_mon, "name", _name);
	ds_map_add(_ds_new_mon, "gender", _gender);
	ds_map_add(_ds_new_mon, "affection", _affection);
	ds_map_add(_ds_new_mon, "arousal", _arousal);
	ds_map_add(_ds_new_mon, "location x", _location_x);
	ds_map_add(_ds_new_mon, "location y", _location_y);

	ds_list_add(global.ds_mon, _ds_new_mon);
	ds_list_mark_as_map(global.ds_mon, ds_list_size(global.ds_mon) - 1);

	ds_map_add(_ds_new_mon, "id", ds_list_size(global.ds_mon) - 1);
}