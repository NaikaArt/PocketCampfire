function scr_pet() 
{
	if(!global.prompt_fail)
	{
		scr_set_sprite(SPRITE_PROMPTS.HAPPY);
		with(obj_interaction_textbox) scr_play_mon_cry(mon_species, MON_CRIES.HAPPY);
		
		scr_modify_stat(global.active_mon, "affection", 5, "add", AFFECTION_LEVEL.MEDIUM);
		scr_modify_stat(global.active_mon, "arousal", 15, "subtract", noone);
	}
	else
	{
		scr_set_sprite(SPRITE_PROMPTS.UPSET);
		with(obj_interaction_textbox) scr_play_mon_cry(mon_species, MON_CRIES.SAD);
		
		scr_modify_stat(global.active_mon, "arousal", 10, "subtract", noone);
	}
}