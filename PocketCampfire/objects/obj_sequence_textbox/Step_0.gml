/// @description Insert description here

if(text_index < str_length) 
{ 
	if(state == TEXTBOX_STATE.WRITING) text_index += global.text_speed;
}
else 
{
	if(state == TEXTBOX_STATE.WRITING) 
	{ 
		alarm[0] = linger_duration * global.game_speed;
		state = TEXTBOX_STATE.DONE; 
	}
}