/// @description scr_fade_scene(room, speed, delay)
function scr_fade_scene() 
{
	var _scene = argument[0];
	var _speed = 0.5;
	var _delay = 0.1;

	if(argument_count > 1)
	{
	    _speed = argument[1];
		_delay = argument[2];
	}

	var _fade_obj = instance_create_depth(0, 0, -10, obj_fade);
	_fade_obj.target = _scene;
	_fade_obj.fade_speed = _speed;
	_fade_obj.delay = _delay;
}