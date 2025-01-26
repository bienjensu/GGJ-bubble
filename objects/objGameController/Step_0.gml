seconds = round(current_time/1000)%60
minutes = round(current_time/60000)
seconds_format = string_replace(string_format(seconds, 2, 0), " ", "0")
minutes_format =  string_replace(string_format(minutes, 2, 0), " ", "0")
time_string = string_join("", "Time: ", minutes_format, ":", seconds_format)

if !scoreCountup
{
    bonus --
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
        if bonus == 0
        {
            postScoreTimer = postScoreTimeMax;
        }
    }
    if postScoreTimer > 0
    {
        postScoreTimer --
        if postScoreTimer == 0
        {
            showBonus = false;
            objStageController.beginEnd = true;
        }
    }
}
score_string = string_join("", "Score: ", string_replace_all(string_format(global.currentScore, 8, 0), " ", "0"))


