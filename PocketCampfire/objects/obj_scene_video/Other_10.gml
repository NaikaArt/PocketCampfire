/// @description Close Video

if(!video_close_pending || video_get_status() != video_status_closed)
{
	video_close();
	video_close_pending = true;
}

if(video_get_status() != video_status_closed)
{
	alarm[0] = 1; // Retry after 1 frame
	return;
}

event_user(1);