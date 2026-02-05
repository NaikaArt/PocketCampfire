/// Update Event

selected_button = -1;
selected_menubutton = -1;

// Add pleasure based on phase
switch(current_phase)
{
	case 0:
		pleasure += 1.5 / global.game_speed;
		break;
	case 1:
		pleasure += 3.5 / global.game_speed;
		break;
	case 2:
		pleasure += 6 / global.game_speed;
		break;
}

pleasure = clamp(pleasure, 0, 100);

// Don't do anything else if we're already finished, a video swap is busy or the game is locked
if(finished || video_close_pending || video_open_pending || global.game_state == GAME_STATE.LOCKED) { return; }

// Fading Logic
if(fade_a >= 1) 
{
	fade_a = 0.99; 
	fade_dir = -1; 
	current_phase = target_phase;
	mode = target_mode;
	
	event_user(3);
}
else
{
	if(fade_a <= 0 && fade_dir == -1) { fade_a = 0; fade_dir = 0; fading = false; }		// Fade finished
	fade_a += ((1 / fade_time) * fade_dir) / global.game_speed;
}
	
// Handle logic on loops
if(video_last_position > video_get_position() && video_get_status() == video_status_playing)
{
	video_last_position = -1;
	
	if(current_phase == 3) 
	{
		current_phase++;
		event_user(3);
	}
	else
		event_user(2);		// Loop voice sounds
}
else video_last_position = video_get_position();


// If we're in the cumming or refraction phase, stop here
if(current_phase >= 3) { selected_button = -1; return; }


// GUI Handling
var _mousex = device_mouse_x_to_gui(0);
var _mousey = device_mouse_y_to_gui(0);

selected_button = -1;
selected_menubutton = -1;

for(var _k = 0; _k < button_count; _k++)
{
	if(_k == 5 && pleasure < 100) { break; }	// Don't allow selection of the cum button if below 100 pleasure
	
	var _button_x1 = button_x - button_width;
	var _button_y1 = button_y + _k * button_trueheight + button_margin_y;
	if(_k >= 2) _button_y1 += button_modebutton_gap;	// Add the mode gap offset for buttons after them
	var _button_x2 = button_x;
	var _button_y2 = _button_y1 + button_height;
	
	if(_mousex > _button_x1 && _mousex < _button_x2 && _mousey > _button_y1 && _mousey < _button_y2)
	{
		selected_button = _k;
		break;
	}
}

if(selected_button == -1)
{
	for(var _l = 0; _l < menubutton_count; _l++)
	{	
		var _button_x1 = menubutton_x + ((menubutton_width + menubutton_gap) * _l);
		var _button_y1 = menubutton_y - menubutton_height;
		var _button_x2 = _button_x1 + menubutton_width;
		var _button_y2 = menubutton_y;
	
		if(_mousex > _button_x1 && _mousex < _button_x2 && _mousey > _button_y1 && _mousey < _button_y2)
		{
			selected_menubutton = _l;
			break;
		}
	}
}