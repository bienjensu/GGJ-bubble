var score_string = string_replace_all(string_format(global.currentScore, 8, 0), " ", "0")
if !scoreCountup && !gameOverEnd
{
    var seconds = floor((current_time - global.stage_timer)/1000)%60
    var minutes = floor((current_time - global.stage_timer)/60000)
    var seconds_format = string_replace(string_format(seconds, 2, 0), " ", "0")
    var minutes_format =  string_replace(string_format(minutes, 2, 0), " ", "0")
    var time_string = string_join("",minutes_format, ":", seconds_format)
    var halign = draw_get_halign()
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
if scoreCountup
{
    var halign = draw_get_halign()
    draw_set_color(offWhite)
    draw_set_halign(fa_right)
    draw_text(scorefinalposX,scorefinalposY, "SCORE: ")
    draw_set_halign(fa_left)
    draw_text(scorefinalposX,scorefinalposY,score_string)
    if showBonus
    {
        var bonusString = string_replace_all(string_format(bonus, 8, 0), " ", "0")
        draw_set_halign(fa_right)
        draw_text(scorefinalposX,scorefinalposY+16+textLeading, "TIME BONUS: ")
        draw_set_halign(fa_left)
        draw_text(scorefinalposX,scorefinalposY+16+textLeading,bonusString)
    }
    draw_set_halign(halign)
    draw_set_color(c_white)
}
if gameOverEnd
{
    var halign = draw_get_halign()
    draw_set_color(offWhite)
    draw_set_halign(fa_center)
    draw_text(scorefinalposX,scorefinalposX,"GAME OVER")
    draw_set_halign(fa_right)
    draw_text(scorefinalposX,scorefinalposY+16+textLeading, "SCORE: ")
    draw_set_halign(fa_left)
    draw_text(scorefinalposX,scorefinalposY+16+textLeading,score_string)
}