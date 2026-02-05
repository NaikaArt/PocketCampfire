function scr_get_species_name(argument0)
{
	switch(argument0)
	{
		case SPECIES.NICKIT:
			return "Nickit";
		case SPECIES.VULPIX:
			return "Vulpix";
		case SPECIES.ALOLANVULPIX:
			return "Alolan Vulpix";
		case SPECIES.LUCARIO:
			return "Lucario";
		case SPECIES.CINDERACE:
			return "Cinderace";
		case SPECIES.BRAIXEN:
			return "Braixen";
		case SPECIES.ZOROARK:
			return "Zoroark";
		default:
			return "";
	}
}