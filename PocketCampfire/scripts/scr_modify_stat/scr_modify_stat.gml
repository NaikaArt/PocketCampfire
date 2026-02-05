///scr_modify_stat(mon, "stat", value, "operator", affection_level_cap)
function scr_modify_stat(argument0, argument1, argument2, argument3, argument4) 
{	
	var _mon = argument0;
	var _stat = argument1;
	var _value = argument2;
	var _operator = argument3;
	var _affection_level_cap = argument4;
	var _current_affection_level = scr_get_affection_level(_mon[? "affection"]);
	var _affection_cap = _affection_level_cap >= 0 && _stat == "affection" && _current_affection_level != AFFECTION_LEVEL.MAX;
	
	if(_affection_cap)
	{
		var _next_cap = clamp(_current_affection_level + 1, 0, AFFECTION_LEVEL.MAX);
		_affection_level_cap = max(_next_cap, _affection_level_cap);
	}

	switch(_operator)
	{
		case "add":
			_mon[? _stat] += _value;
		break;
		case "subtract":
			_mon[? _stat] -= _value;
		break;
		case "0+":
			_mon[? _stat] = 0 + _value;
		break;
		case "100-":
			_mon[? _stat] = 100 - _value;
		break;
	}
	
	if(_affection_cap)
	{
		var _affection_cap_value = scr_get_affection_level_value(_affection_level_cap) - 1;
		_mon[? _stat] = clamp(_mon[? _stat], 0, _affection_cap_value);
	}
	
	_mon[? _stat] = clamp(_mon[? _stat], 0, 100);
}