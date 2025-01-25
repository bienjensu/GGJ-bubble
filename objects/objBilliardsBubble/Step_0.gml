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

// if rmb and not dragged, apply push force
if !grabbed and mouse_check_button(mb_right) {
	xDiff = x - mouse_x
	yDiff = y - mouse_y
	
	xNorm = xDiff/distance
	yNorm = yDiff/distance
	
	// Calculate falloff
	k = 0.0
	if (distance < minPushDist) {
		k = 1.0
	} else if (minPushDist < distance and distance < maxPushDist) {
		k = (distance - minPushDist) / maxPushDist
	} else if (maxPushDist < distance) {
		k = 0.0
	}
	
	xVel += xNorm * pushForce * k
	yVel += yNorm * pushForce * k
}
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
event_inherited()