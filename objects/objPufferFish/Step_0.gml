if !grabbed {
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
                audio_play_sound(Sndsqik,0,0,0.3)
            }
            else
            {
                vulnerable = true;
                 puffTimer = frameRate;
                sprite_index = sprPufferBlowdown   
                repeat 24 {
                    bubble(x+shake(10),y+shake(10),1)
                }
                audio_stop_sound(hissSound)
                audio_play_sound(sndSqueakOut,0,0,0.2,0,1.3)
            }
        }
    }
    if puffTimer > 0
    {
        puffTimer --
        if puffTimer == frameRate
        {
            image_index ++
            audio_play_sound(sndSqueakIn,0,0,0.2,0,1.2)
        }
        if puffTimer == 0
        {
            
            beginPuffTimer = puffTime;
            if pufft
            {
                audio_play_sound(snd2click,0,0,0.5)
                if !audio_is_playing(sndHiss) {
                    hissSound = audio_play_sound(sndHiss,-1,true,0.2)
                }
                
                vulnerable = false;
                repeat 6 {
                    bubble(x+shake(10),y+shake(10))
                }
                sprite_index = sprPufferRealisticDepictionOfAPanicAttack
            }
            else
            {
                sprite_index = sprPufferfish    
            }
        }
    }
    moveTimer += mtSpeed;
    
    if !vulnerable
    {
        mtSpeed = 0.5 
        var target = instance_place(x,y,objBubble)
		if target != noone
		{
			target.split()
		}
    } else {
        mtSpeed = 1
        var g = moveTimer * speedRatio
        if g < 180 {
            image_xscale = -1
        } else { 
            image_xscale = 1
        }
    }
}
event_inherited()