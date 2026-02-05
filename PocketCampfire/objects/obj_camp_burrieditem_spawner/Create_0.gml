/// @description 

spawntime_min = 7;
spawntime_max = 12;

max_items = 3;

alarm[0] = (random_range(spawntime_min, spawntime_max) / 3) * global.game_speed;	// Reduced start time