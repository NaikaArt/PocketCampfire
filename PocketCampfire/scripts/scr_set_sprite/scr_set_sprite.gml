function scr_set_sprite(_sprite_prompt) 
{
	var _sprite_mode = SPRITE_MODES.FRIENDLY_NEUTRAL;
	var _affection_level = scr_get_affection_level();
	var _arousal_level = scr_get_arousal_level();

	// Selection of the Spline Mode based on affection and arousal
	switch(_affection_level)
	{
		case AFFECTION_LEVEL.NEW:
		
			switch(_sprite_prompt)
			{
				case SPRITE_PROMPTS.HAPPY:
					_sprite_mode = SPRITE_MODES.SHY_HAPPY;
					break;
				case SPRITE_PROMPTS.UPSET:
					_sprite_mode = SPRITE_MODES.SHY_UPSET;
					break;
				default:
					_sprite_mode = SPRITE_MODES.SHY_NEUTRAL
			}
			
		break;
			
		case AFFECTION_LEVEL.LOW:
		case AFFECTION_LEVEL.MEDIUM:
		
			switch(_sprite_prompt)
			{
				case SPRITE_PROMPTS.HAPPY:
				
					if(_arousal_level == AROUSAL_LEVEL.HIGH)
					{
						_sprite_mode = _affection_level == AFFECTION_LEVEL.LOW ? 
						SPRITE_MODES.FRIENDLY_HAPPY_X_COVER : SPRITE_MODES.FRIENDLY_HAPPY_X;
					}
					else _sprite_mode = SPRITE_MODES.FRIENDLY_HAPPY;
					
				break;
				case SPRITE_PROMPTS.SHOWOFF:
					
					_sprite_mode = _arousal_level == AROUSAL_LEVEL.HIGH ?
					SPRITE_MODES.FRIENDLY_SHOWOFF_X : SPRITE_MODES.FRIENDLY_SHOWOFF;
					
				break;
				case SPRITE_PROMPTS.INTIMATE:
				
					_sprite_mode = SPRITE_MODES.FRIENDLY_INTIMATE;
					
				break;
				case SPRITE_PROMPTS.INTIMATE_CUM:
				
					_sprite_mode = SPRITE_MODES.FRIENDLY_INTIMATE_CUM;
					
				break;
				case SPRITE_PROMPTS.UPSET:
				
					_sprite_mode = SPRITE_MODES.FRIENDLY_UPSET;
					
				break;
				default:
				
					if(_arousal_level == AROUSAL_LEVEL.HIGH)
					{
						_sprite_mode = _affection_level == AFFECTION_LEVEL.LOW ? 
						SPRITE_MODES.FRIENDLY_NEUTRAL_X_COVER : SPRITE_MODES.FRIENDLY_NEUTRAL_X;
					}
					else _sprite_mode = SPRITE_MODES.FRIENDLY_NEUTRAL;
			}
			
		break;
			
		case AFFECTION_LEVEL.HIGH:
		case AFFECTION_LEVEL.MAX:
		
			switch(_sprite_prompt)
			{
				case SPRITE_PROMPTS.HAPPY:
				
					_sprite_mode = _arousal_level == AROUSAL_LEVEL.HIGH ?
					SPRITE_MODES.LOVE_HAPPY_X : SPRITE_MODES.LOVE_HAPPY;
					
				break;
				case SPRITE_PROMPTS.SHOWOFF:
					
					_sprite_mode = _arousal_level == AROUSAL_LEVEL.HIGH ?
					SPRITE_MODES.LOVE_SHOWOFF_X : SPRITE_MODES.LOVE_SHOWOFF;
					
				break;
				case SPRITE_PROMPTS.INTIMATE:
				
					_sprite_mode = SPRITE_MODES.LOVE_INTIMATE;
					
				break;
				case SPRITE_PROMPTS.INTIMATE_CUM:
				
					_sprite_mode = SPRITE_MODES.LOVE_INTIMATE_CUM;
					
				break;
				case SPRITE_PROMPTS.UPSET:
				
					_sprite_mode = SPRITE_MODES.LOVE_UPSET;
					
				break;
				default:
				
					_sprite_mode = _arousal_level == AROUSAL_LEVEL.HIGH ?
					SPRITE_MODES.LOVE_NEUTRAL_X : SPRITE_MODES.LOVE_NEUTRAL;
			}
		
		break;
	}
	
	global.interaction_sprite_object.mode = _sprite_mode;
	return _sprite_mode;
}