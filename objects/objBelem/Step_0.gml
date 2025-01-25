if !grounded
{
    yVel += decelRate;
    yVel = min(yVel, fallSpeed);
    if jumpTimer > 0
    {
        jumpTimer--
        if jumpTimer = 0
        {
            sprite_index = sprBelemJump
        }
    }
    if !falling
    {
      if yVel > 0
      {
        falling = true
        sprite_index = sprBelemFall
      }
    }
    if falling
    {
        if place_meeting(x, y+yVel, objCollider)
        { 
            while !place_meeting(x , y,objCollider)
            {
                y++
            }
            yVel = 0;
            falling = false;
            grounded = true;
            sprite_index = sprBelemLand;
            image_index = 0;
            groundedTimer = groundedTimerMax;
            
        }
    }
}
if grounded
{
    if groundedTimer > 0
    { 
        if groundedTimer <= frameRate*2+1
        {
            if groundedTimer % frameRate == 0
            {
                image_index ++;
            }
        }
        groundedTimer --
        if groundedTimer = 0
        {
            sprite_index = sprBelemPeek
            image_index = 0;
        }
    }
    else
    {
        var nearestBubble = instance_nearest(x,y,objBubble);
        if abs(x - nearestBubble.x) < peekDistX && y - nearestBubble.y < peekDistY && y - nearestBubble.y >0
        {
            if abs(x - nearestBubble.x) < jumpDist
            {
                image_index = 2;
                jumpTimer = frameRate;
                grounded = false;
                yVel -= jumpSpeed;
            }
            else
            {
                image_index = 1
            }
        }
        else
        {
            image_index = 0;
        }

    }
}
y+=yVel
event_inherited();

