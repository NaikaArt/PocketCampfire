/// @description Toggle inventory

selected_button = -1;
selected_slot = -1;

on_screen = active || is_toggling;
if(active) global.game_state = GAME_STATE.INVENTORY;

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

#region //Select slot

mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

var _cell_buff_x = (cell_size + slot_spacing_x) * scale;
var _cell_buff_y = (cell_size + slot_spacing_y) * scale;

var _i_mousex = mousex - inv_x;
var _i_mousey = mousey - inv_y;

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

//Check if mouse is over bin
bin_selected = (mousex >= bin_x && mousex < bin_x + bin_width * scale && mousey > bin_y && mousey < bin_y + bin_height * scale);
if(bin_selected && !bin_last_selected && held_item != -1) audio_play_sound(snd_trashcan_open, 100, false);
bin_last_selected = bin_selected;

//Check if mousue is over buttons
selected_button = -1;
if(mousex >= save_button_x && mousex < save_button_x + inv_button_size * scale && mousey >= save_button_y && mousey < save_button_y + inv_button_size * scale)
{ 
	selected_button = 0; 
	if(selected_button != last_button) audio_play_sound(snd_button_hover, 100, false); 
	last_button = selected_button;
}
else if(mousex >= load_button_x && mousex < load_button_x + inv_button_size * scale && mousey >= load_button_y && mousey < load_button_y + inv_button_size * scale)
{ 
	if(save_exists)
	{
		selected_button = 1; 
		if(selected_button != last_button) audio_play_sound(snd_button_hover, 100, false); 
		last_button = selected_button;
	}
}
else if(mousex >= settings_button_x && mousex < settings_button_x + inv_button_size * scale && mousey >= settings_button_y && mousey < settings_button_y + inv_button_size * scale)
{ 
	selected_button = 2; 
	if(selected_button != last_button) audio_play_sound(snd_button_hover, 100, false); 
	last_button = selected_button;
}
else if(mousex >= exit_button_x && mousex < exit_button_x + inv_button_size * scale && mousey >= exit_button_y && mousey < exit_button_y + inv_button_size * scale)
{ 
	selected_button = 3; 
	if(selected_button != last_button) audio_play_sound(snd_button_hover, 100, false); 
	last_button = selected_button;
}

//Left click handling
if(mouse_check_button_pressed(mb_left))
{
	if(selected_slot > -1)
	{
		var _selected_slot_item = global.ds_inventory[# 0, selected_slot];

		if(_selected_slot_item != ITEM.NONE)
		{
			audio_play_sound(snd_grab, 100, false);
			held_item = selected_slot;
		}
	}
	else
	{
		if(selected_button >= 0)
		{
			switch(selected_button)
			{
				case 0:
					audio_play_sound(snd_click_1, 100, false);  
					if(!global.saveload_disabled)
					scr_create_confirmation("Are you sure you want to save your game?\nThis overwrites your current save file!", scr_save_game);
					else scr_save_game();
				break;
				case 1:
					audio_play_sound(snd_click_1, 100, false);  
					if(!global.saveload_disabled)
					scr_create_confirmation("Are you sure you want to load your current save?\nUnsaved progress will be lost!", scr_load_game); 
					else scr_load_game();
				break;
				case 2:
					audio_play_sound(snd_click_2, 100, false);  
					scr_open_settings();
				break;
				case 3:
					audio_play_sound(snd_click_1, 100, false);  
					scr_create_confirmation("Are you sure you want to go back to the title screen?\nAny unsaved progress will be lost!", scr_goto_mainmenu);
				break;
			}
		}
	}
}

//Drop item
if(mouse_check_button_released(mb_left) && held_item != -1)
{
	audio_play_sound(snd_drop, 100, false);
	
	if(selected_slot != -1)
	{
		if(selected_slot != held_item)
		{
			var _drop_slot = global.ds_inventory[# 0, selected_slot];
			var _drop_slot_amount = global.ds_inventory[# 1, selected_slot];
			var _drop_slot_info = global.ds_inventory[# 2, selected_slot];
		
			global.ds_inventory[# 0, selected_slot] = global.ds_inventory[# 0, held_item];
			global.ds_inventory[# 0, held_item] = _drop_slot;
			
			global.ds_inventory[# 1, selected_slot] = global.ds_inventory[# 1, held_item];
			global.ds_inventory[# 1, held_item] = _drop_slot_amount;
			
			global.ds_inventory[# 2, selected_slot] = global.ds_inventory[# 2, held_item];
			global.ds_inventory[# 2, held_item] = _drop_slot_info;
		}
	}
	else
	{
		if(bin_selected)
		{
			audio_play_sound(snd_trashcan_close, 100, false);
			
			global.ds_inventory[# 0, held_item] = ITEM.NONE;
			global.ds_inventory[# 1, held_item] = 0;
		}
	}
	
	held_item = -1;
}