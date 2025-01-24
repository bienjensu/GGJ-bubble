if (mouse_check_button(mb_left)) {
	show_debug_message("Moving!")
	force = 5.0
	x_diff = (x - mouse_x)
	y_diff = (y - mouse_y)
	
	draw_x = mouse_x
	draw_y = mouse_y
	
	dist = point_distance(mouse_x, mouse_y, x, y)
	norm_x = x_diff/dist
	norm_y = y_diff/dist
	
	x_vel += (norm_x * force)/dist
	y_vel += (norm_y * force)/dist
}

x_vel = lerp(x_vel, 0, 0.03)
y_vel = lerp(y_vel, 0, 0.03)
x += x_vel
y += y_vel

if(x>1366) {x_vel -= 5.0}
if(y>768) {y_vel -= 5.0}
if (x<0) {x_vel += 5.0}
if (y<0) {y_vel += 5.0}
