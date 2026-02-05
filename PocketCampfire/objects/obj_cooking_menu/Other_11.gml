/// @description Cook using ingredients

audio_play_sound(snd_click_1, 200, false);
scr_set_music(undefined, 1000);
var _sequence = instance_create_layer(0, 0, "UI", obj_cooking_sequence);

global.game_state = GAME_STATE.LOCKED;

var _ingredient_list;

for(var _i = 0; _i < ingr_slots + 1; _i++)	// +1 for the main ingredient, which is the last position
{
	_ingredient_list[_i] = ds_ingredients[# 0, _i];
}

scr_cook(_ingredient_list);

for(var _i = 0; _i < ingr_slots + 1; _i++)
{
	ds_ingredients[# 0, _i] = ITEM.NONE;
	ds_ingredients[# 1, _i] = 0;
	ds_ingredients[# 2, _i] = scr_get_item_description(ITEM.NONE, false);
}

animation_direction = -1;
active = false;
is_toggling = true;