if mouse_check_button_pressed(mb_any)
{
    repeat (3) {
        bubble(x+random_range(5,-5),y+random_range(5,-5),1)
    }

}
if mouse_check_button(mb_any)
{
    birdIndex = sprCursor_click_nothing2
}
if mouse_check_button_released(mb_any)
{
    birdIndex = sprCursor_click_nothing1
}