
if mouse_check_button_pressed(mb_left)
{
    var nearestBubble = instance_nearest(x,y,objGrabbable);
    if nearestBubble != noone
    { 
        maxDist = sprite_get_width(nearestBubble.sprite_index) + hitboxBuffer;
       if point_distance(x,y,nearestBubble.x,nearestBubble.y) < maxDist
       {
            birdIndex = sprCursor_click_grab
            //window_mouse_set_locked(true)
            grabbedBubble = nearestBubble;
            grabbedBubble.grabbed = true;
       }
    }
    else
    {
        birdIndex = sprCursor_click_nothing2;   
    }
}
if mouse_check_button(mb_left)
{
    if grabbedBubble != noone
    {
        
        //x+= window_mouse_get_delta_x()*sensitivity
        //y+= window_mouse_get_delta_y()*sensitivity
        powerX = (grabbedBubble.x - x)*moveMult
        powerY = (grabbedBubble.y - y)*moveMult
        if abs(powerX) > maxDist
        { 
            powerX = lerp(powerX, maxDist*sign(powerX), falloffRate)
        }
        if abs(powerY) > maxDist
        {
            powerY = lerp(powerY, maxDist*sign(powerY), falloffRate)
        }
        birdIdealX = grabbedBubble.x - powerX
        birdIdealY = grabbedBubble.y - powerY
    }
}
if mouse_check_button_released(mb_left) && grabbedBubble != noone
{
    //window_mouse_set_locked(false)
    //display_mouse_set(x,y)
    grabbedBubble.xVel += min(powerX*pushMult, maxPower)
    grabbedBubble.yVel += min(powerY*pushMult*multY, maxPower)
    grabbedBubble.grabbed = false;
    grabbedBubble.upForce = 0;
    grabbedBubble = noone;
    powerX = 0;
    powerY = 0;
}
if mouse_check_button_pressed(mb_right) && grabbedBubble = noone
{
    birdIndex = sprCursor_blow
}
if mouse_check_button_released(mb_any)
{
    birdIndex = sprCursor_click_nothing1
}
x+= window_mouse_get_delta_x()*sensitivity
y+= window_mouse_get_delta_y()*sensitivity
if grabbedBubble == noone
{
    //x = mouse_x
    //y = mouse_y
    birdIdealX = x
    birdIdealY = y
    event_inherited();
}
birdX = lerp(birdX, birdIdealX, birdSpeed)
birdY = lerp(birdY, birdIdealY, birdSpeed)

