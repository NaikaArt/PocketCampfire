/// @description Play cry

var _cry_type = MON_CRIES.NEUTRAL;

if(arousal < 25) _cry_type = MON_CRIES.SAD;
else if(arousal >= 25 && arousal < 50) _cry_type = MON_CRIES.NEUTRAL;
else if(arousal >= 50 && arousal < 75) _cry_type = MON_CRIES.HAPPY;
else if(arousal >= 75) _cry_type = MON_CRIES.AROUSED;

scr_play_mon_cry(species_id, _cry_type);