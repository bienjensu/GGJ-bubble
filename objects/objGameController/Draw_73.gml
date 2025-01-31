var score_string = string_replace_all(string_format(global.currentScore, 8, 0), " ", "0")
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