/// @description Insert description here

switch(global.game_state)
{
	case GAME_STATE.CAMP:
	case GAME_STATE.INVENTORY:
	case GAME_STATE.COOKING:
		image_index = 1;
		audio_play_sound(snd_button_hover, 50, false);
	break;
}