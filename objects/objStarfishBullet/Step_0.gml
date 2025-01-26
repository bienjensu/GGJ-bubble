
var target = instance_place(x,y,objBubble)
if target != noone && killTimer < killTimeFlash 
{
	target.split()
}

x = lerp(x, maxDistX, 0.05);
y = lerp(y, maxDistY, 0.05);
killTimer ++
if killTimer > killTimeMax
{
	instance_destroy()
}