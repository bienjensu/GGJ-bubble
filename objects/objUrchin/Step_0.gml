if mouse_check_button(mb_right) {
	var distance = point_distance(x, y, mouse_x, mouse_y);
	var xDiff = x - mouse_x
	var yDiff = y - mouse_y
	
	var xNorm = xDiff/distance
	var yNorm = yDiff/distance
	
	// Calculate falloff
	var k = 0.0
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
// Collide & reflect
if place_meeting(x+xVel, y+yVel, objCollider) {
	var step = 0.1
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
var target = instance_place(x,y,objBubble)
if target != "noone"
{
	with(target)
	{
		split()
	}
}
	xVel = lerp(xVel, 0, 0.1)
    yVel = lerp(yVel, 0, 0.1)
	// Apply velocities!
x += xVel
y += yVel
event_inherited()