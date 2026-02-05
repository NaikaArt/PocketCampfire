/// @description Initialization

// Create rarity-based selection array
var _berries = [];

for(var _i_item = 0; _i_item < ITEM.HEIGHT; _i_item++)
{
	// Exclude non-berry items (Oran is the first, everything else is also berry)
	if(_i_item < ITEM.ORAN_BERRY) continue;
	
	var _rarity = scr_get_item_rarity(_i_item);
	_rarity += 1;
	
	for(var _j = 0; _j < _rarity; _j++) array_push(_berries, _i_item - ITEM.ORAN_BERRY);
}

// Select the berry ID
berry_id = _berries[irandom_range(0, array_length(_berries) - 1)];

// Set sprite variables
image_index = berry_id;
image_speed = 0;

target_size = 80;
image_xscale = target_size / sprite_width;
image_yscale = target_size / sprite_height;

// Set physics variables
spd = 300;
grav = 1.97;
rotation_speed = irandom_range(-3, 3);