///scr_string_parse(text, line_index, max_width)
function scr_string_parse(argument0, argument1, argument2) {
	// This script inserts \n for text wrapping and replaces '$' with the Pokémon's name.
	
	var _str_lines = string_split(argument0, "|");
	var _line_index = clamp(argument1, 0, array_length(_str_lines));
	var _str = _str_lines[_line_index];
	var _max_width = argument2;

	var _str_length = string_length(_str);
	var _last_space = 1;

	var _substr;

	for(i = 1; i <= _str_length; i++)
	{
		_substr = string_copy(_str, 1, i);
		if(string_char_at(_str, i) == " ") {_last_space = i;}
	
		if(string_char_at(_str, i) == "$") 
		{
			_str = string_delete(_str, i, 1);
			_str = string_insert(mon_name + gender_text, _str, i);
			i += string_length(mon_name + gender_text);
		}
	
		if(string_width(_substr) > _max_width)
		{
			_str = string_delete(_str, _last_space, 1);
			_str = string_insert("\n", _str, _last_space);
		}
	}

	return _str;
}