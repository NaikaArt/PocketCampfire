// function scr_get_mon_sprite(species, gender)
function scr_get_mon_sprite(argument0, argument1)
{
	switch(argument0)
	{
		case SPECIES.NICKIT:
			return argument1 == GENDERS.M ? spr_nickit_m_interaction : spr_nickit_f_interaction;
		case SPECIES.VULPIX:
			return argument1 == GENDERS.M ? spr_vulpix_m_interaction : spr_vulpix_f_interaction;
		case SPECIES.ALOLANVULPIX:
			return argument1 == GENDERS.M ? spr_alolanvulpix_m_interaction : spr_alolanvulpix_f_interaction;
		case SPECIES.LUCARIO:
			return argument1 == GENDERS.M ? spr_lucario_m_interaction : spr_lucario_f_interaction;
		case SPECIES.CINDERACE:
			return argument1 == GENDERS.M ? spr_cinderace_m_interaction : spr_cinderace_f_interaction;
		case SPECIES.BRAIXEN:
			return argument1 == GENDERS.M ? spr_braixen_m_interaction : spr_braixen_f_interaction;
		case SPECIES.ZOROARK:
			return argument1 == GENDERS.M ? spr_zoroark_m_interaction : spr_zoroark_f_interaction;
		default:
			return noone;
	}
}