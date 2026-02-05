function scr_start_scene() 
{
	scr_set_sprite(SPRITE_PROMPTS.HAPPY);
	scr_modify_stat(global.active_mon, "arousal", 80, "subtract", noone);
	scr_play_mon_cry(global.active_mon[? "species"], MON_CRIES.HAPPY);

	scr_fade_scene(rm_scene, 1, 13);
	scr_set_music(snd_scene_music, 1500);
	var _sequence = instance_create_layer(0, 0, "UI", obj_scene_start_sequence);
}