function scr_create_sequence_textbox(_prompt_type, _duration)
{
	var _textbox = instance_create_layer(0, 0, "UI", obj_sequence_textbox);
	with(_textbox)
	{
		prompt_type = _prompt_type;
		linger_duration = _duration;
		event_user(0);
	}
	
	return _textbox;
}