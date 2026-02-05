/// @desc Save the game
function scr_load_game()
{
	if(global.saveload_disabled)
	{
		instance_create_depth(0, 0, 0, obj_saveload_warning);
		return;
	}
	
	if(global.game_state == GAME_STATE.LOCKED) { scr_reset_gamestate(); }

	var _success = scr_load_game_data();
	if(_success) scr_fade_scene(rm_camp);
}