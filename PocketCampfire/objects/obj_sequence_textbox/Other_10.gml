/// @description Get Text Prompt & Start

if(!is_string(prompt_type))
	text = scr_generate_text_prompt(prompt_type, name);
else
	text = prompt_type;
str_length = string_length(text);
text_index = 0; 

state = TEXTBOX_STATE.WRITING;