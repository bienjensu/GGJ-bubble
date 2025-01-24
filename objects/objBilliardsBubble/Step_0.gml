var distanceX = abs(x - window_mouse_get_x());
var distanceY = abs(y - window_mouse_get_y());
if mouse_check_button_pressed(mb_left) && distanceX < 48 && distanceY < 48
{
	grabbed = true;
}
if mouse_check_button_released(mb_left) && grabbed
{
	grabbed = false;
	xVel = (x - window_mouse_get_x());
	yVel = (y - window_mouse_get_y());
}
yVel = clamp(yVel, -maxSpeed, maxSpeed);
xVel = clamp(xVel, -maxSpeed, maxSpeed);
if y != 0 && y < 100
{
yVel += abs(200/y);
}
if y <= 0 
{
y = 1;
yVel = 0;
}
if !grabbed
{
	x += xVel * speedRatio;
	y+= yVel * speedRatio;
}
