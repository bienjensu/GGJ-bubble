xVel = 0;
yVel = 0;
xDirection = choose(1,-1);
image_xscale = -xDirection
moveSpeed = 2;
moveDecay = 0.04;
moveTimerMax = 100;
moveTimer = irandom(moveTimerMax);
pushFrame = 12;
slowSpeed = 0.5;
event_inherited()
vulnerable = true;