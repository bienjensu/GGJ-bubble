if !grounded
{
    yVel += decelRate;
    yVel = min(yVel, fallSpeed);
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
        var nearestBubble = instance_nearest(x,y,objBilliardsBubble);
        if point_distance(x,y,nearestBubble.x,nearestBubble.y)
        {
            
        }
        
    }
}
y+=yVel
event_inherited();

