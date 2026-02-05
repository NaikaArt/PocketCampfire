/// @description Writing finished & choices

if(page < array_length(text) - 1)
{
	var _next_line = text[page + 1, 0];
	
	if(is_array(_next_line))	// Checks if the next line is a choice
	{	
		var _options_array;	
		var _option_data;
		choicebox_option_count = 0;
		
		// Go over each option and add it to the list
		for(var _i = 0; _i < array_length(text[page + 1]); _i++)
		{
			_option_data = text[page + 1, _i];
			
			if(_option_data[2] == "Action") _option_data[2] = action;
			
			_options_array[choicebox_option_count] = _option_data;
			choicebox_option_count++;
		}
		
		// Create the Choice Box objects
		scr_generate_options_confirm(_options_array, id, choicebox_option_x, choicebox_option_y, choicebox_option_height + choicebox_option_spacing);
		
		state = TEXTBOX_STATE.CHOICE;
		
	}
	else state = TEXTBOX_STATE.DONE;
}

// If we're at the last page, we're done
if(page == array_length(text) - 1)
{
	state = TEXTBOX_STATE.DONE;
}