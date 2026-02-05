/// @description Generate & Parse Text

// We can denote an Option Box Prompt like in Line 1, format for this is as follows:
// [Text, Affection Requirement, Arousal Requirement, Arousal Cost, Target page, Functions]
// Now the format is [x,y], where y is the a Choice Entry (follows the format above).

text[0,0] = prompt; text[0,1] = -1;
text[1,0] = ["Yes", -2, "Action"]; text[1,1] = ["No", -2, scr_reset_gamestate];


// Get the current text and parse it
var _line = text[page, 0];
if(is_array(_line)) _line = text[page - 1, 0];		// If _line is an array, it's an option. Keep the last dialogue instead.

text_parsed = scr_string_parse(_line, 0, text_max_width);
str_length = string_length(text_parsed);