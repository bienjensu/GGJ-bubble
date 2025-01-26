
draw_text(10, 10, time_string)
halign = draw_get_halign()
draw_set_halign(fa_right)
draw_text(310,10, score_string)
if showBonus
{
    var bonusString = "time bonus: " + string(bonus)
    draw_text(310,20,bonusString)
}
draw_set_halign(halign)
