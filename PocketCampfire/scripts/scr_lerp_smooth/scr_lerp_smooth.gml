/// @desc scr_lerp_smooth(a, b, x, "mode")
function scr_lerp_smooth(argument0, argument1, argument2, argument3) {

	var _a = argument0;
	var _b = argument1;
	var _x = argument2;
	var _mode = argument3;

	var _smooth_x = 0;

	switch(_mode)
	{
		case "in":
			_x = _x * (0.5 * pi);
			_smooth_x = cos(_x - (0.5 * pi));
		break;
		case "out":
			_x = _x * (0.5 * pi);
			_smooth_x = sin(_x);
		break;
		case "in out":
			_x = _x * pi;
			_smooth_x = 0.5 * sin(_x - (0.5 * pi)) + 0.5;
		break;
	}

	return lerp(_a, _b, _smooth_x);


}
