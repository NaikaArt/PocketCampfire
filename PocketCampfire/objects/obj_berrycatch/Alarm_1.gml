/// @description Finish the game

state = BERRYCATCH_STATES.SHOWING_RESULTS;
scr_set_music(undefined, 1);
audio_play_sound(snd_encounter_jingle, 100, false);

for(var _i = 0; _i < ds_map_size(berries_caught); _i++)
{
	var _amount = berries_caught[? _i];
	var _item_id = _i + ITEM.ORAN_BERRY;
	
	if(_amount == 0) continue;
	
	scr_create_item(_item_id, _amount);
	berries_total += _amount;
}

summary_text = "You caught " + string(berries_total) + " out of " + string(max_berry_count) + " berries!";

alarm[0] = 3 * global.game_speed;