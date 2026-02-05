/// @description 

if(global.game_state != GAME_STATE.CAMP) return;

if(mouse_x >= burried_item_x - burried_item_w / 2 && mouse_x < burried_item_x + burried_item_w / 2 && mouse_y >= burried_item_y - burried_item_h / 2 && mouse_y < burried_item_y + burried_item_h / 2)
{
	dug_up = true;
	depth = 0;
	alarm[0] = delete_timer * global.game_speed;
	
	audio_play_sound(snd_dig, 50, false);
	scr_create_item(item_type, 1);
}