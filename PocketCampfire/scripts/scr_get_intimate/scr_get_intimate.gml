function scr_get_intimate() 
{
	if(!global.prompt_fail)
	{
		scr_set_sprite(SPRITE_PROMPTS.INTIMATE);
		with(obj_interaction_textbox) scr_play_mon_cry(mon_species, MON_CRIES.AROUSED);
	
		scr_modify_stat(global.active_mon, "affection", 20, "add", AFFECTION_LEVEL.MAX);
		scr_modify_stat(global.active_mon, "arousal", 60, "subtract", noone);
	}
	else
	{
		scr_set_sprite(SPRITE_PROMPTS.UPSET);
		with(obj_interaction_textbox) scr_play_mon_cry(mon_species, MON_CRIES.SAD);
		
		scr_modify_stat(global.active_mon, "arousal", 30, "subtract", noone);
	}
}