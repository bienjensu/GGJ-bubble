var score_string = string_replace_all(string_format(global.currentScore, 8, 0), " ", "0")
var highscore_string = string_replace_all(string_format(global.highScore, 8, 0), " ", "0")
if scoreCountup
{
    draw_set_font(fntCourier)
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
    draw_set_font(fntCourier)
    draw_set_color(offWhite)
    draw_set_halign(fa_right)
    draw_text(scorefinalposX,gameoverPosY,"GAME ")
    draw_set_halign(fa_left)
    draw_text(scorefinalposX,gameoverPosY,"OVER")
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