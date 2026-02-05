/// @description Go to next page

// Next page logic
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
	
text_index = 0;
audio_play_sound(snd_click_1, 100, false);
event_perform(ev_other, ev_user0);
alarm_set(0, 1);