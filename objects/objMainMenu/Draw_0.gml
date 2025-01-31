draw_sprite(sprLogo,0, logoX,logoY)
draw_set_valign(fa_middle);
draw_set_font(fntCourier)
if !otherMenu
{
    draw_set_halign(fa_center);
    draw_text(scoreX,scoreY,"Highscore : "+ string_replace_all(string_format(global.currentScore, 8, 0), " ", "0"))
    draw_set_halign(fa_left);
    for( var i = 0; i < array_length(menuOptions); i++)
    {
        draw_set_color(menuGreen);
        if(i = selection)
        {
            draw_set_color(offWhite);
            draw_sprite(sprBubbleSmall,0, menuX - ceil((sprite_get_width(sprBubbleSmall)/2)) - 4, menuYStart + i *textLeading)
            draw_sprite(sprBubbleFaceSmall,0, menuX - ceil((sprite_get_width(sprBubbleFaceSmall)/2)) - 4, menuYStart + i *textLeading)
        }
        draw_text(menuX, menuYStart + (i * textLeading) ,menuOptions[i].name)
    }
}
if menuOptions[1].action
{
    for( var i = 0; i < array_length(optionsOptions); i++)
    {
        draw_set_color(menuGreen);
        if(i = selection)
        {
            draw_set_color(offWhite);
            draw_sprite(sprBubbleSmall,0, optionsX - ceil((sprite_get_width(sprBubbleSmall)/2)) - 4, optionsYStart + i *textLeading)
            draw_sprite(sprBubbleFaceSmall,0, optionsX - ceil((sprite_get_width(sprBubbleFaceSmall)/2)) - 4, optionsYStart + i *textLeading)
        }
        draw_text(optionsX, optionsYStart + (i * textLeading) ,optionsOptions[i])
    }
}
if menuOptions[2].action
{
    for( var i = 0; i < array_length(credits); i++)
    {
        draw_set_color(offWhite);
        draw_text(creditsX, creditsYStart + (i * textLeading) ,credits[i].name)
        draw_set_color(menuGreen);
        draw_text(creditsX + 16 + creditsOffset, creditsYStart + i * textLeading + (textLeading/2) ,credits[i].credit)
    }
   // draw_text(creditsX, creditsYStart + (array_length(credits) * textLeading) ,"Click to return")
}

draw_set_color(c_white);