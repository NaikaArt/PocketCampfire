///scr_create_mon(species, gender)
function scr_create_mon(argument0, argument1) {

	var _species = argument0;
	var _gender = argument1;
	var _name = scr_get_species_name(_species);

	var _ds_new_mon = ds_map_create();

	ds_map_add(_ds_new_mon, "species", _species);
	ds_map_add(_ds_new_mon, "name", _name);
	ds_map_add(_ds_new_mon, "gender", _gender);
	ds_map_add(_ds_new_mon, "affection", 0);
	ds_map_add(_ds_new_mon, "arousal", 20);
	ds_map_add(_ds_new_mon, "location x", 0);
	ds_map_add(_ds_new_mon, "location y", 0);

	ds_list_add(global.ds_mon, _ds_new_mon);
	ds_list_mark_as_map(global.ds_mon, ds_list_size(global.ds_mon) - 1);

	ds_map_add(_ds_new_mon, "id", ds_list_size(global.ds_mon) - 1);
}