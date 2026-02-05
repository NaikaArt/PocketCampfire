function scr_get_affection_level()
{
	enum AFFECTION_LEVEL
	{
		NEW,
		LOW,
		MEDIUM,
		HIGH,
		MAX
	}
	
	var _affection = argument_count > 0 ? argument[0] : global.active_mon[? "affection"];
	var _affection_level = AFFECTION_LEVEL.NEW;
	
	if(_affection >= 20 && _affection < 45) _affection_level = AFFECTION_LEVEL.LOW;
	else if(_affection >= 45 && _affection < 80) _affection_level = AFFECTION_LEVEL.MEDIUM;
	else if(_affection >= 80 && _affection < 100) _affection_level = AFFECTION_LEVEL.HIGH;
	else if(_affection == 100) _affection_level = AFFECTION_LEVEL.MAX;
	
	return _affection_level;
}