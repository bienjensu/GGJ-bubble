if prePhase
{
    draw_set_alpha(fadeInTimer/fadeInTimerMax);
    draw_set_color(c_black);
    gpu_set_depth(-100);
    draw_rectangle(0,0,room_width, room_height,false);
    gpu_set_depth(-101);
    draw_set_alpha(1);
    for (var i = 0; i < array_length(global.totalBubbles); i++)
        {
            for (var j = 0 ; j < global.totalBubbles[i]; j++)
            {
                var drawSprite = "" 
                switch 3-i
                {
           			case 3: drawSprite = sprBubbleLarge
           			break;
           			case 2: drawSprite = sprBubbleMedium
           			break;
           			case 1: drawSprite = sprBubbleSmall
           			break; 
                }
                draw_sprite(drawSprite, 0, spawnX, spawnY)
            }
        }
    draw_set_color(c_white)
    var halign = draw_get_halign()
    draw_set_halign(fa_center)
    draw_set_font(fntCourier)
    draw_set_color(offWhite)
    draw_text(readyTextX,readyTextY,"GET READY..!")
    draw_set_halign(halign)
    
}
if win
{
    if !surface_exists(endSurf)
	{
		if endSurf == -1
		{
            objCursor.grabbedBubble = noone;
			instance_deactivate_all(true);
            instance_activate_object(objGameController);
            instance_activate_object(objCursor);
		}
	   endSurf = surface_create(surface_get_width(application_surface), surface_get_width(application_surface));
	   surface_set_target(endSurf);
	   draw_surface(application_surface,0,0);
	   surface_reset_target();
	}
	else
	{
        draw_surface(endSurf, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
        draw_set_alpha(1-fadeTimer/fadeTimerMax);
        draw_set_color(c_black);
        gpu_set_depth(-100);
        draw_rectangle(0,0,room_width, room_height,false);
        gpu_set_depth(-101);
        draw_set_alpha(1);
        if endTimer % 8 < 4
        {
            for (var i = 0; i < array_length(bubblesPos); i++)
            {
                var drawSprite = ""
                switch bubblesPos[i].bubbleSize 
                {
            			case 3: drawSprite = sprBubbleLarge
            			break;
            			case 2: drawSprite = sprBubbleMedium
            			break;
            			case 1: drawSprite = sprBubbleSmall
            			break; 
                }
                draw_sprite(drawSprite, 0, bubblesPos[i].x,bubblesPos[i].y);
            }
        }
        else
        {
           for (var i = 0; i < array_length(global.totalBubbles); i++)
            {
                for (var j = 0 ; j < global.totalBubbles[i]; j++)
                {
                    var drawSprite = "" 
                    switch 3-i
                    { 
                        case 3: drawSprite = sprBubbleLarge 
                        break; 
                        case 2: drawSprite = sprBubbleMedium 
                        break; 
                        case 1: drawSprite = sprBubbleSmall 
                        break; 
                    }
                    draw_sprite(drawSprite, 0, spawnX, spawnY)
                    }
                }
        }
    }
}
if gameOver
{
    if !surface_exists(endSurf)
	{
		if endSurf == -1
		{
            objCursor.grabbedBubble = noone;
			instance_deactivate_all(true);
            instance_activate_object(objGameController);
            instance_activate_object(objCursor);
		}
	   endSurf = surface_create(surface_get_width(application_surface), surface_get_width(application_surface));
	   surface_set_target(endSurf);
	   draw_surface(application_surface,0,0);
	   surface_reset_target();
	}
	else
	{
        draw_surface(endSurf, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
        draw_set_alpha(1-fadeTimer/fadeTimerMax);
        draw_set_color(c_black);
        gpu_set_depth(-100);
        draw_rectangle(0,0,room_width, room_height,false);
        gpu_set_depth(-101);
        draw_set_alpha(1);
    }
}
gpu_set_depth(0);
draw_set_color(c_white);