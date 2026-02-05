/// @description Toggle inventory

selected_slot = -1;

on_screen = active || is_toggling;
if(active) global.game_state = GAME_STATE.COOKING;

if(is_toggling)
{
	background_opacity += animation_direction * (15 / global.game_speed);
	background_opacity = clamp(background_opacity, 0, 1);
	background_pane_lerp += animation_direction * (8 / global.game_speed);
	background_pane_lerp = clamp(background_pane_lerp, 0, 1);
	
	is_toggling = background_pane_lerp < 1 && background_pane_lerp > 0;
	
	exit;
}

mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

if(!active || global.game_state == GAME_STATE.LOCKED) { exit; }

var _ingredient_count = 0;
for(var _i = 0; _i < ingr_slots; _i++)
{
	if(ds_ingredients[# 0, _i] != ITEM.NONE) { _ingredient_count++; }
}

can_cook = (_ingredient_count != 0 && ds_ingredients[# 0, ingr_slots] != ITEM.NONE);

cook_button_active = (mousex >= cook_button_x && mousex < cook_button_x + cook_button_width && mousey > cook_button_y && mousey < cook_button_y + cook_button_height && can_cook);
if(cook_button_active && !cook_button_active_last) audio_play_sound(snd_button_hover, 100, false);
cook_button_active_last = cook_button_active;

#region //Select slot

var _cell_buff_x = (cell_size + slot_spacing_x) * scale;
var _cell_buff_y = (cell_size + slot_spacing_y) * scale;

var _i_mousex = mousex - inv_x - slot_offset_x;
var _i_mousey = mousey - inv_y - slot_offset_y;

var _i_mouse_slot_x = _i_mousex div _cell_buff_x;
var _i_mouse_slot_y = _i_mousey div _cell_buff_y;

if(_i_mouse_slot_x >= 0 and _i_mouse_slot_x < inv_slots_width and _i_mouse_slot_y >= 0 and _i_mouse_slot_y < inv_slots_height and _i_mousey > 0 and _i_mousex > 0)
{
	var _sx = _i_mousex - (_i_mouse_slot_x * _cell_buff_x);
	var _sy = _i_mousey - (_i_mouse_slot_y * _cell_buff_y);
	
	if((_sx < cell_size * scale) && (_sy < cell_size * scale))
	{
		mouse_slot_x = _i_mouse_slot_x;
		mouse_slot_y = _i_mouse_slot_y;
		
		selected_slot = mouse_slot_x + (mouse_slot_y * inv_slots_width);
		var _selected_slot_item = global.ds_inventory[# 0, selected_slot];
		
		if(selected_slot != last_slot && _selected_slot_item != ITEM.NONE) 
		{ audio_play_sound(snd_button_hover, 100, false); }
		
		last_slot = selected_slot;
	}
	else
	{
		selected_slot = -1;
	}
}
else
{
	selected_slot = -1;
}

#endregion

if(selected_slot == -1)
{
	#region //Select ingredient slot

	_i_mousex = mousex - inv_x - ingr_slot_offset_x;
	_i_mousey = mousey - inv_y - ingr_slot_offset_y;

	_i_mouse_slot_x = _i_mousex div _cell_buff_x;
	_i_mouse_slot_y = _i_mousey div _cell_buff_y;

	if(_i_mouse_slot_x >= 0 and _i_mouse_slot_x < ingr_slots_width and _i_mouse_slot_y >= 0 and _i_mouse_slot_y < ingr_slots_height and _i_mousey > 0 and _i_mousex > 0)
	{
		var _sx = _i_mousex - (_i_mouse_slot_x * _cell_buff_x);
		var _sy = _i_mousey - (_i_mouse_slot_y * _cell_buff_y);
	
		if((_sx < cell_size * scale) && (_sy < cell_size * scale))
		{
			mouse_slot_x = _i_mouse_slot_x;
			mouse_slot_y = _i_mouse_slot_y;
		
			selected_slot = mouse_slot_x + (mouse_slot_y * ingr_slots_width) + inv_slots;
			var _selected_slot_item = ds_ingredients[# 0, selected_slot - inv_slots];
		
			if(selected_slot != last_slot && _selected_slot_item != ITEM.NONE) 
			{ audio_play_sound(snd_button_hover, 100, false); }
		
			last_slot = selected_slot;
		}
		else
		{
			selected_slot = -1;
		}
	}
	else
	{
		if(_i_mousex >= main_ingr_slot_offset_x && _i_mousex < main_ingr_slot_offset_x + cell_size * scale && _i_mousey >= main_ingr_slot_offset_y - ingr_slot_offset_y && _i_mousey < main_ingr_slot_offset_y - ingr_slot_offset_y + cell_size * scale)
		{
			selected_slot = slot_grid_size - 1;
		}
		else
		{
			selected_slot = -1;
		}
	}

	#endregion
}

selected_slot_ingredient = selected_slot - inv_slots;

//Pick up item

if(mouse_check_button_pressed(mb_left))
{
	if(selected_slot > -1)
	{
		//var _selected_slot_item = ds_ingredients[# 0, selected_slot_ingredient];
		var _selected_slot_item = selected_slot < inv_slots ? global.ds_inventory[# 0, selected_slot] : ds_ingredients[# 0, selected_slot_ingredient];
		
		if(_selected_slot_item != ITEM.NONE)
		{
			audio_play_sound(snd_grab, 100, false);
			held_item = selected_slot;
			held_item_time = 0;
		}
	}
	if(cook_button_active)
	{
		event_perform(ev_other, ev_user1);
	}
}

held_item_ingredient = held_item - inv_slots;
held_item_time += 1 / global.game_speed;

#region //Drop item

if(mouse_check_button_released(mb_left) && held_item != -1)
{
	audio_play_sound(snd_drop, 100, false);
	
	// Get if this item was merely clicked, instant move it if it is
	if(held_item_time < held_item_click_timeframe)
	{
		// Send TO ingredients
		if(held_item < inv_slots)
		{
			var _item_type = global.ds_inventory[# 0, held_item];
			var _item_amount = global.ds_inventory[# 1, held_item];
			var _item_info = global.ds_inventory[# 2, held_item];
			
			if(!scr_is_main_ingredient(_item_type))
			{
				var _slot_id = -1;
				
				for(var _i = 0; _i < ingr_slots; _i++)
				{
					if(ds_ingredients[# 0, _i] == ITEM.NONE) 
					{ _slot_id = _i; break; }
				}
				
				if(_slot_id >= 0)
				{
					ds_ingredients[# 0, _slot_id] = _item_type;
					ds_ingredients[# 1, _slot_id] = 1;
					ds_ingredients[# 2, _slot_id] = _item_info;
					global.ds_inventory[# 1, held_item] -= 1;
					
					if(global.ds_inventory[# 1, held_item] == 0)
					{
						global.ds_inventory[# 0, selected_slot] = ITEM.NONE;
						global.ds_inventory[# 2, selected_slot] = scr_get_item_description(ITEM.NONE, true);
					}
				}
			}
			else if(ds_ingredients[# 0, ingr_slots] == ITEM.NONE)
			{
				ds_ingredients[# 0, ingr_slots] = _item_type;
				
				global.ds_inventory[# 1, held_item] -= 1;
				
				if(global.ds_inventory[# 1, held_item] == 0)
				{
					global.ds_inventory[# 0, selected_slot] = ITEM.NONE;
					global.ds_inventory[# 2, selected_slot] = scr_get_item_description(ITEM.NONE, true);
				}
			}
		}
		// Send TO Inventory
		else
		{
			var _held_item_ingredients = held_item - inv_slots;
			var _item_type = ds_ingredients[# 0, _held_item_ingredients];
			var _item_info = ds_ingredients[# 2, _held_item_ingredients];
			
			var _slot_id = -1;
			var _stack = false;
			
			
			// Try for the same item to stack it
			for(var _i = 0; _i < inv_slots; _i++)
			{
				if(global.ds_inventory[# 0, _i] == _item_type) 
				{ _slot_id = _i; _stack = true; break; }
			}
			// Take an empty slot otherwise
			if(_slot_id == -1)
			{
				for(var _i = 0; _i < inv_slots; _i++)
				{
					if(global.ds_inventory[# 0, _i] == ITEM.NONE) 
					{ _slot_id = _i; break; }
				}
			}
				
			if(_slot_id >= 0)
			{
				if(!_stack)
				{
					global.ds_inventory[# 0, _slot_id] = _item_type;
					global.ds_inventory[# 2, _slot_id] = _item_info;
				}
				global.ds_inventory[# 1, _slot_id] += 1;
				
				ds_ingredients[# 0, _held_item_ingredients] = ITEM.NONE;
				ds_ingredients[# 1, _held_item_ingredients] = 0;
				ds_ingredients[# 2, _held_item_ingredients] = scr_get_item_description(ITEM.NONE, true);
			}
		}
	}
	
	if(selected_slot != -1 && selected_slot != held_item)
	{
		//Dragging TO inventory
		if(selected_slot < inv_slots)
		{
			var _drop_slot = global.ds_inventory[# 0, selected_slot];
			var _drop_slot_amount = global.ds_inventory[# 1, selected_slot];
			var _drop_slot_info = global.ds_inventory[# 2, selected_slot];
			
			//FROM inventory TO inventory
			if(held_item < inv_slots)
			{
				global.ds_inventory[# 0, selected_slot] = global.ds_inventory[# 0, held_item];
				global.ds_inventory[# 0, held_item] = _drop_slot;
			
				global.ds_inventory[# 1, selected_slot] = global.ds_inventory[# 1, held_item];
				global.ds_inventory[# 1, held_item] = _drop_slot_amount;
			
				global.ds_inventory[# 2, selected_slot] = global.ds_inventory[# 2, held_item];
				global.ds_inventory[# 2, held_item] = _drop_slot_info;
			}
			//FROM ingredients TO inventory
			else
			{
				//Dropping on the same item type
				if(_drop_slot == ds_ingredients[# 0, held_item_ingredient])
				{
					ds_ingredients[# 0, held_item_ingredient] = ITEM.NONE;
					
					global.ds_inventory[# 1, selected_slot] += 1;
					ds_ingredients[# 1, held_item_ingredient] = 0;
					
					ds_ingredients[# 2, held_item_ingredient] = scr_get_item_description(ITEM.NONE, true);
				}
				//Dropping on different item type (swap)
				else
				{
					var _is_main_ingredient = scr_is_main_ingredient(global.ds_inventory[# 0, selected_slot]);
					
					if((held_item != slot_grid_size - 1 && !_is_main_ingredient) 
					|| (held_item == slot_grid_size - 1 && _is_main_ingredient || global.ds_inventory[# 0, selected_slot] == ITEM.NONE))
					{
						var _i_item_id = -1;
						var _ii = -1;
						while(_i_item_id != ds_ingredients[# 0, held_item_ingredient])
						{
							_ii++;
							_i_item_id = global.ds_inventory[# 0, _ii];
						}
					
						global.ds_inventory[# 1, _ii] += 1;
					
						ds_ingredients[# 0, held_item_ingredient] = _drop_slot;
			
						global.ds_inventory[# 1, selected_slot] -= 1;
			
						ds_ingredients[# 2, held_item_ingredient] = _drop_slot_info;
					
						//Empty item cell if new amount is 0
						if(global.ds_inventory[# 1, selected_slot] == 0)
						{
							global.ds_inventory[# 0, selected_slot] = ITEM.NONE;
							global.ds_inventory[# 2, selected_slot] = scr_get_item_description(ITEM.NONE, true);
						}
					}
				}
			}
		}
		//Dragging TO ingredients
		else
		{
			var _drop_slot = ds_ingredients[# 0, selected_slot_ingredient];
			var _drop_slot_amount = ds_ingredients[# 1, selected_slot_ingredient];
			var _drop_slot_info = ds_ingredients[# 2, selected_slot_ingredient];
			
			//FROM ingredients TO ingredients
			if(held_item >= inv_slots)
			{
				if(selected_slot != slot_grid_size - 1 && held_item != slot_grid_size - 1)
				{
					ds_ingredients[# 0, selected_slot_ingredient] = ds_ingredients[# 0, held_item_ingredient];
					ds_ingredients[# 0, held_item_ingredient] = _drop_slot;
			
					ds_ingredients[# 1, selected_slot_ingredient] = ds_ingredients[# 1, held_item_ingredient];
					ds_ingredients[# 1, held_item_ingredient] = _drop_slot_amount;
			
					ds_ingredients[# 2, selected_slot_ingredient] = ds_ingredients[# 2, held_item_ingredient];
					ds_ingredients[# 2, held_item_ingredient] = _drop_slot_info;
				}
			}
			//FROM inventory TO ingredients
			else
			{
				var _is_main_ingredient = scr_is_main_ingredient(global.ds_inventory[# 0, held_item]);
				
				if((selected_slot != slot_grid_size - 1 && !_is_main_ingredient) 
				|| (selected_slot == slot_grid_size - 1 && _is_main_ingredient))
				{
					var _i_item_id = -1;
					var _ii = -1;
					var _i_first_empty = -1;
					while(_i_item_id != _drop_slot)
					{
						_ii++;
						
						_i_item_id = global.ds_inventory[# 0, _ii];
						if(_i_item_id == ITEM.NONE && _i_first_empty == -1)
						{
							_i_first_empty = _ii;
						}
						
						if(_ii >= inv_slots)
						{
							_ii = _i_first_empty;
							global.ds_inventory[# 0, _ii] = ds_ingredients[# 0, selected_slot_ingredient];
							global.ds_inventory[# 1, _ii] = 0;
							global.ds_inventory[# 2, _ii] = scr_get_item_description(ds_ingredients[# 0, selected_slot_ingredient], true);
							break;
						}
					}
				
					global.ds_inventory[# 1, _ii] += 1;
				
					ds_ingredients[# 0, selected_slot_ingredient] = global.ds_inventory[# 0, held_item];
					ds_ingredients[# 1, selected_slot_ingredient] = 1;
					global.ds_inventory[# 1, held_item] -= 1;
					ds_ingredients[# 2, selected_slot_ingredient] = global.ds_inventory[# 2, held_item];
					
				
					if(global.ds_inventory[# 1, held_item] == 0)
					{
						global.ds_inventory[# 0, held_item] = ITEM.NONE;
						global.ds_inventory[# 2, held_item] = scr_get_item_description(ITEM.NONE, true);
					}
				}
			}
		}
	}
	
	held_item = -1;
}

#endregion