/// @description Insert description here

switch(mode)
{
	case SPRITE_MODES.FRIENDLY_INTIMATE:
	case SPRITE_MODES.FRIENDLY_INTIMATE_CUM:
	case SPRITE_MODES.LOVE_INTIMATE:
	case SPRITE_MODES.LOVE_INTIMATE_CUM:
		draw_sprite_ext(sprite, mode, x, y, 1, 1, 0, c_white, 1);
	break;
	default:
		draw_sprite_ext(sprite, mode, adjusted_x, adjusted_y, mon_scale, mon_scale, 0, c_white, 1);
	break;
}