/// Create Event

state = TEXTBOX_STATE.WRITING;
keyboard_input = vk_space;
first_frame = true;
text_speed = 1;

prompt = "   ";
action = scr_empty;
name = "";

// Text Box
box = spr_textbox_default;  // Anchor is Bottom Center
box_width = sprite_get_width(box);
box_height = sprite_get_height(box);
box_margin = 15;
box_x = global.game_width / 2;
box_y = global.game_height - box_margin;
box_padding_x = 60;
box_padding_y = 26;

text_font = fnt_default; draw_set_font(text_font);
text_height_adjustment = 16;
text_charheight = string_height("M");
text_separation = 44;
text_x = box_x - (box_width / 2) + box_padding_x;
text_y = box_y - box_height + box_padding_y - text_height_adjustment;
text_max_width = box_width - (2 * box_padding_x);

// Choice Box
choicebox_option_count = 2;
choicebox_option = spr_choicebox_option;  // Anchor is Bottom Right
choicebox_option_width = sprite_get_width(choicebox_option);
choicebox_option_height = sprite_get_height(choicebox_option);
choicebox_option_spacing = 5;

choicebox = spr_choicebox_default;  // Anchor is Bottom Right, is Nine Sprite
choicebox_padding = 20;
choicebox_margin = 0;
choicebox_width = choicebox_option_width + choicebox_padding * 2;
choicebox_height = choicebox_option_count * (choicebox_option_height) + ((choicebox_option_count - 1) * choicebox_option_spacing) + choicebox_padding * 2;
choicebox_x = box_x + (box_width / 2);
choicebox_y = box_y - box_height - choicebox_margin;

choicebox_option_x = choicebox_x - choicebox_padding;
choicebox_option_y = choicebox_y - choicebox_padding;

page = 0;
target_page = -1;
text[0,0] = ""; text[0,1] = -1;
text_parsed = "";
text_index = 0; 
str_length = 0;

// Start The Textbox
event_perform(ev_other, ev_user0);
alarm[1] = 1;