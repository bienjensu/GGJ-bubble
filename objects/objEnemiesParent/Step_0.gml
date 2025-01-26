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
        if ft == 0 {
            grabbedBy.faceframe = frames.MOUTH1
            if object_index == objKrill {
                audio_play_sound(Sndscoot,0,0,0.3,0,random_range(0.8,1.2))
            } else {
                audio_play_sound(sndwurr,0,0,0.3,0,random_range(0.8,1.2))
            }
                
        }
        if ft == 5 {
            grabbedBy.faceframe = frames.MOUTH2
              
        }
		var grabbedX = grabbedBy.x;
		var grabbedY = grabbedBy.y;
		if ft > 20 && abs(grabbedX - x) < 4 && abs(grabbedY - y) < 4 || ft > 40
            
		{
            if object_index == objKrill {
                audio_play_sound(Sndsqik,0,0,0,0,random_range(0.8,1.2))
                audio_play_sound(sndSligg,0,0,0.3,0.2,1.1)
                repeat 5 {
                    var b = bubble(x,y,0.3)
                }
            } else {
                
                audio_play_sound(sndSligg,0,0,0.3,0,random_range(0.5,1))
                repeat 16 {
                    var b = bubble(x,y,0.3)
                }
            }
            grabbedBy.faceframe = frames.CHOMP
            grabbedBy.chompTimer = 20
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