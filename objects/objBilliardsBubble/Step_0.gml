var distance = point_distance(x, y, mouse_x, mouse_y);

//set initial mouse position on clicik and set grabbed status
if mouse_check_button_pressed(mb_left) && distance < maxDist
{
	originX = mouse_x;
	originY = mouse_y;
	grabbed = true;
}
//if button released, add velocity
if mouse_check_button_released(mb_left) && grabbed
{
	grabbed = false;
	xVel = (originX - mouse_x)*speedRatio;
	yVel = (originY - mouse_y)*speedRatio;
}
//code for when bubble is hit; set split to true to initialise the code (probably better to put into a function actually hmm) edit: just did that
/*if split
{
	grabbed = false;
	bubbleSize --
	if bubbleSize == 0
	{
		show_debug_message("killme");
		instance_destroy();
		exit;
	}
	var moveAngle = point_direction(x,y,x+xVel,y+yVel)
	var moveDist = sqrt(sqr(xVel)+sqr(yVel))
	var xVelNew = lengthdir_x(moveDist,moveAngle+45)
	var yVelNew = lengthdir_y(moveDist, moveAngle+45)
	xVel = lengthdir_x(moveDist, moveAngle-45)
	yVel = lengthdir_y(moveDist, moveAngle-45)
	var bubble = instance_create_depth(x,y,10,objBilliardsBubble)
	bubble.xVel = xVelNew;
	bubble.yVel = yVelNew;
	bubble.bubbleSize = bubbleSize;
	bubble.invulnTimeR = invulnTime;
	split = false;
}*/
if invulnTimeR == 0
{
	image_alpha = 1;
	if place_meeting(x+xVel, y+yVel, objColliderHurt)
	{
		split();
	}
}
else
{
	if invulnTimeR % flashTime == 0
	{
		image_alpha = (image_alpha + 1) % 2;
	}
	invulnTimeR --
}
if !grabbed
{
	var onePx = sign(xVel)
	var moved = 0
	if place_meeting(x+xVel, y, objCollider)
	{
		while(!place_meeting(x+onePx, y, objCollider) && abs(moved+onePx) < abs(xVel))
		{
			x+=onePx
			moved+=onePx
		}
		xVel = -(xVel-moved)*bounceDampening;
	}

	x += xVel;
	xVel += moved*bounceDampening;
	xVel = clamp(xVel, -maxSpeed, maxSpeed);

	onePx = sign(yVel)
	moved = 0
	if place_meeting(x, y+yVel, objCollider)
	{
		while(!place_meeting(x, y+onePx, objCollider) && abs(moved+onePx) < abs(yVel))
		{
			y+=onePx
			moved+=onePx
		}
		yVel = -(yVel-moved)*bounceDampening;
	}

	y += yVel;
	yVel += moved*bounceDampening;
	yVel = clamp(yVel, -maxSpeed, maxSpeed);
}