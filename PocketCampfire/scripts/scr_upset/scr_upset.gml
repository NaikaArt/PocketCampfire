function scr_upset() 
{
	scr_set_sprite(SPRITE_PROMPTS.UPSET);
	with(obj_interaction_textbox) scr_play_mon_cry(mon_species, MON_CRIES.SAD);
}