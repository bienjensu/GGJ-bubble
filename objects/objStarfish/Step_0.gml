if !grabbed
{
	if  shootTimer == 0 
	{
		
		if rechargeTimer >0
		{
			rechargeTimer --
			sprite_index = sprStarfishRecharging
			vulnerable = true;
			if rechargeTimer == flashTime
			{
				image_speed = flashSpeed
			}
			if rechargeTimer == 0
			{
				vulnerable = false;
				sprite_index = sprStarfish;
				image_speed = 0;
			}
		}
		var nearestBubble = instance_nearest(x,y,objBilliardsBubble)
		if point_distance(x,y,nearestBubble.x,nearestBubble.y) < targetRange
		{
			if rechargeTimer == 0
			{
				shootTimer = prefireTime;
				sprite_index = sprStarfishShoot;
			}
		}
	}
	if shootTimer > 0
	{
		shootTimer --
		if shootTimer == 0
		{
			for(i = 0; i < shotsNum; i++)
			{
			var bulletAngle = i*(360/shotsNum);
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
		var target = instance_place(x,y,objBilliardsBubble)
		if target != noone
		{
			with(target)
			{
				split()
			}
		}
	}
}
event_inherited();

