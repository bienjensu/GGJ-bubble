event_inherited();

if vulnerable && !grabbed
{
	grabbedBy = instance_place(x,y,objBubble);
	if grabbedBy != noone
	{
		grabbed = true;
		//image_index = suckSprite
	}
}
if grabbed
{
	if instance_exists(grabbedBy) && grabbedBy.invulnTimeR == 0
	{
		var grabbedX = grabbedBy.x;
		var grabbedY = grabbedBy.y;
		if abs(grabbedX - x) < 4 && abs(grabbedY - y) < 4 || ft > 20
		{
            repeat 6 {
                var b = bubble(x,y,0.3)
            }
			instance_destroy()
		}
		suckTimer++
		x = lerp(x, grabbedX, suckSpeed*suckTimer)
		y = lerp(y, grabbedY, suckSpeed*suckTimer)
		//image_xscale = min(1, (abs(grabbedX - x) + abs(grabbedY - y) - 4)*scaleMult)
		//image_yscale = min(1, (abs(grabbedX - x) + abs(grabbedY - y) - 4)*scaleMult)
        image_xscale = 0.75
        image_yscale = 0.75
	}
	else
    {
        image_xscale = 1;
        image_yscale = 1;
        grabbed = false;
    }
    ft++
}