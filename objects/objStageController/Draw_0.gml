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
}
if win
{
    
    draw_set_alpha(fadeTimer/fadeTimerMax);
    draw_set_color(c_black);
    gpu_set_depth(-100);
    draw_rectangle(0,0,room_width, room_height,false);
    gpu_set_depth(-101);
    draw_set_alpha(1);
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

draw_set_color(c_white);