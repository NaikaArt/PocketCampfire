function scr_generate_options_confirm(_options, _textbox_id, _x, _y, _spacing)
{
	var _option_count = array_length(_options);
	var _option_data;

	for(var _j = 0; _j < _option_count; _j++)
	{	
		_option_data = _options[_j];
		var _y_current = _y - _spacing * ((_option_count - 1) - _j);
	
		var _option = instance_create_layer(_x, _y_current, "Global", obj_choicebox_option);
	
		_option.text = _option_data[0];
		_option.option_id = _j;
		_option.target_page = _option_data[1];
		if(array_length(_option_data) == 3) _option.func = _option_data[2];
	
		_option.textbox = _textbox_id;
	}
}