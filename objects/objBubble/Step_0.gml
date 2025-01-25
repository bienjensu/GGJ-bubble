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
	// Collide & reflect
	if place_meeting(x+xVel, y+yVel, objCollider) {
		step = 0.1
		while(!place_meeting(x+step*xVel, y+step*yVel, objCollider)) {
			x += step * xVel
			y += step * yVel
		}
		while(place_meeting(x, y, objCollider)) {
			x += step * -xVel
			y += step * -yVel
		}
		xVel = -xVel * bounceDampening
		yVel = -yVel * bounceDampening
	}
	

}

// Apply velocities!
x += xVel
y += yVel

// Slow down if above max velocity
curVel = abs(yVel) + abs(xVel)
if curVel > maxVel {
	show_debug_message("REDUCING")
	multiplier = maxVel/curVel
	xVel = lerp(xVel, xVel * multiplier, 0.1)
	yVel = lerp(yVel, yVel * multiplier, 0.1)
} else {
	xVel = lerp(xVel, 0, 0.1)
}
yVel = lerp(yVel, -1.35, 0.1)

_i = instance_place(x,y,objBubble)
if _i != noone {
	dx = x - _i.x
	dy = y - _i.y
	xVel += dx * 0.01
	yVel += dy * 0.01
	_i.xVel -= dx * 0.01
	_i.yVel -= dy * 0.01
}

event_inherited()

