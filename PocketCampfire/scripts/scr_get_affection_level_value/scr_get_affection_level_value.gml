function scr_get_affection_level_value()
{
	var _affection_level = argument_count > 0 ? argument[0] : scr_get_affection_level(global.active_mon[? "affection"]);
	
	switch(_affection_level)
	{
		case AFFECTION_LEVEL.NEW:
			return 0;
		case AFFECTION_LEVEL.LOW:
			return 20;
		case AFFECTION_LEVEL.MEDIUM:
			return 45;
		case AFFECTION_LEVEL.HIGH:
			return 80;
		case AFFECTION_LEVEL.MAX:
			return 100;	
	}
}