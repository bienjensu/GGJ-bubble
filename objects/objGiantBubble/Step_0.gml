if pushTimeR % pushTime == 0
{
	var target = instance_nearest(x,y,objBilliardsBubble)
	if target != noone
	{
		xVel = lengthdir_x(moveSpeed, point_direction(x,y,target.x,target.y));
		yVel = lengthdir_y(moveSpeed, point_direction(x,y,target.x,target.y));
	}
	pushTimeR = 0;
}
pushTimeR++
xVel = lerp(xVel, 0, speedFalloff);
yVel = lerp(yVel, 0, speedFalloff);
x+=xVel;
y+=yVel;
if y > 0
{
	onscreen = true;
}
if onscreen
{
	event_inherited()
}
var target = instance_place(x,y,objBilliardsBubble)
if target != "noone"
{
	with(target)
	{
		split()
	}
}