/// @description Create tall grass objects

var _z = 2;
var _x_increment = (960 - (2 * tall_grass_padding)) / 3;
var _side = 1;

for(var _i = 0; _i < 12; _i++)
{
	if(_i % 4 == 0 && _i != 0) { _z--; }
	if(_i % 4 < 2) { _side = -1; }
	
	var _obj = instance_create_layer(0, 0, "UI", obj_encounter_tallgrass);
	_obj.z = _z;
	_obj.pos_x = tall_grass_padding + ((_i % 4) * _x_increment);
	_obj.pos_x += (_z / 10) * _x_increment * _side;
}