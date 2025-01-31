// Score
//score = 0
bonus = 2000
scoreCountup = false;
preScoreTimer = 50;
showScoreTimeMax = 40;
showScoreTimer = 0;
postScoreTimer = 0;
postScoreTimeMax = 40;
beginBonusCount = false;
showBonus = false;
scoreposX = gamew - 16;
scoreposY = 16;
timeposX = 16;
timeposY = 16;
scorefinalposX = gamew/2
scorefinalposY = gameh/2
textLeading = 10;
giantSpawnX = gamew/2;
giantSpawnY = -64;
spawned = false;
gameOverEnd = false;
// Init stage timer on controller spawn
stageTimer = 0;
//global.stage_timer = current_time
optionsYStart = 112;
optionsX = 130;
optionsXOffset = -34;
aysXOffset = 8;
aysYOffset = 8;
selection = -1;
hitboxDown = 16;
hitboxUp = 12;
menuLeading = 24;
menuOptions = ["Resume","Options","Main menu"]
optionsOptions = ["Lock mouse : " + boolToString(global.lockMouse),"Fullscreen : " + boolToString(global.fullScreen),"Sensitivity : " + string(global.sensitivity),"Back"]
aysOptions = ["Yes","No"]
paused = false;
pausedSurf = -1;
options = false;
areYouSure = false;
released = true;
surface_free(pausedSurf);
unPause = function()
{
	paused = !paused;
	if !paused
	{
		instance_activate_all();
		surface_free(pausedSurf);
		pausedSurf = -1;
        objCursor.x = objCursorMenu.x;
        objCursor.y = objCursorMenu.y;
        instance_destroy(objCursorMenu);
	}
	if paused
	{
        instance_create_depth(objCursor.x,objCursor.y,-100,objCursorMenu)
		selection = -1;
        released = true;
	}
}