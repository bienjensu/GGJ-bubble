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
	var grabbedX = grabbedBy.x;
	var grabbedY = grabbedBy.y;
	if abs(grabbedX - x) < 1 && abs(grabbedY - y) < 1
	{
		instance_destroy()
	}
	x = lerp(x, grabbedX, 0.5/abs(grabbedX - x))
	y = lerp(y, grabbedY, 0.5/abs(grabbedY - y))
	image_xscale = min(1, (abs(grabbedX - x) + abs(grabbedY - y))*scaleMult)
	image_yscale = min(1, (abs(grabbedX - x) + abs(grabbedY - y))*scaleMult)
}