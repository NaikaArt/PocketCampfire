function scr_end_scene() 
{
	scr_fade_scene(rm_camp, 1, 11);
	var _sequence = instance_create_layer(0, 0, "UI", obj_scene_end_sequence);
}