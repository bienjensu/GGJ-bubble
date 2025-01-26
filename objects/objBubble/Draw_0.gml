
draw_self();
if mouse_check_button(mb_left) && grabbed
{
	draw_line(x,y,clamp(mouse_x,x - (maxSpeed),x + (maxSpeed)),clamp(mouse_y,y - (maxSpeed),y + (maxSpeed)))
}

draw_self_ext(sprite_index,image_index,x-cameraex,y+cameraey)


//draw_set_color(c_red);
//draw_text(x,y,bubbleSize);
