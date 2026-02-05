/// @description Insert description here

if(global.game_state != GAME_STATE.CAMP) { return; }

if(active && global.game_state == GAME_STATE.CAMP) 
{ 
	active = false;
	image_index = 0;
	audio_play_sound(snd_slide_woosh, 100, false);
	scr_create_confirmation("Will you go out to find ingredients?", scr_play_berrycatch); 
}