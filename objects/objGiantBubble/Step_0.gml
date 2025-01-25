if pushTimeR % pushTime == 0
{
	var target = instance_nearest(hx,hy,objBubble)
	if target != noone
	{
		xVel = lengthdir_x(moveSpeed, point_direction(hx,hy,target.x,target.y));
		yVel = lengthdir_y(moveSpeed, point_direction(hx,hy,target.x,target.y));
	}
	pushTimeR = 0;
}
pushTimeR++
xVel = lerp(xVel, 0, speedFalloff);
yVel = lerp(yVel, 0, speedFalloff);
hx+=xVel;
hy+=yVel;
if hy > 0
{
	onscreen = true;
}
if onscreen
{
	event_inherited()
}
var target = instance_place(hx,hy,objBubble)
if target != "noone"
{
	with(target)
	{
		split()
	}
}

t++