/// @description 

held_slider = -1;
mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);
mouse_held = false;

background = spr_settingsmenu_pane;
width = sprite_get_width(background);
height = sprite_get_height(background);
pos_x = global.game_width / 2 - width / 2;
pos_y = global.game_height / 2 - height / 2;

item_count = 4;
font = fnt_default;
text_y_adjustment = -8;
draw_set_font(font);
item_height = string_height("M");

padding_x = 30;
padding_x_bar = 200;
padding_y_top = 76;
padding_y_bot = 25;

item_spacing = floor((height - padding_y_top - padding_x) / (item_count - 1) - item_height);
item_spacing = 40;

handle = spr_settingsmenu_handle;
handle_width = sprite_get_width(handle);
handle_height = sprite_get_height(handle);
slider_x_min = pos_x + padding_x_bar;
slider_x_max = pos_x + width - padding_x;

slider_pos[0] = obj_sound_manager.music_volume;
slider_pos[1] = obj_sound_manager.sfx_volume;
slider_pos[2] = obj_sound_manager.voice_volume;
slider_pos[3] = (global.text_speed - 1) / (4 - 1);

done_sprite = spr_settingsmenu_done;
done_active = false;
done_width = sprite_get_width(done_sprite);
done_height = sprite_get_height(done_sprite);
done_x = pos_x + width / 2;
done_y = pos_y + height - padding_y_bot - done_height / 2;
done_y += 5; // Minor adjustment

preview_sounds = [snd_button_hover, snd_click_1, snd_click_2, snd_click_3, snd_slide_woosh, snd_item_get, snd_whistle_1, snd_whistle_2, snd_zipper_close, snd_zipper_open];
preview_sound_count = array_length(preview_sounds);

preview_voices = audio_group_get_assets(ag_voice);
preview_voice_count = array_length(preview_voices);