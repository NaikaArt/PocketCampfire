/// @description 

// Create rarity-based selection array
var _items = [];

for(var _i_item = 1; _i_item <= ITEM.SWAP_SHROOMS; _i_item++)
{
	var _rarity = scr_get_item_rarity(_i_item);
	_rarity++; // Have at least 1 so we at least enter LOW rarity once
	
	for(var _j = 0; _j < _rarity; _j++) array_push(_items, _i_item);
}

// Select the berry ID
item_type = _items[irandom_range(0, array_length(_items) - 1)];


dug_up = false;
delete_timer = 1;
sound_played = false;

burried_item = spr_camp_burrieditem;
burried_item_w = sprite_get_width(burried_item);
burried_item_h = sprite_get_height(burried_item);
burried_item_x = 0;
burried_item_y = 0;
burried_item_a = 0;
burried_item_fadespeed = 0.5;

item_sprite = spr_inventory_items;
item_scale = 0.2;
item_w = sprite_get_width(item_sprite) * item_scale;
item_h = sprite_get_height(item_sprite) * item_scale;
item_alpha = 1;
item_i = 0;
item_y = burried_item_y;
item_y_dist = 50;

camp_hitbox = instance_find(obj_camp_hitbox, 0);
hit = noone;

while(hit == noone)
{
	burried_item_x = irandom_range(camp_hitbox.x, camp_hitbox.x + camp_hitbox.sprite_width);
	burried_item_y = irandom_range(camp_hitbox.y, camp_hitbox.y + camp_hitbox.sprite_height);
	hit = collision_point(burried_item_x, burried_item_y, camp_hitbox, true, false);
}

x = burried_item_x;
y = burried_item_y;