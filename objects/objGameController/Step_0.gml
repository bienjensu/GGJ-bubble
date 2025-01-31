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
    if !options && !areYouSure
    {
        if mouse_check_button_released(mb_any)
        {
            released = true;
        }
        for( var i = 0; i < array_length(menuOptions); i++)
        {
            if objCursorMenu.y > cameray+optionsYStart + (i*menuLeading) - hitboxUp && objCursorMenu.y < cameray + optionsYStart + (i*menuLeading) + hitboxDown
            {
                if selection != i
                {
                    audio_stop_sound(Sndtally)
                    audio_play_sound(Sndtally,0,0,0.3,0.01)
                }
                selection = i;
                break;
            }
        }
        if mouse_check_button_pressed(mb_any) && selection != -1 && released
        {
            audio_play_sound(snd2click,1,0);
            released = false
            switch selection{
                case 0:
                    unPause()
                    objCursor.sensitivity = global.sensitivity*0.1+0.1;
                break;
                case 1:
                    options = true;
                    selection = -1;
                break;
                case 2:
                    areYouSure = true;
                    selection = -1;
            }
        }
    }
    if options
    {
        if mouse_check_button_released(mb_any)
        {
            released = true;
        }
        for( var i = 0; i < array_length(optionsOptions); i++)
        {
            if objCursorMenu.y > cameray+optionsYStart + (i*menuLeading) - hitboxUp && objCursorMenu.y < cameray + optionsYStart + (i*menuLeading) + hitboxDown
            {
                if selection != i
                {
                    audio_stop_sound(Sndtally)
                    audio_play_sound(Sndtally,0,0,0.3,0.01)
                }
                selection = i;
                break;
            }
        }
        if mouse_check_button_pressed(mb_any) && selection != -1 && released
        {
            audio_play_sound(snd2click,1,0);
            released = false;
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
                    save()
                    options = false;
                    selection = -1;
            }
        }
    }
    if areYouSure
    {
        if mouse_check_button_released(mb_any)
        {
            released = true;
        }
        for( var i = 0; i < array_length(aysOptions); i++)
        {
            if objCursorMenu.y > cameray+aysYOffset + optionsYStart + (i*menuLeading) - hitboxUp && objCursorMenu.y < cameray + +aysYOffset + optionsYStart + (i*menuLeading) + hitboxDown
            {
                if selection != i
                {
                    audio_stop_sound(Sndtally)
                    audio_play_sound(Sndtally,0,0,0.3,0.01)
                }
                selection = i;
                break;
            }
        }
        if mouse_check_button_pressed(mb_any) && selection != -1 && released
        {
            audio_play_sound(snd2click,1,0);
            released = false;
            switch selection{
                case 0:
                    room_goto(rmMenu);
                break;
                case 1:
                    areYouSure = false;
            }
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

if gameOverEnd
{
        if global.currentScore > global.highScore
    {
        highScore = true;
    }
    if scoreTimer > 0
    {
        scoreTimer --
        if scoreTimer == 0
        {
            showHighScore = true;
            showHighScoreTimer = showHighScoreTimerMax;
            
        }
        if scoreTimer == floor(scoreTimerMax/2)
        {
            showScore = true;
        }
    }
    if showHighScoreTimer > 0
    {
        showHighScoreTimer --
        if showHighScoreTimer == 0
        {
            highScoreCountup = true;
        }
    }
    if highScoreCountup
    { 
        if global.highScore < global.currentScore
        { 
            global.highScore += min(10,global.currentScore-global.highScore)
            audio_stop_sound(Sndtally)
            audio_play_sound(Sndtally,0,0,0.3,0.01)
            if global.highScore == global.currentScore
            {
                 showScoreEndTimer = showScoreEndTimerMax;
            }
        }
        if !highScore
        {
            showScoreEndTimer = showScoreEndTimerMax;
        }
    }
    if showScoreEndTimer >0
    {
        showScoreEndTimer --
        if showScoreEndTimer == 0
        {
            showEndMessage = true;
        }
    }
    if showEndMessage && mouse_check_button_pressed(mb_any)
    {
        global.currentScore = 0;
        save()
        room_goto(rmMenu)
    }
}