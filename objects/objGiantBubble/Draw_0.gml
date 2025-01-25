
var np = instance_nearest(x,y,objBubble)
var hd = point_direction(x,y,np.x,np.y)

var hhx = lengthdir_x(2,hd)
var hhy = lengthdir_y(2,hd)

var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam)

if instance_exists(objBubble) {
	var d = min(point_distance(x, y, np.x, np.y) , head_radius)
	var dir = point_direction(x, y, np.x, np.y)
	ixo = lengthdir_x(d, dir)
	iyo = lengthdir_y(d, dir)
} else {
	ixo *= 0.9
	iyo *= 0.9
}




hx = (x % (320 * head_radius)) + cx + ixo
hy = (y % (256 * head_radius)) + cy + iyo
 

draw_sprite(sprAmoebaBall,0,hx,hy)
draw_sprite(sprAmoebaEye,0,hx+hhx,hy+hhy)

draw_self()