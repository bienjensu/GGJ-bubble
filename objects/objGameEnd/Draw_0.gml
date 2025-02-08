var score_string = string_replace_all(string_format(global.currentScore, 8, 0), " ", "0")
var highscore_string = string_replace_all(string_format(global.highScore, 8, 0), " ", "0")
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

if gameOverEnd
{
    var halign = draw_get_halign()
    draw_set_font(fntCourier)
    draw_set_color(offWhite)
    draw_set_halign(fa_right)
    draw_text(scorefinalposX,gameoverPosY,"CONGRAT")
    draw_set_halign(fa_left)
    draw_text(scorefinalposX,gameoverPosY,"ULATIONS")
    if showScore
    {
        draw_set_halign(fa_right)
        draw_text(scorefinalposX,scorefinalposY+menuLeading*2, "SCORE: ")
        draw_set_halign(fa_left)
        draw_text(scorefinalposX,scorefinalposY+menuLeading*2,score_string)
    }
    if showHighScore
    {
        if highScore && highScoreCountup
        {
            draw_set_halign(fa_center)
            draw_text(scorefinalposX, scorefinalposY+menuLeading*4, "NEW HIGH SCORE!")
        }
        draw_set_halign(fa_right)
        draw_text(scorefinalposX,scorefinalposY+menuLeading*3, "HIGHSCORE: ")
        draw_set_halign(fa_left)
        draw_text(scorefinalposX,scorefinalposY+menuLeading*3,highscore_string)
    }
    if showEndMessage
    {
        draw_set_halign(fa_center)
        draw_text(scorefinalposX, scorefinalposY+menuLeading*(5+highScore), "CLICK TO RETURN TO MENU")
    }
}