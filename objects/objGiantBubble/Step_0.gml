var target = instance_nearest(hx,hy,objBubble)
var tdir = point_direction(hx,hy,target.x,target.y)
if pushTimeR == 0
{
	dashing = false
    
	if target != noone
	{
		if t2 == dashVolley && dashT == -1 {
            dashT = dashTimer
            dashDirection = tdir
            xVel = 0
            yVel = 0
        } else {
            xVel = lengthdir_x(moveSpeed, tdir);
            yVel = lengthdir_y(moveSpeed, tdir);
            pushTimeR = pushTime;
            t2 ++;
        }
		
	}
	
}

if dashT >= 0 {
    dashT --
    cha = 1
    xVel =lerp(xVel,lengthdir_x(1, -dashDirection),0.)
    yVel = lerp(yVel,lengthdir_y(1, -dashDirection),0.1)
    show_debug_message(":0")
    
} else {
    pushTimeR--
}
 if dashT == 0 {
    dashing = true
    show_debug_message("dash time")
    cha = 0
    dashT = -1
    xVel = lengthdir_x(dashSpeed, dashDirection);
    yVel = lengthdir_y(dashSpeed, dashDirection);
    t2 = 0;
    pushTimeR = pushTime + 50
}

xVel = lerp(xVel, 0, speedFalloff);
yVel = lerp(yVel, 0, speedFalloff);
hx+=xVel;
hy+=yVel;
if hy > 0
{
	onscreen = true;
}
if onscreen
{
	event_inherited()
}
var target = instance_place(hx,hy,objBubble)
if target != "noone"
{
	with(target)
	{
		split()
	}
}

t++