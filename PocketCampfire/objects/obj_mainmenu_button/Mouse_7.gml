/// @description Insert description here
// You can write your code in this editor
if(!selected || !is_active || locked) { return; }

switch(button_id)
{
	case 0:
		scr_fade_scene(rm_tutorial, 0.25, 0.1);
		audio_play_sound(snd_click_1, 100, false);
		global.game_state = GAME_STATE.LOCKED;
	break;
	case 1:
		scr_new_game();
		scr_set_music(undefined, 500);
		audio_play_sound(snd_click_1, 100, false);
		global.game_state = GAME_STATE.LOCKED;
	break;
	case 2:
		scr_load_game();
		if(!global.saveload_disabled)
		{
			scr_set_music(undefined, 500);
			audio_play_sound(snd_click_1, 100, false);
		}
	break;
	case 3:
		scr_open_settings();
		audio_play_sound(snd_click_2, 100, false);
		global.game_state = GAME_STATE.LOCKED;
	break;
}