randomize()

surface_resize(application_surface, 320, 240);
window_set_size(640,480)


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

draw_set_font(fntMono)


#macro log show_debug_message
#macro key keyboard_check
#macro cam view_camera[0]

#macro offWhite #dafffe 
#macro menuGreen #00774a 


function Sleep(durration){	
	var _freezeDur = durration
	var _t = current_time + _freezeDur
	while (current_time < _t) { }
}

function draw_self_ext(_s,_n,_x,_y){
	draw_sprite_ext(_s,_n,_x,_y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
}


function draw_sprite_wrapped(_sprite_index,_image_index,_x,_y,rot=0) {
    draw_sprite_ext(_sprite_index,_image_index,_x,_y,image_xscale,image_yscale,rot,image_blend,image_alpha)
    draw_sprite_ext(_sprite_index,_image_index,_x,_y+room_height,image_xscale,image_yscale,rot,image_blend,image_alpha)
    draw_sprite_ext(_sprite_index,_image_index,_x,_y-room_height,image_xscale,image_yscale,rot,image_blend,image_alpha)
    draw_sprite_ext(_sprite_index,_image_index,_x+room_width,_y,image_xscale,image_yscale,rot,image_blend,image_alpha)
    draw_sprite_ext(_sprite_index,_image_index,_x-room_width,_y,image_xscale,image_yscale,rot,image_blend,image_alpha)
}

function shake(i) {
    return random_range(-i,i)
}

function Wave(_amp, _freq, _prog){
	return _amp*sin(_prog/_freq);
}
function Wave2(from, to, duration){
    a4 = (to - from) * 0.5;
    return from + a4 + sin((((current_time * 0.001) +duration) / duration) * (pi*2)) * a4;
}

function bubble(_x = x, _y = y, chance = 1, decay = -1) {
    if random_range(chance,1) > 1-chance {
        var b = instance_create_depth(_x,_y,depth+1,objPBubble)
        if decay != -1 {
            b.decay = decay
        }
        return b
    }
    
}

function boolToString(_bool)
{
    var _output = ""
    switch _bool{
        case true: 
            _output = "on"
            break;
        case false:
            _output = "off"
            break;
    }
    return _output;
}

function mouse_set_position(__room_pos_x, __room_pos_y) {

// Sets mouse position to a position in the room
// Accounts for window size, position, scale

// Position of object in view
var __object_pos_x          = __room_pos_x - camera_get_view_x(cam)
var __object_pos_y          = __room_pos_y - camera_get_view_y(cam)

// Scale of window -- max is what the scale of the "output" is
var __window_scale_x            = window_get_width()    /   window_width 
var __window_scale_y            = window_get_height()   /   window_height
var __window_scale_output       = min(__window_scale_x, __window_scale_y)

// Figure out letterbox dimensions for mismatched window size so we can offset position
var __window_letterbox_width    = max(0, window_get_width() - (window_width*__window_scale_output))
var __window_letterbox_height   = max(0, window_get_height() - (window_height*__window_scale_output))

// Figure out monitor position
var __monitor_pos_x         = window_get_x() + __window_letterbox_width/2 + (__object_pos_x * __window_scale_output)
var __monitor_pos_y         = window_get_y() + __window_letterbox_height/2 + (__object_pos_y * __window_scale_output)

// Set mouse pos
display_mouse_set(__monitor_pos_x, __monitor_pos_y)
}