
x+=xVel
y+=yVel
if abs(x-xstart) > 2 || abs(y-ystart) > 2
{
    var player = instance_create_layer(x,y, "Instances", objBubble)
    player.xVel = xVel
    player.yVel = yVel
    instance_destroy()
}