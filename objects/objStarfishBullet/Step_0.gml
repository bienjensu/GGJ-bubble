
var target = instance_place(x,y,objBilliardsBubble)
if target != "noone"
{
	with(target)
	{
		split()
	}
}

x = lerp(x, maxDistX, .1);
y = lerp(y, maxDistY, .1);
killTimer ++
if killTimer > killTimeMax
{
	instance_destroy()
}