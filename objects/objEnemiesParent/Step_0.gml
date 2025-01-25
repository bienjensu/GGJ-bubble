event_inherited();

if vulnerable && !grabbed
{
	grabbedBy = instance_place(x,y,objBilliardsBubble);
	if grabbedBy != noone
	{
		grabbed = true;
		//image_index = suckSprite
	}
}
if grabbed
{
	if instance_exists(grabbedBy)
	{
		var grabbedX = grabbedBy.x;
		var grabbedY = grabbedBy.y;
		if abs(grabbedX - x) < 4 && abs(grabbedY - y) < 4
		{
			instance_destroy()
		}
		suckTimer++
		x = lerp(x, grabbedX, suckSpeed*suckTimer)
		y = lerp(y, grabbedY, suckSpeed*suckTimer)
		image_xscale = min(1, (abs(grabbedX - x) + abs(grabbedY - y) - 4)*scaleMult)
		image_yscale = min(1, (abs(grabbedX - x) + abs(grabbedY - y) - 4)*scaleMult)
	}
}