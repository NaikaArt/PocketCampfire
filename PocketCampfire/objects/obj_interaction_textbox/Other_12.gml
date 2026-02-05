/// @description Go To Next Page

// Next page logic
if(line_index >= line_count - 1)
{
	if(page != -1)
	{
		if(target_page == -1)
		{
			if(text[page, 1] != -1)
			{
				page = text[page, 1];
			}
			else
			{
				page++;
			}
		}
		else
		{
			page = target_page;
			target_page = -1;
		}
	}
	else page++;
	
	// Update relevant text prompts and text array
	switch(page)
	{
		case 2:
			prompt_chat = scr_generate_text_prompt(TEXT_PROMPT_TYPE.CHAT, mon_name);
			event_user(3); break;
		case 3:
			prompt_examine = scr_generate_text_prompt(TEXT_PROMPT_TYPE.EXAMINE, mon_name);
			event_user(3); break;
		case 6:
			prompt_pet = scr_generate_text_prompt(TEXT_PROMPT_TYPE.PET, mon_name);
			event_user(3); break;
		case 7:
			prompt_showoff = scr_generate_text_prompt(TEXT_PROMPT_TYPE.SHOW_OFF, mon_name);
			event_user(3); break;
		case 8:
			prompt_intimate = scr_generate_text_prompt(TEXT_PROMPT_TYPE.GET_INTIMATE, mon_name);
			event_user(3); break;
	}
	
	line_index = 0;
	prompt_intimate = "";
	scr_set_sprite(SPRITE_PROMPTS.NEUTRAL);
}
else
{
	line_index++;
	if(page == intimate_page && line_index == 2) // Intimate 3rd page effects
	{
		scr_set_sprite(SPRITE_PROMPTS.INTIMATE_CUM);
		scr_play_mon_cry(mon_species, MON_CRIES.SAD);
	}
}

// Start writing the new page
text_index = 0;
audio_play_sound(snd_click_1, 100, false);
event_perform(ev_other, ev_user0);
alarm_set(0, 1);