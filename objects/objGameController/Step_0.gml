if keyboard_check_pressed(vk_escape)
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
if current_time - global.stage_timer > 30000 && !spawned && !objStageController.tutorial
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


