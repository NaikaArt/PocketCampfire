function scr_cook(_ingredients) 
{
	//global.game_state = GAME_STATE.LOCKED;
	
	var _ingredient_slot_count = array_length(_ingredients);
	var _ingredient_count = array_length(_ingredients);
	for(var _i = 0; _i < _ingredient_count; _i++) if(_ingredients[_i] == 0) _ingredient_count--;
	var _existing_mons = [];
	
	// Set up the species list and total meal effects
	var _ds_mon_scores = ds_map_create();
	for(var _i = 0; _i < SPECIES.AMOUNT; _i++) ds_map_add(_ds_mon_scores, _i, 1);
	var _unique_ingredients = array_unique(_ingredients);
	var _unique_ingredient_count = array_length(_unique_ingredients);
	if(array_contains(_ingredients, 0)) _unique_ingredient_count--;
	
	var _rating = 0;
	var _arousal = 0;
	var _affection = 0;
	var _male = 1;
	var _female = 1;
	
	var _encounter_affection = 0;
	var _guarantied_species = -1;  // Enigma berry, species are in alphabetical order
	var _swap_genders = false;
	
	_arousal =  lerp(8, 30, _ingredient_count / _ingredient_slot_count);
	_arousal += lerp(8, 30, _unique_ingredient_count / _ingredient_slot_count);
	
	_rating =  lerp(10, 55, _ingredient_count / _ingredient_slot_count);
	_rating += lerp(10, 55, _unique_ingredient_count / _ingredient_slot_count);
	
	// Going over each item in the list
	for(var _i_item = 0; _i_item < _ingredient_slot_count; _i_item++)
	{
		switch(_ingredients[_i_item])
		{
			case ITEM.RICE:
				_arousal += 10;
				break;
			case ITEM.SWEET_POTATOES:
				_rating += 25;
				break;
			case ITEM.SWAP_SHROOMS:
				_arousal += 30;
				_swap_genders = true;
				break;
				
			case ITEM.ORAN_BERRY:
				_ds_mon_scores[? SPECIES.ALOLANVULPIX] += 1;
				_ds_mon_scores[? SPECIES.LUCARIO] += 1;
				break;
			case ITEM.CHERI_BERRY:
				_ds_mon_scores[? SPECIES.CINDERACE] += 1;
				_ds_mon_scores[? SPECIES.VULPIX] += 1;
				_ds_mon_scores[? SPECIES.BRAIXEN] += 1;
				break;
			case ITEM.COLBUR_BERRY:
				_ds_mon_scores[? SPECIES.NICKIT] += 1;
				_ds_mon_scores[? SPECIES.ZOROARK] += 1;
				break;
			case ITEM.KEBIA_BERRY:
				_female += 2;
				break;
			case ITEM.BELUE_BERRY:
				_male += 2;
				break;
			case ITEM.PECHA_BERRY:
				_rating += 10;
				_encounter_affection += 5;
				break;
			case ITEM.SITRUS_BERRY:
				_arousal += 15;
				break;
			case ITEM.QUALOT_BERRY:
				_affection += 6;
				break;
			case ITEM.ENIGMA_BERRY:
				switch(_i_item)
				{
					case 0: _guarantied_species = SPECIES.ALOLANVULPIX; break;
					case 1: _guarantied_species = SPECIES.BRAIXEN; break;
					case 2: _guarantied_species = SPECIES.CINDERACE; break;
					case 3: _guarantied_species = SPECIES.LUCARIO; break;
					case 4: _guarantied_species = SPECIES.NICKIT; break;
					case 5: _guarantied_species = SPECIES.VULPIX; break;
					case 6: _guarantied_species = SPECIES.ZOROARK; break;
					case 7: _guarantied_species = irandom_range(0, SPECIES.ZOROARK); break;
				}
				break;
		}
	}
	
	// Apply effects to existing 'Mons
	for(var _i = 0; _i < ds_list_size(global.ds_mon); _i++)
	{
		var _map = global.ds_mon[| _i];
		
		// Add arousal and affection
		scr_modify_stat(_map, "arousal", _arousal, "add", noone);
		scr_modify_stat(_map, "affection", _affection, "add", AFFECTION_LEVEL.NEW);
		
		// Swap gender if needed
		if(_swap_genders)
		{
			var _new_gender = _map[? "gender"] == GENDERS.M ? GENDERS.F : GENDERS.M;
			_map[? "gender"] = _new_gender;
		}
		
		// Store all unique mons for later
		_existing_mons[_i, 0] = _map[? "species"];
		_existing_mons[_i, 1] = _map[? "gender"];
	}
	
	
	// Determine if we have an encounter
	_rating = clamp(_rating, 0, 100);
	var _encounter_success = irandom_range(0, 100) <= _rating;
	
	// If the encounter is a success, determine what species
	
	if(_encounter_success)
	{
		var _species_list = [];
		
		// Go over each species and based on points scored, add X times to the species list
		for(var _i_species = 0; _i_species < ds_map_size(_ds_mon_scores); _i_species++)
		{
			var _points = _ds_mon_scores[? _i_species];
			if(_points == 0) continue;
			
			// For each point, add 'Mon X times
			for(var _x = 0; _x < _points; _x++) array_push(_species_list, _i_species);
		}
		
		// Try again on duplicate, scales with how many mon already obtained
		var _retries = 1 + floor(ds_list_size(global.ds_mon) / 2.5);
		var _found_duplicate = true;
		var _species = SPECIES.NICKIT;
		var _gender = GENDERS.M;
		
		randomize();
		
		while(_found_duplicate && _retries >= 0)
		{
			// Select a species and gender
			_species = _guarantied_species > -1 ? 
			_guarantied_species : 
			_species_list[irandom_range(0, array_length(_species_list) - 1)];
				
			_gender = random_range(0, _male + _female) > _male ? GENDERS.F : GENDERS.M;
			
			// Check if this combination exists anywhere in the existing mons
			_found_duplicate = false;
			for(var _i = 0; _i < array_length(_existing_mons); _i++)
			{
				if(_existing_mons[_i, 0] == _species && _existing_mons[_i, 1] == _gender)
				{
					_found_duplicate = true;
					break;
				}
			}
			_retries--;
		}
		
		if(!_found_duplicate) 
		{ 
			// Create the selected mon
			scr_create_mon(_species, _gender);
			global.active_mon = ds_list_find_value(global.ds_mon, ds_list_size(global.ds_mon) - 1);
			global.encounter_imminent = true;
			
			scr_modify_stat(global.active_mon, "affection", _encounter_affection, "add", AFFECTION_LEVEL.MEDIUM);
		}
		else
		{
			global.encounter_imminent = false;
			_encounter_success = false; 
		}
	}
	
	var _fade_time = 10;
	_fade_time += ds_list_size(global.ds_mon) * 0.25;
	_fade_time += (150 / global.game_speed) / global.text_speed;
	
	var _target_room = _encounter_success ? rm_encounter : rm_camp;
	scr_fade_scene(_target_room, 0.5, _fade_time);
	
	// Debug report for checking chances and results
	/*
	show_debug_message("");
	show_debug_message("-- COOKING REPORT -----------------");
	show_debug_message("");
	
	show_debug_message("Ingredients:" + string(_ingredients));
	
	show_debug_message("Rating:" + string(_rating));
	show_debug_message("Arousal Boost:" + string(_arousal));
	show_debug_message("Affection Boost:" + string(_affection));
	show_debug_message("Female Chance:" + string(_female));
	show_debug_message("Male Chance:" + string(_male));
	
	show_debug_message("");
	
	show_debug_message("Encounter Affection:" + string(_encounter_affection));
	show_debug_message("Guarantied Encounter:" + string(_guarantied_species));
	show_debug_message("Swap Genders:" + string(_swap_genders));
	
	show_debug_message("");
	
	show_debug_message("Nickit: " + string(_ds_mon_scores[? SPECIES.NICKIT]));
	show_debug_message("Vulpix: " + string(_ds_mon_scores[? SPECIES.VULPIX]));
	show_debug_message("AlolanVulpix: " + string(_ds_mon_scores[? SPECIES.ALOLANVULPIX]));
	show_debug_message("Lucario: " + string(_ds_mon_scores[? SPECIES.LUCARIO]));
	show_debug_message("Cinderace: " + string(_ds_mon_scores[? SPECIES.CINDERACE]));
	show_debug_message("Braixen: " + string(_ds_mon_scores[? SPECIES.BRAIXEN]));
	show_debug_message("Zoroark: " + string(_ds_mon_scores[? SPECIES.ZOROARK]));
	
	show_debug_message("");
	
	show_debug_message("Success? " + string(_encounter_success));
	if(_encounter_success && !is_undefined(global.active_mon))
	{
		var _new_spawned_species = scr_get_species_name(global.active_mon[? "species"]);
		show_debug_message("Encounter:" + _new_spawned_species);
	}
	*/
}