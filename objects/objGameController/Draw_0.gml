var score_string = string_replace_all(string_format(global.currentScore, 8, 0), " ", "0")
if !scoreCountup && !gameOverEnd
{
    var seconds = floor((stageTimer)/60)%60
    var minutes = floor((stageTimer)/3600)
    var seconds_format = string_replace(string_format(seconds, 2, 0), " ", "0")
    var minutes_format =  string_replace(string_format(minutes, 2, 0), " ", "0")
    var time_string = string_join("",minutes_format, ":", seconds_format)
    var halign = draw_get_halign()
    draw_set_font(fntMono)
    draw_set_halign(fa_left)
    draw_set_color(offWhite)
    draw_text(timeposX, timeposY, "TIME")
    draw_text(timeposX, timeposY+textLeading, time_string)
    draw_set_halign(fa_right)
    draw_text(scoreposX,scoreposY, "SCORE")
    draw_text(scoreposX,scoreposY+textLeading, score_string)
    draw_set_halign(halign)
    draw_set_color(c_white)
}

if paused
{
	if !surface_exists(pausedSurf)
	{
		if pausedSurf == -1
		{
			instance_deactivate_all(true);
            instance_activate_object(objCursorMenu);
            instance_activate_object(objStageController);
		}
       	pausedSurf = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
       	surface_set_target(pausedSurf);
       	draw_surface(application_surface,0,0); 
        surface_reset_target()
	}
	else
	{
		draw_surface(pausedSurf, camerax, cameray);
		draw_set_alpha(.8);
		draw_rectangle_color(camerax, cameray, camerax + cameraw, cameray + camerah, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
        draw_set_font(fntCourier);
        if !options && !areYouSure
        { 
            for( var i = 0; i < array_length(menuOptions); i++)
            {
                draw_set_color(menuGreen);
                if(i = selection)
                {
                    draw_set_color(offWhite);
                    draw_sprite(sprBubbleSmall,0, optionsX - ceil((sprite_get_width(sprBubbleSmall)/2)) - 4, optionsYStart + i *menuLeading)
                    draw_sprite(sprBubbleFaceSmall,0, optionsX - ceil((sprite_get_width(sprBubbleFaceSmall)/2)) - 4, optionsYStart + i *menuLeading)
                }
                draw_text(camerax+optionsX, cameray+optionsYStart + (i * menuLeading) ,menuOptions[i])
            }
        }
        if options
        {
            for( var i = 0; i < array_length(optionsOptions); i++)
            {
               draw_set_color(menuGreen);
               if(i = selection)
               {
                   draw_set_color(offWhite);
                   draw_sprite(sprBubbleSmall,0, optionsXOffset + optionsX - ceil((sprite_get_width(sprBubbleSmall)/2)) - 4, optionsYStart + i *menuLeading)
                   draw_sprite(sprBubbleFaceSmall,0, optionsXOffset + optionsX - ceil((sprite_get_width(sprBubbleFaceSmall)/2)) - 4, optionsYStart + i *menuLeading)
               }
               draw_text(camerax+optionsXOffset +optionsX, cameray+optionsYStart + (i * menuLeading) ,optionsOptions[i])
            }
        }
        if areYouSure
        {
            draw_set_color(offWhite);
            draw_text(optionsXOffset + optionsX,optionsYStart-menuLeading*2,"Are you sure?\n\nCurrent progress\n\nwill be lost.")
            for( var i = 0; i < array_length(aysOptions); i++)
            {
               draw_set_color(menuGreen);
               if(i = selection)
               {
                   draw_set_color(offWhite);
                   draw_sprite(sprBubbleSmall,0, aysXOffset + optionsX - ceil((sprite_get_width(sprBubbleSmall)/2)) - 4, +aysYOffset + optionsYStart + i *menuLeading)
                   draw_sprite(sprBubbleFaceSmall,0, aysXOffset + optionsX - ceil((sprite_get_width(sprBubbleFaceSmall)/2)) - 4, +aysYOffset + optionsYStart + i *menuLeading)
               }
               draw_text(camerax+aysXOffset + optionsX, cameray+aysYOffset + optionsYStart + (i * menuLeading) ,aysOptions[i])
            }
        }
	}
}

