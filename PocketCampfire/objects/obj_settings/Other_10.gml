/// @description Save data and quit settings

global.text_speed = round(lerp(1, 4, slider_pos[3]));
global.game_state = global.prev_game_state;

scr_save_settings();

instance_destroy();