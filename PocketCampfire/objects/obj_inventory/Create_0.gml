/// @description Set depth

// State Variables
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
scale = 1;

mousex = 0;
mousey = 0;
active = false;
is_toggling = false;
on_screen = false;

// Sprite Variables
grid_slot = spr_grid_slot;
background_pane = spr_background_pane;
inv_items = spr_inventory_items;
info_textbox = spr_inventory_textbox;
title = spr_inventory_title;

// Item Slots
inv_slots = global.inventory_slots;
inv_slots_width = 6;
inv_slots_height = 4;

slot_spacing_x = 10;
slot_spacing_y = 10;
sprite_padding = 10;
amount_text_padding_x = 15;
amount_text_padding_y = 0;
cell_size = 96;
sprite_size = cell_size - sprite_padding * 2;
sprite_size *= scale;

inv_width = inv_slots_width * (cell_size + slot_spacing_x) - slot_spacing_x;
inv_height = inv_slots_height * (cell_size + slot_spacing_y) - slot_spacing_y;
inv_x = (gui_width / 2) - (inv_width / 2 * scale);
inv_y = 62;

background_pane_width = sprite_get_width(background_pane);
background_pane_x = global.game_width;
background_pane_x_target = global.game_width / 2 - background_pane_width / 2;
inv_items_columns = sprite_get_width(inv_items) / cell_size;
inv_items_rows = sprite_get_height(inv_items) / cell_size;

slot_offset_x = inv_x + 9 * scale;
slot_offset_y = inv_y + 9 * scale;

selected_slot = -1;
last_slot = -1;
held_item = -1;
selected_button = -1;

mouse_slot_x = 0;
mouse_slot_y = 0;

// Info Textbox
info_textbox_font = fnt_default_small;
info_textbox_width = sprite_get_width(info_textbox);
info_textbox_height = sprite_get_height(info_textbox);
item_info_margin_x = 40;
item_info_x = inv_x + item_info_margin_x;
item_info_y = 522;
item_info_width = inv_width * scale - (item_info_x - inv_x);

// Option Buttons
save_exists = file_exists("savefile.sav");
inv_button = spr_inventory_buttons;
inv_button_size = sprite_get_width(inv_button);
selected_button = -1;
last_button = -1;

save_button_x = inv_x + (inv_width * scale) + 20;
save_button_y = inv_y;
load_button_x = save_button_x;
load_button_y = save_button_y + (inv_button_size * scale) + 10;
settings_button_x = save_button_x;
settings_button_y = load_button_y + (inv_button_size * scale) + 10;
exit_button_x = save_button_x;
exit_button_y = settings_button_y + (inv_button_size * scale) + 10;

// Trash Bin
bin_selected = false;
bin_last_selected = false;
bin = spr_inventory_bin;
bin_width = sprite_get_width(bin);
bin_height = sprite_get_height(bin);
bin_x = inv_x + inv_width * scale - 10;
bin_y = inv_y + inv_height * scale - bin_height * scale;

// Animation
animation_direction = 1;
background_opacity = 0;
background_pane_lerp = 0;
background_col = $fbe9e9;