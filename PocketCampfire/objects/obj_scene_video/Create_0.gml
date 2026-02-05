/// Create Event

enum SCENE_MODE
{
	ORAL,
	SEX
}

mon_species = global.active_mon[? "species"];

lut_sampler = shader_get_sampler_index(sh_lut, "s_Lut");
lut_texture = sprite_get_texture(spr_scene_lut, mon_species + 1);

// State Variables
finished = false;
var _datafiles_dir = working_directory + "/datafiles/";

locked = false;
mode = SCENE_MODE.ORAL;
target_mode = SCENE_MODE.ORAL;
target_phase = 0;
current_phase = 0;

// Video Reference Obtaining & Variables
mon_name = global.active_mon[? "name"];
mon_name_file = string_replace_all(string_lower(mon_name), " ", "");
gender = global.active_mon[? "gender"];
gender_string = gender == GENDERS.M ? "m" : "f";

oral_clips = array_create(5);
sex_clips = array_create(5);

voice_enabled = true;
with(obj_sound_manager) 
{
	other.voice_enabled = human_voice_enabled;
}

human_voiceclips = [snd_human_1, snd_human_2, snd_human_3, snd_human_4, snd_human_5];
human_voiceclips_muffled = [snd_humanmuffled_1, snd_humanmuffled_2, snd_humanmuffled_3, snd_humanmuffled_4, snd_humanmuffled_5];
current_humanvoice = -1;
ag_voice_gain = audio_group_get_gain(ag_voice);

for(var _i = 0; _i < 5; _i++)
{
	// Find Oral clips
	oral_clips[_i] = mon_name_file + "/" + mon_name_file + "_oral_" + gender_string + "_" + string(_i + 1) + ".mp4";
	if(!file_exists(oral_clips[_i])) 
		oral_clips[_i] = mon_name_file + "/" + mon_name_file + "_oral_" + string(_i + 1) + ".mp4";
	if(!file_exists(oral_clips[_i])) 
		oral_clips[_i] = "INVALID";
	
	// Find Sex clips
	sex_clips[_i] = mon_name_file + "/" + mon_name_file + "_sex_" + gender_string + "_" + string(_i + 1) + ".mp4";
	if(!file_exists(sex_clips[_i])) 
		sex_clips[_i] = mon_name_file + "/" + mon_name_file + "_sex_" + string(_i + 1) + ".mp4";
	
	if(!file_exists(sex_clips[_i])) 
		sex_clips[_i] = "INVALID";
}

video = noone;
/*
video = mode == SCENE_MODE.ORAL ? video_open(oral_clips[current_phase]) : video_open(sex_clips[current_phase]);
video_enable_loop(true);
*/
video_close_pending = false;
video_open_pending = false;
video_last_position = -100;

event_user(1);


// pleasure Bar
pleasure_bar = spr_scene_pleasurebar;
pleasure_bar_progress = spr_scene_pleasurebar_progress;
pleasure_bar_width = sprite_get_width(pleasure_bar);
pleasure_bar_height = sprite_get_height(pleasure_bar);
pleasure_bar_x = 10;
pleasure_bar_y = global.game_height / 2 - pleasure_bar_height / 2;
pleasure_bar_progress_padding_top = 10;
pleasure_bar_progress_padding_bottom = 15;
pleasure_bar_trueheight = pleasure_bar_height - pleasure_bar_progress_padding_top - pleasure_bar_progress_padding_bottom;

pleasure = 0;
max_pleasure = 100;

// Control Buttons
button = spr_scene_controlbutton;
button_selected = spr_scene_controlbutton_selected;
button_count = 6;
button_width = sprite_get_width(button);
button_height = sprite_get_height(button);
button_margin_x = 10;
button_margin_y = 3;
button_modebutton_gap = 20;
button_x = global.game_width - button_margin_x;
button_y = global.game_height / 2 - (button_count * (button_height + button_margin_y * 2) + button_modebutton_gap) / 2;
button_trueheight = button_height + 2 * button_margin_y;

selected_button = -1;

// Menu buttons
menubutton = spr_scene_menubuttons;
menubutton_count = 3;
menubutton_width = sprite_get_width(menubutton);
menubutton_height = sprite_get_height(menubutton);
menubutton_margin_x = 10;
menubutton_margin_y = 10;
menubutton_x = menubutton_margin_x;
menubutton_y = global.game_height - menubutton_margin_y;
menubutton_gap = 10;

selected_menubutton = -1;

// Fading
fade_time = 0.1;
fading = false;
fade_dir = 0;
fade_a = 0;

with(obj_sound_manager) event_user(0);