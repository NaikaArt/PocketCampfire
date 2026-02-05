/// @description Draw the inventory

if(on_screen)
{
	// Draw the background
	draw_set_color(background_col);
	draw_set_alpha(background_opacity);
	
	draw_rectangle(0, 0, global.game_width, global.game_height, 0);
	draw_sprite(title, 0, 0, 0);
	
	draw_set_alpha(1);
	draw_set_color(c_white);

	draw_sprite(background_pane, 0, scr_lerp_smooth(background_pane_x, background_pane_x_target, background_pane_lerp, "in"), 0);
}

if(!active) { exit; }

draw_set_alpha(background_opacity);

// ---------- Draw bin

draw_sprite_ext(bin, (bin_selected && held_item != -1), bin_x, bin_y, scale, scale, 0, c_white, 1);

// ---------- Draw buttons
var _save_alpha = save_exists ? 1 : 0.4;
draw_sprite_ext(inv_button, 0 + 4 * (selected_button==0), save_button_x, save_button_y, scale, scale, 0, c_white, 1);
draw_sprite_ext(inv_button, 1 + 4 * (selected_button==1), load_button_x, load_button_y, scale, scale, 0, c_white, _save_alpha);
draw_sprite_ext(inv_button, 2 + 4 * (selected_button==2), settings_button_x, settings_button_y, scale, scale, 0, c_white, 1);
draw_sprite_ext(inv_button, 3 + 4 * (selected_button==3), exit_button_x, exit_button_y, scale, scale, 0, c_white, 1);

// ---------- Draw items

var _slot_x = 0, _slot_y = 0, _item_x, _item_y, _this_item, _item_sprite_x, _item_sprite_y;

for(var _i = 0; _i < inv_slots; _i++)
{
	_slot_x = _i mod inv_slots_width;
	_slot_y = _i div inv_slots_width;
	
	_item_x = inv_x + ((cell_size + slot_spacing_x) * _slot_x * scale);
	_item_y = inv_y + ((cell_size + slot_spacing_y) * _slot_y * scale);
	
	_this_item = global.ds_inventory[# 0, _i];
	
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
	
	// Draw item amount
	draw_set_font(fnt_default_large);
	var _c = c_white;	
	if(_this_item > 0 && _i != held_item)
	{
		var _number = global.ds_inventory[# 1, _i];
		var _text = "x" + string(_number);
		var _str_width = string_width(_text) - 10;
		var _str_height = string_height(_text);
		var _xx = _item_x + cell_size - _str_width - amount_text_padding_x;
		var _yy = _item_y + cell_size - _str_height - amount_text_padding_y;
		scr_draw_outlined_text(_xx, _yy, _text, _c, c_black, 1);
	}
}

// Draw held item
if(held_item != -1)
{
	_this_item = global.ds_inventory[# 0, held_item];
	_item_x = mousex - ((cell_size / 2)  *scale);
	_item_y = mousey - ((cell_size / 2) * scale);
	
	draw_sprite_stretched(inv_items, _this_item, _item_x, _item_y, sprite_size, sprite_size);
}

// Draw item info

if((selected_slot != -1 && global.ds_inventory[# 0, selected_slot] != 0) || held_item != -1)
{
	draw_sprite(info_textbox,0,inv_x,525);
	var _i_this_item;
	
	if(held_item == -1)
	{
		_i_this_item = global.ds_inventory[# 0, selected_slot];
	}
	else
	{
		_i_this_item = global.ds_inventory[# 0, held_item];
	}
	
	var _i_this_item_info = scr_get_item_description(_i_this_item, false);
	var _i_this_item_info_name = string_split(_i_this_item_info, "\n")[0];

	draw_set_font(info_textbox_font);
	var _c = c_white;
	var _item_info_y = item_info_y + (info_textbox_height - string_height_ext(_i_this_item_info, 26, item_info_width)) / 2;
	draw_text_ext_color(item_info_x, item_info_y, _i_this_item_info, 26, item_info_width, _c,_c,_c,_c,1);
	draw_text_ext_color(item_info_x, item_info_y, _i_this_item_info_name, 26, item_info_width, _c,_c,_c,_c,1);
}

draw_set_alpha(1);