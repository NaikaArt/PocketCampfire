/// @description 

catchanim_a = clamp(catchanim_a + ((1 / global.game_speed) * catchanim_speed), 0, 1);
var _catchanim_a = sin(catchanim_a * pi);

var _scale = lerp(1, catchanim_scale_max, _catchanim_a);
image_xscale = _scale;
image_yscale = _scale;

var _offset = lerp(0, catchanim_offset_max, _catchanim_a);
x = x_origin;
y = y_origin + _offset;