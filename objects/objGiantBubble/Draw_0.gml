var np
if instance_exists(objBubble) {
    np = instance_nearest(x,y,objBubble)
} else {
    np = self
}

var hd = point_direction(hx,hy,np.x,np.y)
var dir = point_direction(hx, hy, np.x, np.y)

//dd = round( 8 * dir / (2*pi) + 8 ) % 8

var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam)

if instance_exists(objBubble) {
	var d = min(point_distance(hx, hy, np.x, np.y) , head_radius)
	
	ixo = lengthdir_x(d, dir)
	iyo = lengthdir_y(d, dir)
} else {
	ixo *= 0.9
	iyo *= 0.9
}




x = lerp(x,(hx ) + cx + ixo,0.05)
x = clamp(x,hx-head_radius,hx+head_radius)

y = lerp(y,(hy) + cy + iyo,0.05)
y = clamp(y,hy-head_radius,hy+head_radius)


ex = clamp(lerp(ex, lengthdir_x(2,hd),0.1),-2,2)
ey = clamp(lerp(ey,lengthdir_y(2,hd),0.1),-2,2)


if dashT > 0  {
    //image_angle = dashDirection 
    draw_sprite_wrapped(sprAmoebaEat,1,x,y,dashDirection)
} else {
    draw_sprite_wrapped(sprAmoebaBody,image_index,x+shake(cha),y+shake(cha),0)
}
 
draw_sprite_wrapped(sprAmoebaBall,1,hx+shake(cha*2.5),hy+shake(cha*2.5))

draw_sprite_wrapped(sprAmoebaEye,1,hx+ex+shake(0.2),hy+ey+shake(0.2))





