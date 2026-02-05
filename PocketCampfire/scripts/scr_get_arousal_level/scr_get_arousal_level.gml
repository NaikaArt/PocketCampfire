function scr_get_arousal_level()
{
	enum AROUSAL_LEVEL
	{
		LOW,
		HIGH
	}
	
	var _arousal = argument_count > 0 ? argument[0] : global.active_mon[? "arousal"];
	var _arousal_level = AROUSAL_LEVEL.LOW;
	
	if(_arousal >= 70) _arousal_level = AROUSAL_LEVEL.HIGH;
	
	return _arousal_level;
}