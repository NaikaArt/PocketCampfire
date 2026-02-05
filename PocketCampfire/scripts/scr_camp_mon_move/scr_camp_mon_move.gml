/// @desc Move 'Mon To Target
function scr_camp_mon_move() 
{
	// Set target and start moving
	if(target[0] < 0 || target[1] < 0) // Counts 'noone' and -1 for invalid target
	{
		var _camp_hitbox = instance_find(obj_camp_hitbox, 0);
		var _hit = noone;
	
		while(_hit == noone)
		{
			target[0] = irandom_range(_camp_hitbox.x, _camp_hitbox.x + _camp_hitbox.sprite_width);
			target[1] = irandom_range(_camp_hitbox.y, _camp_hitbox.y + _camp_hitbox.sprite_height);
			_hit = collision_point(target[0], target[1], _camp_hitbox, true, false);
		}
	
		speed = base_spd;
		image_angle = 0;
	
		if(image_xscale == 1 && target[0] > x) {image_xscale = -1}
		else if(image_xscale == -1 && target[0] < x) {image_xscale = 1}
	}

	// Moving
	if point_distance(x, y, target[0], target[1]) > 5
	{
		move_towards_point(target[0], target[1], speed);
		y += 2 * sin(2 * pi * hop_speed * (current_time/1000));
	}
	else 
	{
		state = POKEMON_STATES.IDLE;
		wobble_time = 0;
		speed = 0;
	
		target[0] = -1;
		target[1] = -1;
	}
}