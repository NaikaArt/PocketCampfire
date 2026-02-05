/// @description Return ingredients to inventory

if(!active)
{
	animation_direction = 1;
	active = true;
	is_toggling = true;
	
	audio_play_sound(snd_slide_woosh, 100, false);
	
	global.game_state = GAME_STATE.COOKING;
}
else
{
	for(var _i = 0; _i < ingr_slots + 1; _i++)
	{
		var _i_item = ds_ingredients[# 0, _i];
		if(_i_item == 0) { continue }
	
		var _target_slot = -1;
	
		for(var _j = 0; _j < inv_slots; _j++)
		{
			if(global.ds_inventory[# 0, _j] == _i_item)
			{
				_target_slot = _j;
				break;
			}
		}
	
		if(_target_slot != -1)
		{
			global.ds_inventory[# 1, _target_slot]++;
		}
		else
		{
			for(var _k = 0; _k < inv_slots; _k++)
			{
				if(global.ds_inventory[# 0, _k] == 0)
				{
					global.ds_inventory[# 0, _k] = _i_item;
					global.ds_inventory[# 1, _k] = 1;
					global.ds_inventory[# 2, _k] = scr_get_item_description(_i_item, false);
					break;
				}
			}
		}
	
		ds_ingredients[# 0, _i] = ITEM.NONE;
		ds_ingredients[# 1, _i] = 0;
		ds_ingredients[# 2, _i] = scr_get_item_description(ITEM.NONE, false);
	}
	
	animation_direction = -1;
	active = false;
	is_toggling = true;
	
	audio_play_sound(snd_slide_woosh, 100, false, 1, 0, 0.8);
	
	with(obj_inventory) 
	{
		if(active) global.game_state = GAME_STATE.INVENTORY;
		else global.game_state = GAME_STATE.CAMP;
	}
	global.game_state = GAME_STATE.CAMP;
}