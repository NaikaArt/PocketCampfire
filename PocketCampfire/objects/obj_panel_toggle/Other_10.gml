/// @description Toggle

switch(global.game_state)
{
	case GAME_STATE.CAMP:
	case GAME_STATE.INVENTORY:
	case GAME_STATE.COOKING:
		if(inventory) 
		{
			with(obj_inventory) event_user(0);
			with(obj_cooking_menu) if(active) event_user(0);
		}
		else 
		{
			with(obj_cooking_menu) event_user(0);
			with(obj_inventory) if(active) event_user(0);
		}
		
		audio_play_sound(snd_click_2, 50, false);
	break;
}