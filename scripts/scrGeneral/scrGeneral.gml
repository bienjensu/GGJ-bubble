randomize()

surface_resize(application_surface, 320, 240);


#macro window_width window_get_width()
#macro window_height window_get_height()

#macro cameraw camera_get_view_width(view_camera[0])
#macro camerah camera_get_view_height(view_camera[0])
#macro camerax camera_get_view_x(view_camera[0])
#macro cameray camera_get_view_y(view_camera[0])
#macro cameraxm camerax+(cameraw/2)
#macro cameraym cameray+(camerah/2)
#macro cameraex camerax + cameraw
#macro cameraey cameray + camerah

#macro gamew 320
#macro gameh 240




#macro log show_debug_message
#macro key keyboard_check
#macro cam view_camera[0]


function Sleep(durration){	
	var _freezeDur = durration
	var _t = current_time + _freezeDur
	while (current_time < _t) { }
}