function scr_open_settings() {
	global.prev_game_state = global.game_state;
	global.game_state = GAME_STATE.LOCKED;

	if(instance_number(obj_settings) == 0)
	{
		var _obj = instance_create_layer(0, 0, "Global", obj_settings);
	}
}