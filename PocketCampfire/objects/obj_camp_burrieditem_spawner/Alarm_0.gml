/// @description Spawn an item

if(instance_number(obj_camp_burrieditem) < max_items)
{
	var _obj = instance_create_layer(0, 0, "BurriedItems", obj_camp_burrieditem);
}

alarm[0] = random_range(spawntime_min, spawntime_max) * global.game_speed;