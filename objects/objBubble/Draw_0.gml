var fcL = sprBubbleFaceLarge
var fcM = sprBubbleFaceMedium
var fcS = sprBubbleFaceSmall



var facespr


switch bubbleSize {
    case 1:
        facespr = fcS
        break;
    case 2:
        facespr = fcM
        break;
    case 3:
        facespr = fcL
        break;
}

if chompTimer > 0 {
    chompTimer --
}
if chompTimer == 0 {
    chompTimer = -1
    faceframe = frames.IDLE
}



draw_sprite_wrapped(sprite_index,image_index,x,y,0)
draw_sprite_wrapped(facespr,faceframe,x,y,0)

image_xscale = gx
image_yscale = gy

/*if mouse_check_button(mb_left) && grabbed
{
	draw_line(x,y,clamp(mouse_x,x - (maxSpeed),x + (maxSpeed)),clamp(mouse_y,y - (maxSpeed),y + (maxSpeed)))
}*/



//draw_set_color(c_red);
//draw_text(x,y,bubbleSize);
