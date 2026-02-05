/// Create Event

state = TEXTBOX_STATE.WRITING;
keyboard_input = vk_space;

text[0, 0] = "";

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

text_3line_font = fnt_default_small; draw_set_font(text_font);
text_3line_height_adjustment = 20;
text_3line_charheight = string_height("M");
text_3line_separation = 30;
text_3line_y = box_y - box_height + box_padding_y - text_3line_height_adjustment;

// Choice Box
choicebox_option_count = 0;
choicebox_option = spr_choicebox_option;  // Anchor is Bottom Right
choicebox_option_width = sprite_get_width(choicebox_option);
choicebox_option_height = sprite_get_height(choicebox_option);
choicebox_option_spacing = 5;

choicebox = spr_choicebox_default;  // Anchor is Bottom Right, is Nine Sprite
choicebox_padding = 20;
choicebox_margin = 0;
choicebox_width = choicebox_option_width + choicebox_padding * 2;
choicebox_height = choicebox_padding * 2;  // Updated in User Event 1 when option count changes
choicebox_x = box_x + (box_width / 2);
choicebox_y = box_y - box_height - choicebox_margin;

choicebox_option_x = choicebox_x - choicebox_padding;
choicebox_option_y = choicebox_y - choicebox_padding;

// Page and String Variables
page = -1;
target_page = -1;
low_arousal_page = 11;
intimate_page = 8;
text_index = 0;
line_count = 1;
line_index = 0;
text_parsed = "";
str_length = 0;

mon_name = global.active_mon[? "name"];
mon_species = global.active_mon[? "species"]
mon_gender = global.active_mon[? "gender"];
gender_text = mon_gender == GENDERS.F ? "♀" : "♂";

prompt_chat = "";
prompt_examine = "";
prompt_pet = "";
prompt_showoff = "";
prompt_intimate = "";

sprite = scr_get_mon_sprite(mon_species, mon_gender)

// Interaction Sprite
global.interaction_sprite_object = instance_create_layer(0, 0, "Sprites", obj_interaction_sprite);
global.interaction_sprite_object.sprite = sprite;


// Setup the text and start the textbox
event_perform(ev_other, ev_user3);
event_perform(ev_other, ev_user2);