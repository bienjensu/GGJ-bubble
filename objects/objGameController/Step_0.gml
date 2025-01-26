

if !scoreCountup
{
    bonus --
    bonus = clamp(bonus, 0, 1000000)
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



