if !otherMenu
{
    for( var i = 0; i < array_length(menuOptions); i++)
    {
        if objCursorMenu.y > menuYStart + (i*textLeading) - hitboxUp && objCursorMenu.y < menuYStart + (i*textLeading) + hitboxDown
        {
            selection = i;
            break;
        }
    }
    if mouse_check_button_pressed(mb_any) && selection != -1
    {
        menuOptions[selection].action = true;
        otherMenu = true
        released = false;
        
    }
}
if menuOptions[0].action = true
{
    room_goto(global.roomsOrder[0])
}
if menuOptions[1].action = true
{
    for( var i = 0; i < array_length(optionsOptions); i++)
    {
        if objCursorMenu.y > menuYStart + (i*textLeading) - hitboxUp && objCursorMenu.y < menuYStart + (i*textLeading) + hitboxDown
        {
            selection = i;
            break;
        }
    }
    if mouse_check_button_released(mb_any)
    {
        released = true;
    }
    if mouse_check_button_pressed(mb_any) && selection != -1 && released
    {
        switch selection{
            case 0:
                global.lockMouse = !global.lockMouse;
                window_mouse_set_locked(global.lockMouse)
                optionsOptions[0] = "Lock mouse : " + boolToString(global.lockMouse);
            break;
            case 1:
                global.fullScreen = !global.fullScreen
                window_set_fullscreen(global.fullScreen)
                optionsOptions[1] = "Fullscreen : " + boolToString(global.fullScreen)
            break;
            case 2:
                global.sensitivity = ((global.sensitivity + (mouse_check_button_pressed(mb_left) - mouse_check_button_pressed(mb_right))) + 10) % 10;
                objCursorMenu.sensitivity = global.sensitivity * 0.1 + 0.1;
                optionsOptions[2] = "Sensitivity : " + string(global.sensitivity+1);
            break;
            case 3:
                menuOptions[1].action = false;
                otherMenu = false;
                selection = -1;
        }
    }
}
if menuOptions[2].action = true
{
    if mouse_check_button_released(mb_any)
    {
        released = true;
    }
    if mouse_check_button_pressed(mb_any) && released
    {
        menuOptions[2].action = false
        otherMenu = false;
        selection = -1
    }
}