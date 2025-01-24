draw_self();
if mouse_check_button(mb_left) && grabbed
{
	draw_line(x,y,clamp(window_mouse_get_x(),x - (maxSpeed),x + (maxSpeed)),clamp(window_mouse_get_y(),y - (maxSpeed),y + (maxSpeed)))
}
