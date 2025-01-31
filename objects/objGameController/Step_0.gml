if keyboard_check_pressed(vk_escape) && !objStageController.win && !objStageController.prePhase
{
    unPause()
}
if keyboard_check_pressed(vk_f11)
{
    window_mouse_set_locked(!window_mouse_get_locked())
}
if keyboard_check_pressed(ord(1))
{
    window_set_size(640/2,480/2)
}
if keyboard_check_pressed(ord(2))
{
    window_set_size(640,480)
}
if keyboard_check_pressed(ord(3))
{
    window_set_size(640*2,480*2)
}
if paused
{
    for( var i = 0; i < array_length(menuOptions); i++)
    {
        if objCursorMenu.y > cameray+optionsYStart + (i*menuLeading) - hitboxUp && objCursorMenu.y < cameray + optionsYStart + (i*menuLeading) + hitboxDown
        {
            selection = i;
            break;
        }
    }
    if mouse_check_button_pressed(mb_any) && selection != -1
    {
        switch selection{
            case 0:
                unPause()
                objCursor.sensitivity = global.sensitivity*0.1+0.1;
            break;
            case 1:
                global.lockMouse = !global.lockMouse;
                window_mouse_set_locked(global.lockMouse)
                menuOptions[1] = "Lock mouse : " + boolToString(global.lockMouse);
            break;
            case 2:
                global.fullScreen = !global.fullScreen
                window_set_fullscreen(global.fullScreen)
                menuOptions[2] = "Fullscreen : " + boolToString(global.fullScreen)
            break;
            case 3:
                global.sensitivity = ((global.sensitivity + (mouse_check_button_pressed(mb_left) - mouse_check_button_pressed(mb_right))) + 10) % 10;
                objCursorMenu.sensitivity = global.sensitivity * 0.1 + 0.1;
                menuOptions[3] = "Sensitivity : " + string(global.sensitivity+1);
            break;
            case 4:
                room_goto(rmMenu)
        }
    }
}
else
{
    if stageTimer == 30000 && !objStageController.tutorial
    {
        spawned = true
        instance_create_depth(giantSpawnX, giantSpawnY, -90, objGiantBubble);
    }
    
    if !scoreCountup
    {
        bonus --
        bonus = clamp(bonus, 1, 1000000)
        if random(50) < 1 {
        instance_create_depth(random(room_width),random(room_height),depth-1,objPBubble)
        }
    }
    else
    {
        if preScoreTimer > 0
        {
            preScoreTimer --
            if preScoreTimer == 0
            {
                showBonus = true;
                showScoreTimer = showScoreTimeMax;
            }
        }
        if showScoreTimer > 0
        {
            showScoreTimer --
            if showScoreTimer == 0
            {
                beginBonusCount = true;
            }
        }
        if beginBonusCount && bonus > 0
        {
            global.currentScore += min(bonus,10)
            bonus -= min(bonus,10)
            audio_stop_sound(Sndtally)
            audio_play_sound(Sndtally,0,0,0.3,0.01)
            if bonus == 0
            {
                postScoreTimer = postScoreTimeMax;
                audio_play_sound(Sndpowerup,0,0,0.4)
            }
        }
        if postScoreTimer > 0
        {
            postScoreTimer --
            if postScoreTimer == 0
            {
                //showBonus = false;
                objStageController.beginEnd = true;
            }
        }
    }
    if !objStageController.win && !objStageController.prePhase && !paused
    {
        stageTimer ++
    }
}