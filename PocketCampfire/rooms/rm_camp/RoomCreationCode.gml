global.game_state = GAME_STATE.CAMP;

scr_set_music(snd_music_camp, 2);

var _mon_count = ds_list_size(global.ds_mon);

for(var _i = 0; _i < _mon_count; _i++)
{
	scr_camp_spawn_mon(_i);
}