/// @description Insert description here

if(!selected) { exit; }

audio_play_sound(snd_click_1, 100, false)

with(textbox)
{
	if(other.target_page != -2)
	{
		target_page = other.target_page;
		event_perform(ev_other, ev_user2);
	}
	else instance_destroy();
}

// Perform attached functions and destroy all choice boxes
event_perform(ev_other, ev_user0);
instance_destroy(obj_choicebox_option);