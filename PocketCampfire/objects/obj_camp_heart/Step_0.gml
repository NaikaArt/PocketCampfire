/// @description 

if(i < 1) { i += (1 / duration) / global.game_speed; }
else instance_destroy();

var _i = lerp(0.3, 1, i);
x = origin_x + sin((_i + offset) * frequency * pi * 2) * (amplitude * i + 0.2);
y = origin_y - i * distance;

image_alpha = 1 - i;
image_xscale = lerp(scale_min, scale_max, i);
image_yscale = lerp(scale_min, scale_max, i);
