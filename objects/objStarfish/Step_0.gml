var nearestBubble = instance_nearest(x,y,objBilliardsBubble)
if point_distance(x,y,nearestBubble.x,nearestBubble.y) < targetRange
{
	if shootTimer = 0
	{
		shootTimer = prefireTime
	}
}
if shootTimer > 0
{
	shootTimer --
	if shootTimer == 0
	{
		for i = 0; i < shotsNum; i++
		{
		var bulletAngle = i*(360/shotsNum);
		var bulletX = lengthdir_x(sprite_width/2, bulletAngle)
		var bulletY = lengthdir_y(sprite_width/2, bulletAngle)
		instance_create_depth(bulletX, bulletY, bulletDepth, objStarfishBullet)
		{
	}
}
event_inherited();

