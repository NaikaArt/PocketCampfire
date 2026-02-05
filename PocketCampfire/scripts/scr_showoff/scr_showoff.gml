function scr_showoff() 
{
	if(!global.prompt_fail)
	{
		scr_set_sprite(SPRITE_PROMPTS.SHOWOFF);
		with(obj_interaction_textbox) scr_play_mon_cry(mon_species, MON_CRIES.AROUSED);
	
		scr_modify_stat(global.active_mon, "affection", 10, "add", AFFECTION_LEVEL.HIGH);
		scr_modify_stat(global.active_mon, "arousal", 40, "subtract", noone);
	}
	else
	{
		scr_set_sprite(SPRITE_PROMPTS.UPSET);
		with(obj_interaction_textbox) scr_play_mon_cry(mon_species, MON_CRIES.SAD);
		
		scr_modify_stat(global.active_mon, "arousal", 20, "subtract", noone);
	}
}