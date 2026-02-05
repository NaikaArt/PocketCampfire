global.game_state = GAME_STATE.INTERACTION;

var _active_species = global.active_mon[? "species"];
var _height = global.interact_bg_height[? _active_species];

var _bg_sprite_height = sprite_get_height(spr_interaction_background);
var _max_offset = _bg_sprite_height - global.game_height;

layer_y("Background", (_max_offset - (_max_offset * _height)) * -1);