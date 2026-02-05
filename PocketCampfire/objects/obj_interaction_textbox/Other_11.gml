/// @description Writing Finished & Choices Setup

if(page < array_length(text) - 1)
{
	var _next_line = text[page + 1, 0];
	
	if(is_array(_next_line))	// Checks if the next line is a choice
	{
		var _options_array;	
		var _option_data;
		choicebox_option_count = 0;
		
		// Go over each option and check if it meets the Affection requirement, then add it
		for(var _i = 0; _i < array_length(text[page + 1]); _i++)
		{
			_option_data = text[page + 1, _i];
		
			if(global.active_mon[? "affection"] < _option_data[1])
			{ continue; }
			
			_options_array[choicebox_option_count] = _option_data;
			choicebox_option_count++;
		}
		
		// Adjust the choicebox height
		choicebox_height = choicebox_padding * 2 + choicebox_option_count * (choicebox_option_height) + choicebox_option_spacing * (choicebox_option_count - 1);
		
		// Create the Choice Box objects
		scr_generate_options(_options_array, id, choicebox_option_x, choicebox_option_y, choicebox_option_height + choicebox_option_spacing);
		
		state = TEXTBOX_STATE.CHOICE;
	}
	else state = TEXTBOX_STATE.DONE;
}

// If we're at the last page, we're done
if(page == array_length(text) - 1)
{
	state = TEXTBOX_STATE.DONE;
}