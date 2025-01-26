if !grabbed
{
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
        if choose(true,false) {
            var bub = bubble(x,y+10,1,random(100))
            bub.x = x
            bub.yv = random(-1.5)
        }
        
        
        
         if yVel > 0
         {
           falling = true
           sprite_index = sprBelemFall
            repeat 9 {
                bubble(x+shake(10),y+10,1,random(100))
            }
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
                audio_play_sound(Sndswush,0,0,0.5)
                repeat 24 {
                    bubble(x,y+20)
                }
               sprite_index = sprBelemPeek
               image_index = 0;
           }
       }
       else if instance_exists(objBubble)
       {
           var nearestBubble = instance_nearest(x,y,objBubble);
           if abs(x - nearestBubble.x) < peekDistX && y - nearestBubble.y < peekDistY && y - nearestBubble.y >0
           {
               minJumpTimer ++
               if abs(x - nearestBubble.x) < jumpDist && minJumpTimer > minJumpTime
               {
                   image_index = 2;
                    repeat 24 {
                        var b = bubble(x+shake(10),y+10)
                        b.yv = random(-0.5)
                    }
                    audio_play_sound(Sndsludgy,0,0,0.5)
                   jumpTimer = frameRate;
                   grounded = false;
                   yVel -= jumpSpeed;
                   minJumpTimer = 0;
               }
               else
               {
                   image_index = 1
                
               }
           }
           else
           {
               minJumpTimer = 0;
               image_index = 0;
           }
   
       }
   }
    if (instance_place(x, y, objBubble)) 
    {   
        var i = instance_place(x, y, objBubble)
        if i != noone && !grounded && yVel > -0.2 {
        if i.y > y+4 {
            vulnerable = true
        } else {
            vulnerable = false
            i.split()
        }
        } else {
            i.split()
        }
    }
}
y+=yVel
event_inherited();

