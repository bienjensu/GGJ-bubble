if pushTimeR % pushTime == 0
{
	xVel = lengthdir_x(moveSpeed, point_direction(x,y,objBilliardsBubble.x,objBilliardsBubble.y));
	yVel = lengthdir_y(moveSpeed, point_direction(x,y,objBilliardsBubble.x,objBilliardsBubble.y));
	pushTimeR = 0;
}
pushTimeR++
xVel = lerp(xVel, 0, speedFalloff);
yVel = lerp(yVel, 0, speedFalloff);
x+=xVel;
y+=yVel;