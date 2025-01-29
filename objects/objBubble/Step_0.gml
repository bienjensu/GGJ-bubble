var distance = point_distance(x, y, objCursor.x, objCursor.y);

//set initial mouse position on clicik and set grabbed status
/*if mouse_check_button_pressed(mb_left) && distance < maxDist
{
	originX = mouse_x;
	originY = mouse_y;
	grabbed = true;
}
//if button released, add velocity
if mouse_check_button_released(mb_left) && grabbed
{
	grabbed = false
	xVel = (originX - mouse_x)*speedRatio;
	yVel = (originY - mouse_y)*speedRatio;
    audio_play_sound(sndBubble,0,0,0.3,0,clamp((max(abs(xVel),abs(yVel))*0.1)+0.5 ,0.8,1.1)* random_range(0.95,1.1))
}*/

// if rmb and not dragged, apply push force
if !grabbed and mouse_check_button(mb_right) {
    if !audio_is_playing(Sndblowing) {
        audio_play_sound(Sndblowing,0,true,0.5,0,1)
    }
    
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

if mouse_check_button_released(mb_right) {
    audio_stop_sound(Sndblowing)
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

// Slow down if above max velocity
var curVel = abs(yVel) + abs(xVel)
if curVel > maxVel {
	//show_debug_message("REDUCING")
	var multiplier = maxVel/curVel
	xVel = lerp(xVel, xVel * multiplier, 0.1)
	yVel = lerp(yVel, yVel * multiplier, 0.1)
} else {
	xVel = lerp(xVel, 0, 0.1)
}
if upForce > upForceMax
{
    upForce += upForceMax/upForceDelayFrames
}
    
yVel = lerp(yVel, upForce, 0.1)

var _i = instance_place(x,y,objBubble)
if _i != noone {  
	var dx = x - _i.x
	var dy = y - _i.y
	xVel += dx * 0.01
	yVel += dy * 0.01
	_i.xVel -= dx * 0.01
	_i.yVel -= dy * 0.01
}

// Collide & reflect
var yDeg = 0
var xDeg = 0
var step = 0.1
if place_meeting(x+xVel, y, objCollider) {
    var stepSign = sign(xVel)
    while(!place_meeting(x+step*xVel+(step*stepSign), y, objCollider)) {
        x += step * xVel+(step*stepSign)
        xDeg += step*xVel+(step*stepSign)
    }
    var b = bubble(x,y,0.3)
    xVel = -xVel * bounceDampening
    x -= xDeg
}
x += xVel
if place_meeting(x, y+yVel, objCollider) {
    var stepSign = sign(yVel) 
    while(!place_meeting(x, y+step*yVel+(step*stepSign), objCollider)) {
        y += step*yVel+(step*stepSign)
        yDeg += step*yVel+(step*stepSign)
    }
    var b = bubble(x,y,0.3)
    yVel = -yVel * bounceDampening
    y -= yDeg
    if abs(yVel) < 0.5
    {
        yVel = sign(yVel)*0.1;
    }
}
y += yVel


event_inherited()

