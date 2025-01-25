xVel = 0;
yVel = 0;
pusherX = 0;
pusherY = 0;
speedRatio = .05;
grabbed = false;
maxSpeed = 100;
maxVel = 1.0;
maxDist = 32;
originX = 0;
originY = 0;
invulnTimeR = 0;
invulnTime = 100;
flashTime = 5;
bubbleSize = 3;
bounceDampening = .5;
minPushDist = 10;
maxPushDist = 50;
pushForce = 0.1;
event_inherited()
function split()
{
	if invulnTimeR == 0
	{
		grabbed = false;
		invulnTimeR = invulnTime;
		bubbleSize --;
		//destroy bubble if it is too small
		if bubbleSize == 0
		{
			instance_destroy();
			exit;
		}
		//calculate move distance and angle
		var moveAngle = point_direction(x,y,x+xVel,y+yVel);
		var moveDist = sqrt(sqr(xVel)+sqr(yVel));
		//get two new velocities at 45 degree angle from the original and give them to the new bubble and current one
		var xVelNew = lengthdir_x(moveDist,moveAngle+45);
		var yVelNew = lengthdir_y(moveDist, moveAngle+45);
		xVel = lengthdir_x(moveDist, moveAngle-45);
		yVel = lengthdir_y(moveDist, moveAngle-45);
		var bubble = instance_create_depth(x,y,10,objBilliardsBubble);
		bubble.xVel = xVelNew;
		bubble.yVel = yVelNew;
		bubble.bubbleSize = bubbleSize;
		bubble.invulnTimeR = invulnTime;
		
		switch bubble.bubbleSize {
			case 3: bubble.sprite_index = sprBubbleLarge
			break;
			case 2: bubble.sprite_index = sprBubbleMedium
			break;
			case 1: bubble.sprite_index = sprBubbleSmall
			break;
		}
		switch bubbleSize {
			case 3: sprite_index = sprBubbleLarge
			break;
			case 2: sprite_index = sprBubbleMedium
			break;
			case 1: sprite_index = sprBubbleSmall
			break;
		}
	}
}