if !gameOver
{
    if mouse_check_button_pressed(mb_any)
    {
        gameOver = true;
        fadeTimer = fadeTimerMax;
    }
}

if gameOver
{
    if fadeTimer > 0
    {
        fadeTimer --
    }
    else {
        beginEnd = true
        endTimer = endTimerMax
    }
    if endTimer > 0
    {
        endTimer --    
    }
    else
    {
        gameOverEnd = true;
        scoreTimer = scoreTimerMax;
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
            audio_play_sound(Sndtally,0,0,0.3,0.01)
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
        /*if global.highScore < global.currentScore
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
        }*/

        if showScoreEndTimer == -1
        {
            if highScore
            {
                global.highScore = global.currentScore;
                save()
                showScoreEndTimer = showHighScoreTimerMax;
            }
            else
            {
            showScoreEndTimer = 1;
            }
            audio_play_sound(Sndtally,0,0,0.3,0.01)
            
        }
    }
    if showScoreEndTimer >0
    {
        showScoreEndTimer --
        if showScoreEndTimer == 0
        {
            audio_play_sound(Sndtally,0,0,0.3,0.01)
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