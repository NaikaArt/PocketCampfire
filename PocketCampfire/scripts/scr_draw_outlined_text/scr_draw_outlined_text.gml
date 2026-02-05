// function scr_draw_outlined_text(text, thickness)
function scr_draw_outlined_text(x, y, _text, _color, _outline_color, _outline_thickness)
{
	var _xx, _yy;  
	_xx = argument[0];  
	_yy = argument[1];
	var _t = argument[5];
  
	//Outline  
	draw_set_color(argument[4]);
	draw_text(_xx+_t, _yy+_t, argument[2]);  
	draw_text(_xx-_t, _yy-_t, argument[2]);  
	draw_text(_xx,   _yy+_t, argument[2]);  
	draw_text(_xx+_t,   _yy, argument[2]);  
	draw_text(_xx,   _yy-_t, argument[2]);  
	draw_text(_xx-_t,   _yy, argument[2]);  
	draw_text(_xx-_t, _yy+_t, argument[2]);  
	draw_text(_xx+_t, _yy-_t, argument[2]);  
  
	//Text  
	draw_set_color(argument[3]);  
	draw_text(_xx, _yy, argument[2]);  
}