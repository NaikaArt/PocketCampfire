/// @description Input Handling

if(keyboard_check_pressed(keyboard_input) || mouse_check_button_pressed(mb_left))
{
	switch(state)
	{
		case TEXTBOX_STATE.WRITING:
			if(!first_frame) { text_index = str_length; } 	// Instantly skip to the end of the line
			break;
		case TEXTBOX_STATE.DONE:
			event_perform(ev_other, ev_user2);
			break;
		case TEXTBOX_STATE.CHOICE:
			
			break;
	}
}

if(first_frame) { first_frame = false; }

// Text State Updating
if(text_index < str_length) { text_index += global.text_speed; }	// Keep adding characters
else if(state == TEXTBOX_STATE.WRITING) { event_perform(ev_other, ev_user1); }	// Reached end of the line