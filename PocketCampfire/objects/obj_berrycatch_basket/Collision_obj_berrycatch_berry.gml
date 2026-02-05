/// @description Collision with a berry

game.berries_caught[? other.berry_id]++;
audio_play_sound(snd_item_get, 210, false);

catchanim_a = 0;

instance_destroy(other);