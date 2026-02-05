/// @description Set depth

// State Variables
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
scale = 0.75;

mousex = 0;
mousey = 0;
active = false;
is_toggling = false;
on_screen = false;
cook_button_active = false;
can_cook = false;

// Sprite Variables
inv_items = spr_inventory_items;
grid_slot = spr_grid_slot;
background_pane = spr_background_pane;
info_textbox = spr_cooking_textbox;
cutting_board = spr_cutting_board;
cook_button = spr_cook_button;
title = spr_cookmenu_title;

// Item Slots
inv_slots = 24;
inv_slots_width = 4;
inv_slots_height = 6;

slot_spacing_x = 10;
slot_spacing_y = 10;
sprite_padding = 10;
amount_text_padding_x = 10;
amount_text_padding_y = 0;
cell_size = 96;
sprite_size = cell_size - sprite_padding * 2;
sprite_size *= scale;

ingr_slots = 8;
ingr_slots_width = 4;
ingr_slots_height = 2;

inventory_ingredients_gap = 100;
inv_width = (inv_slots_width + ingr_slots_width) * (cell_size * scale) + (inv_slots_width + ingr_slots_width - 2) * slot_spacing_x + inventory_ingredients_gap;
inv_height = inv_slots_height * ((cell_size * scale) + slot_spacing_y) - slot_spacing_y;
inv_x = (gui_width / 2) - (inv_width / 2);
inv_y = 30;

background_pane_width = sprite_get_width(background_pane);
background_pane_x = -global.game_width;
background_pane_x_target = 100;
inv_items_columns = sprite_get_width(inv_items) / cell_size;
inv_items_rows = sprite_get_height(inv_items) / cell_size;

slot_grid_size = inv_slots + ingr_slots + 1;

slot_offset_x = ingr_slots_width * ((cell_size * scale) + slot_spacing_y) - slot_spacing_y + inventory_ingredients_gap;
slot_offset_y = 0;
ingr_slot_offset_x = 0;
ingr_slot_offset_y = 120;
main_ingr_slot_offset_x = 120;
main_ingr_slot_offset_y = 30;

selected_slot = -1;
last_slot = -1;
selected_slot_ingredient = 0;
held_item = -1;
held_item_ingredient = 0;
held_item_time = 0;
held_item_click_timeframe = 0.2;
selected_button = -1;

mouse_slot_x = 0;
mouse_slot_y = 0;

// Cutting Board
cutting_board_width = sprite_get_width(cutting_board);
cutting_board_height = sprite_get_height(cutting_board);
cutting_board_x = inv_x + main_ingr_slot_offset_x + (0.5 * cell_size * scale) - cutting_board_width / 2 - 20;
cutting_board_y = inv_y + inv_height - cutting_board_height + 10;

// Info Textbox
info_textbox_font = fnt_default_tiny;
info_textbox_width = sprite_get_width(info_textbox);
info_textbox_height = sprite_get_height(info_textbox);
info_textbox_x = inv_x + slot_offset_x;
info_textbox_y = 525;
item_info_margin_x = 25;
item_info_x = info_textbox_x + item_info_margin_x;
item_info_y = 525;
info_textbox_y = 525;
item_info_width = info_textbox_width - 2 * item_info_margin_x;

// Cook Button
cook_button_active_last = -1;
cook_button_width = sprite_get_width(cook_button);
cook_button_height = sprite_get_height(cook_button);
cook_button_x = inv_x + main_ingr_slot_offset_x + (0.5 * cell_size * scale) - cook_button_width / 2;
cook_button_y = 525 + info_textbox_height / 2 - cook_button_height / 2;


// Animation
animation_direction = 1;
background_opacity = 0;
background_pane_lerp = 0;
background_col = $fbe9e9;


// Ingredients
ds_ingredients = ds_grid_create(3, ingr_slots + 1);
mons = global.ds_mon;
mon_count = ds_list_size(global.ds_mon);

for(var _i = 0; _i < ingr_slots + 1; _i++)
{
	item_id = ITEM.NONE;
	ds_ingredients[# 0, _i] = item_id;
	ds_ingredients[# 1, _i] = irandom_range(1, 10);
	ds_ingredients[# 2, _i] = scr_get_item_description(item_id, true);
}

draw_set_alpha(1);