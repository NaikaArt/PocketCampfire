/// @description Draw the inventory

if(on_screen)
{
	draw_set_color(background_col);
	draw_set_alpha(background_opacity);
	
	draw_rectangle(0, 0, global.game_width, global.game_height, 0);
	draw_sprite(title, 0, 0, 0);
	
	draw_set_alpha(1);
	draw_set_color(c_white);

	draw_sprite(background_pane, 1, scr_lerp_smooth(background_pane_x, background_pane_x_target, background_pane_lerp, "in"), 0);
}

if(!active) { exit; }

// Draw cutting board
draw_sprite(cutting_board, 0, cutting_board_x, cutting_board_y);


draw_set_alpha(background_opacity);

// ---------- Draw inventory items

var _slot_x = 0, _slot_y = 0, _item_x, _item_y, _this_item, _this_item_count, _item_sprite_x, _item_sprite_y;

for(var _i = 0; _i < slot_grid_size; _i++)
{
	if(_i < inv_slots)
	{
		_slot_x = _i mod inv_slots_width;
		_slot_y = _i div inv_slots_width;
	
		_item_x = inv_x + slot_offset_x + ((cell_size * scale) + slot_spacing_x) * _slot_x;
		_item_y = inv_y + slot_offset_y + ((cell_size * scale) + slot_spacing_y) * _slot_y;
		
		_this_item = global.ds_inventory[# 0, _i];
		_this_item_count = global.ds_inventory[# 1, _i];
	}
	else
	{
		if(_i != slot_grid_size - 1)
		{
			_slot_x = (_i - inv_slots) mod ingr_slots_width;
			_slot_y = (_i - inv_slots) div ingr_slots_width;

			_item_x = inv_x + ingr_slot_offset_x + ((cell_size * scale) + slot_spacing_x) * _slot_x;
			_item_y = inv_y + ingr_slot_offset_y + ((cell_size * scale) + slot_spacing_y) * _slot_y;
		}
		else
		{
			_item_x = inv_x + main_ingr_slot_offset_x;
			_item_y = inv_y + main_ingr_slot_offset_y;
		}
		
		_this_item = ds_ingredients[# 0, _i - inv_slots];
		_this_item_count = ds_ingredients[# 1, _i - inv_slots];
	}
	
	// Draw slot
	draw_sprite_ext(grid_slot,0,_item_x,_item_y,scale,scale,0,c_white,0.45);
	
	// Draw item
	switch(_i)
	{
		case held_item:
			break;
		case selected_slot:
			draw_sprite_stretched(inv_items, _this_item, _item_x + sprite_padding, _item_y + sprite_padding, sprite_size, sprite_size);
			gpu_set_blendmode(bm_add);
			draw_sprite_stretched_ext(inv_items, _this_item, _item_x + sprite_padding, _item_y + sprite_padding, sprite_size, sprite_size, c_white, 0.4);
			gpu_set_blendmode(bm_normal);
			break;
		default:
			draw_sprite_stretched(inv_items, _this_item, _item_x + sprite_padding, _item_y + sprite_padding, sprite_size, sprite_size);
			break;
	}
	
	if(_i < inv_slots)
	{
		draw_set_font(fnt_default);
		var _c = c_white;	
		if(_this_item > 0 && _i != held_item)
		{
			var _number = global.ds_inventory[# 1, _i];
			var _text = "x" + string(_number);
			var _str_width = string_width(_text) - 10;
			var _str_height = string_height(_text);
			var _xx = _item_x + (cell_size * scale) - _str_width - amount_text_padding_x;
			var _yy = _item_y + (cell_size * scale) - _str_height - amount_text_padding_y;
			scr_draw_outlined_text(_xx, _yy, _text, _c, c_black, 1);
		}
	}
	else
	{
		// Draw item on Cutting Board
		if(_this_item > 0 && _i != slot_grid_size - 1)
		{
			var _i_ingr = _i - inv_slots;
			var _item_scale_board = cutting_board_width / 4;
			var _item_x_board = cutting_board_x + (((cutting_board_width - _item_scale_board)  / 4) * (_i_ingr % 4));
			_item_x_board = _i_ingr < 4 ? _item_x_board + _item_scale_board / 2 : _item_x_board;
			var _item_y_board = floor(_i_ingr / 4) < 1 ? cutting_board_y + (cutting_board_height * 0.4) : cutting_board_y + cutting_board_height * 0.9;
			_item_y_board -= _item_scale_board;
		
			draw_sprite_stretched(inv_items, _this_item, _item_x_board, _item_y_board, _item_scale_board, _item_scale_board);
		}
	}
}

// Draw held item
if(held_item != -1)
{
	
	if(held_item < inv_slots) { _this_item = global.ds_inventory[# 0, held_item]; }
	else { _this_item = ds_ingredients[# 0, held_item_ingredient]; }
	
	_item_x = mousex - ((cell_size / 2)  *scale);
	_item_y = mousey - ((cell_size / 2) * scale);
	
	draw_sprite_stretched(inv_items, _this_item, _item_x, _item_y, sprite_size, sprite_size);
}

// ---------- Draw item info
var _item_none = false;
if(selected_slot < inv_slots && selected_slot >= 0) 
{ 
	if(global.ds_inventory[# 0, selected_slot] == 0) { _item_none = true; }
	else { _item_none = false; }
}
if(selected_slot >= inv_slots)
{ 
	if(ds_ingredients[# 0, selected_slot - inv_slots] == 0) { _item_none = true; }
	else { _item_none = false; }
}

if((selected_slot != -1 && !_item_none) || held_item != -1)
{
	draw_sprite(info_textbox,0,info_textbox_x,info_textbox_y);
	var _i_this_item = 0;
	
	if(held_item == -1)		_i_this_item = selected_slot < inv_slots ? global.ds_inventory[# 0, selected_slot] : ds_ingredients[# 0, selected_slot - inv_slots];
	else					_i_this_item = held_item < inv_slots ? global.ds_inventory[# 0, held_item] : ds_ingredients[# 0, held_item - inv_slots];
	
	var _i_this_item_info = scr_get_item_description(_i_this_item, true);
	var _i_this_item_info_name = string_split(_i_this_item_info, "\n")[0];

	draw_set_font(info_textbox_font);
	var _c = c_white;
	
	var _item_info_y = item_info_y + (info_textbox_height - string_height_ext(_i_this_item_info, 26, item_info_width)) / 2;
	draw_text_ext_color(item_info_x, item_info_y, _i_this_item_info, 26, item_info_width, _c,_c,_c,_c,1);
	draw_text_ext_color(item_info_x, item_info_y, _i_this_item_info_name, 26, item_info_width, _c,_c,_c,_c,1);
}

// Draw cooking button
if(can_cook) 
{
	draw_sprite_ext(cook_button, cook_button_active, cook_button_x, cook_button_y, 1, 1, 0, c_white, 1);
}
else
{
	draw_sprite_ext(cook_button, 0, cook_button_x, cook_button_y, 1, 1, 0, c_white, 0.6);
}

draw_set_alpha(1);