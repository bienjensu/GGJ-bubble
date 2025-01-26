if !grabbed
{
	if  shootTimer == 0 
	{
		
		if rechargeTimer >0
		{
			rechargeTimer --
			if rechargeTimer == rechargeTimeMax - postfireTime
			{
				sprite_index = sprStarfishVulnerable
				vulnerable = true;
			}

			if rechargeTimer == flashTime
			{
                audio_play_sound(Sndflit,0,0,0.6)
				sprite_index = sprStarfishRecharging
			}
			if rechargeTimer == 0
			{
				vulnerable = false;
				sprite_index = sprStarfishIdle;
			}
		}
		var nearestBubble = instance_nearest(x,y,objBubble)
        if nearestBubble != noone
        {
      		if point_distance(x,y,nearestBubble.x,nearestBubble.y) < targetRange
      		{
      			if rechargeTimer == 0
      			{
      				shootTimer = prefireTime;
                    audio_play_sound(Sndstarfish_Explo,0,0,0.6)
      				sprite_index = sprStarfishPrefire;
                    repeat 6 {
                    bubble(x+shake(20),y+shake(10),1)
                    }
      			}
      		}
        }
	}
	if shootTimer > 0
	{
		shootTimer --
		if shootTimer == 0
		{
			sprite_index = sprStarfishShoot;
            audio_play_sound(Sndstarfish,0,0,0.6)
            repeat 32 {
                var b = bubble(x+shake(20),y+shake(10),1)
                b.yv = random_range(-1,1)
            }
			for(i = 0; i < shotsNum; i++)
			{
			var bulletAngle = i*(360/shotsNum) + 90;
			var bulletX = x + lengthdir_x(sprite_width/2, bulletAngle);
			var bulletY = y + lengthdir_y(sprite_width/2, bulletAngle);
			var bullet = instance_create_depth(bulletX, bulletY, bulletDepth, objStarfishBullet);
			//bullet.xVel = lengthdir_x(bullet.shotSpeed, bulletAngle);
			//bullet.yVel = lengthdir_y(bullet.shotSpeed, bulletAngle);
			bullet.image_angle = bulletAngle;
			bullet.maxDistX = x + lengthdir_x(bullet.maxDist, bulletAngle)
			bullet.maxDistY = y + lengthdir_y(bullet.maxDist, bulletAngle)
			}
			rechargeTimer = rechargeTimeMax;
		}
	}
	if rechargeTimer == 0
	{
		var target = instance_place(x,y,objBubble)
		if target != noone
		{
			target.split()
		}
	}
}
event_inherited();

