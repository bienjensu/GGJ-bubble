moveTimer = 0;
moveRadius = 48;
speedRatio = 0.8;
puffTime = 100; // time unpuffed
puffTimer = 0;
beginPuffTimer = floor(puffTime/4);
frameRate = 6;
pufft = false;
event_inherited()
vulnerable = true;
mtSpeed = 1