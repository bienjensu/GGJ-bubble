loadGame()
hitboxDown = 16;
hitboxUp = 12;
textLeading = 24;
scoreY = camerah - 24;
scoreX = cameraw/2;
menuYStart = 112;
menuX = (cameraw/2) - 24;
creditsYStart = 88
creditsX = (cameraw/2) - 96;
optionsYStart = 112;
optionsX = (cameraw/2) - 64;
selection = -1;
creditsOffset = 16;
released = false;
otherMenu = false;
logoX = cameraw/2;
logoY = 54;
menuOptions = [
{
    name : "Start",
    action : false
},
{
    name : "Options",
    action : false
},
{
    name : "Credits",
    action : false
},
{
    name : "Quit",
    action : false
}
]

optionsOptions = ["Lock mouse : " + boolToString(global.lockMouse),"Fullscreen : " + boolToString(global.fullScreen),"Sensitivity : " + string(global.sensitivity),"return"]

credits = [
{
    name : "squp",
    credit : "Art, Programming, SFX"
},
{
    name : "Pikol",
    credit : "Programming"
},
{
    name : "Edza",
    credit : "Programming"
},
{
    name : "Heraga",
    credit : "Game Design, Music"
},
]
instance_create_depth(0,0,-100,objCursorMenu)