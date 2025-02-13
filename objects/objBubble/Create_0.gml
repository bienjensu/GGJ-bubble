xVel = 0;
yVel = 0;
pusherX = 0;
pusherY = 0;
speedRatio = .09;
grabbed = false;
maxSpeed = 500;
maxVel = 1.0;
maxDist = 32;
originX = 0;
originY = 0;
invulnTimeR = 0;
invulnTime = 100;
flashTime = 5;
bubbleSize = 3;
bounceDampening = 0.8;
underBounce =1.5;
minPushDist = 50;
maxPushDist = 100;
pushForce = 0.05;
upForceMax = -0.425
upForce = upForceMax;
upForceDelayFrames = 40;
chompTimer = -1
gx = 1
gy = 1
minSpeed = 0.2;

enum frames {
    IDLE,
    DIZZY,
    MOUTH1,
    MOUTH2,
    CHOMP
}

faceframe = frames.IDLE

event_inherited()
function split()
{
	if invulnTimeR == 0
	{
        audio_play_sound(snd2click,0,0)
        Sleep(20)
        audio_play_sound(sndhurt,0,0,0.8,0,1)
		grabbed = false;
		invulnTimeR = invulnTime;
		bubbleSize --;
		//destroy bubble if it is too small
		if bubbleSize == 0
		{
            
            audio_stop_sound(sndhurt)
            //audio_play_sound(snd,0,0,0.6)
            audio_play_sound(sndhurt,0,0,0.8)
            Sleep(30)
            instance_destroy();
            if instance_number(objBubble) == 0
            {
                objStageController.gameOver = true ;
                objStageController.fadeTimer = objStageController.fadeTimerMax;
            }
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
		var bubble = instance_create_depth(x,y,10,objBubble);
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
        
        update_music()
	}
}
