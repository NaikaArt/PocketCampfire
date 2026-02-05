/// @description Destroy Self

room_goto(rm_camp);
global.game_state = GAME_STATE.CAMP;
instance_destroy(id);