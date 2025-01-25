
var np = instance_nearest(hx,hy,objBubble)
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



 
draw_sprite(sprAmoebaBall,0,hx,hy)

draw_sprite(sprAmoebaEye,0,hx+ex,hy+ey)

if point_distance(x,y,np.x,np.y) < 60 {
    image_angle = dir
    draw_sprite_ext(sprAmoebaEat,-1,x,y,1,1,dir,-1,1)
} else {
    
    draw_sprite(sprAmoebaBody,image_index,x,y)
}



