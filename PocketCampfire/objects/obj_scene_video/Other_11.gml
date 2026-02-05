///@description Start new video

if(!video_open_pending || video_get_status() == video_status_closed)
{
	video = mode == SCENE_MODE.ORAL ? video_open(oral_clips[current_phase]) : video_open(sex_clips[current_phase]);
	video_close_pending = false;
	video_open_pending = true;
}

if(video_get_status() != video_status_playing)
{
	alarm[3] = 1; // Retry after 1 frame
	return;
}
else
{
	video_open_pending = false;
	video_last_position = -100;

	// Select and play a clip
	video_enable_loop(true);
	video_set_volume(scr_get_volume(AUDIO_GROUP.SOUND));

	// Play human voice
	event_user(2);
}