var score_string = string_replace_all(string_format(global.currentScore, 8, 0), " ", "0")
if !scoreCountup
{
    var seconds = round(current_time/1000)%60
    var minutes = round(current_time/60000)
    var seconds_format = string_replace(string_format(seconds, 2, 0), " ", "0")
    var minutes_format =  string_replace(string_format(minutes, 2, 0), " ", "0")
    var time_string = string_join("",minutes_format, ":", seconds_format)
    var halign = draw_get_halign()
    draw_set_halign(fa_left)
    draw_text(timeposX, timeposY, "TIME")
    draw_text(timeposX, timeposY+textLeading, time_string)
    draw_set_halign(fa_right)
    draw_text(scoreposX,scoreposY, "SCORE")
    draw_text(scoreposX,scoreposY+textLeading, score_string)
    draw_set_halign(halign)
}
if scoreCountup
{
    var halign = draw_get_halign()
    draw_set_halign(fa_right)
    draw_text(scorefinalposX,scorefinalposY, "score: ")
    draw_set_halign(fa_left)
    draw_text(scorefinalposX,scorefinalposY,score_string)
    if showBonus
    {
        var bonusString = string_replace_all(string_format(bonus, 8, 0), " ", "0")
        draw_set_halign(fa_right)
        draw_text(scorefinalposX,scorefinalposY+16+textLeading, "time bonus: ")
        draw_set_halign(fa_left)
        draw_text(scorefinalposX,scorefinalposY+16+textLeading,bonusString)
    }
    draw_set_halign(halign)
}
