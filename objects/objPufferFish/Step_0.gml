if !grabbed
{
    x = xstart + lengthdir_x(moveRadius, moveTimer * speedRatio)
    y = ystart + lengthdir_y(moveRadius, moveTimer * speedRatio)
    moveTimer = (moveTimer * speedRatio % 360)/speedRatio;
    show_debug_message("{0} | {1} | {2}",puffTimer, beginPuffTimer, pufft)
    if beginPuffTimer > 0
    { 
        beginPuffTimer --
        if beginPuffTimer == 0
        {
            pufft = !pufft
           
            if pufft
            {   
                puffTimer = 4*frameRate;
                sprite_index = sprPufferBlowup 
                image_index = 0;
            }
            else
            {
                vulnerable = true;
                 puffTimer = frameRate;
                sprite_index = sprPufferBlowdown   
            }
        }
    }
    if puffTimer > 0
    {
        puffTimer --
        if puffTimer == frameRate
        {
            image_index ++
        }
        if puffTimer == 0
        {
            beginPuffTimer = puffTime;
            if pufft
            {
                vulnerable = false;
                sprite_index = sprPufferRealisticDepictionOfAPanicAttack
            }
            else
            {
                sprite_index = sprPufferfish    
            }
        }
    }
    moveTimer ++;
    if !vulnerable
    {
        var target = instance_place(x,y,objBubble)
		if target != noone
		{
			target.split()
		}
    }
}
event_inherited()