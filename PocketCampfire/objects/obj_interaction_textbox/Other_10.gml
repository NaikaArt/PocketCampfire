/// @description Generate & Parse Text

if(page == -1) { return; }	// If we don't have a valid page, skip

// Get the current text and parse it
var _line = text[page, 0];

if(string_starts_with(_line, "FAIL "))
{
	_line = string_replace(_line, "FAIL ", "");
	global.prompt_fail = true;
}
else global.prompt_fail = false;
	
line_count = 1 + string_count("|", _line);

if(is_array(_line)) _line = text[page - 1, 0];		// If _line is an array, it's an option. Keep the last dialogue instead.

if(page == low_arousal_page) { scr_upset(); }	// Sprite emotion override when low on energy

text_parsed = scr_string_parse(_line, line_index, text_max_width);
str_length = string_length(text_parsed);