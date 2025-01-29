
x+=xVel
y+=yVel
if abs(x-xstart) > moveThreshold || abs(y-ystart) > moveThreshold
{
    var player = instance_create_layer(x,y, "Instances", objBubble)
    player.xVel = xVel
    player.yVel = yVel
    instance_destroy()
    repeat (10)
    {
        bubble(x+shake(10),y+shake(10),1) 
    }
}
xVel = lerp(xVel, 0, resetRate)
yVel = lerp(yVel, 0, resetRate)
x = lerp(x,xstart,resetRate)
y = lerp(y,ystart,resetRate)