///@description scr_create_confirmation("Text", scr_target)
function scr_create_confirmation() 
{
	var _text = argument[0];
	var _target = argument[1];
	

	global.prev_game_state = global.game_state;
	global.game_state = GAME_STATE.LOCKED;

	var _confirmation_box = instance_create_layer(0, 0, "Global", obj_confirmation_textbox);
	_confirmation_box.prompt = _text;
	_confirmation_box.action = _target;
}