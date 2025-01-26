if abs(xVel) < slowSpeed && moveTimer > pushFrame
{
	image_index = 0;
}
if moveTimer == pushFrame
{
	image_index = 1;
}
if moveTimer  == 0
{
    audio_stop_sound(sndNautilus)
    audio_play_sound(sndNautilus,0,0,0.2,0,0.7)
	moveTimer = moveTimerMax;
	xVel = xDirection * moveSpeed;
	image_index = 2;
}

if abs(xVel) > slowSpeed {
    bubble(x-10*xDirection-random(10*xDirection),y+shake(3),0.5,random_range(30,80))
}

moveTimer --;
x += xVel;
xVel = lerp(xVel, 0, moveDecay);


event_inherited();