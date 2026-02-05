// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_new_game()
{
	ds_list_clear(global.ds_mon);
	ds_grid_clear(global.ds_inventory, 0);
	with(obj_camp_mon) instance_destroy();
	
	instance_create_depth(0,0,0,obj_newgame_sequence);
}