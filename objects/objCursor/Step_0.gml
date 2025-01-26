
if mouse_check_button_pressed(mb_left)
{
    var nearestBubble = instance_nearest(x,y,objGrabbable);
    if nearestBubble != noone
    { 
        maxDist = sprite_get_width(nearestBubble.sprite_index) + hitboxBuffer;
       if point_distance(x,y,nearestBubble.x,nearestBubble.y) < maxDist
       {
            birdInst = false;
            image_alpha = 1;
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
    if instance_exists(grabbedBubble)
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
    else
    {
        grabbedBubble = noone;
    }
}
if mouse_check_button_released(mb_left) && instance_exists(grabbedBubble) //!= noone
{
    //window_mouse_set_locked(false)
    //display_mouse_set(x,y)
    image_alpha = 0;
    grabbedBubble.xVel += min(powerX*pushMult, maxPower)
    grabbedBubble.yVel += min(powerY*pushMult*multY, maxPower)
    grabbedBubble.grabbed = false;
    grabbedBubble.upForce = 0;
    grabbedBubble = noone;
    powerX = 0;
    powerY = 0;
}
if mouse_check_button(mb_right) && grabbedBubble = noone
{
    if choose(true,true,false) {
        var g = instance_create_depth(x,y,depth-2,objPBubble2)
        g.xv = random_range(-2,2)
        g.yv = random_range(-2,2)
        g.decay = random_range(20,60)
    }
    
}
if mouse_check_button_released(mb_any)
{
    birdIndex = sprCursor_click_nothing1
}
/*if window_mouse_get_locked()
{
    x+= window_mouse_get_delta_x()*sensitivity
    y+= window_mouse_get_delta_y()*sensitivity
}
else
{
    x = mouse_x
    y = mouse_y
}*/
if grabbedBubble == noone
{
    //x = mouse_x
    //y = mouse_y
    birdIdealX = x
    birdIdealY = y
    event_inherited();
    if abs(birdX - x) < 5 && abs(birdY - y) < 5
    {
        birdInst = true
    }

}



