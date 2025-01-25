if globalTimer = giantBubbleTime
{
	instance_create_depth(random_range(0, camera_get_view_width(view_camera[0])),-64,10,objGiantBubble)
}


globalTimer ++;