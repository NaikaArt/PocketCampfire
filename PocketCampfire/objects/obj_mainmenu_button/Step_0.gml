/// @description Insert description here
// You can write your code in this editor

if(!locked && global.game_state == GAME_STATE.LOCKED)
{
	locked = true;
	event_user(0);
	return;
}

if(locked && global.game_state != GAME_STATE.LOCKED)
{
	locked = false;
}