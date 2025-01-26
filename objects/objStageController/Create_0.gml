view_wport[0] = cameraw * 4;
view_hport[0] = cameraw * 4;
bubbles = [];
bubblesPos = [];
totalSize = 0;

spawnX = room_width/2;
spawnY = room_height -32;

win = false;
prePhase = true;
allReset = false;
lerpSpeed = 0.2;
fadeTimer = 0;
fadeTimerMax = 100;
endTimer = 0;
endTimerMax = 25;
fadeInTimerMax = 25;
fadeInTimer = fadeInTimerMax;
postFadeTimer = 0;
postFadeTimerMax = 80;
endSurf = -1;
beginEnd = false;
spawnBubbles = false;
readyTextX = gamew/2;
readyTextY = gameh/2;
function roomEnd()
{
    for (var i = 0 ; i < instance_number(objBubble) ; i++)
    {
        var bubble = instance_find(objBubble, i);
        totalSize += bubble.bubbleSize;
        if bubble.bubbleSize = 3
        {
            totalSize++
        }
        
        bubblesPos[i] = {
            x : bubble.x,
            y : bubble.y,
            bubbleSize : bubble.bubbleSize
        }
        //instance_destroy(bubble)
    }
    global.totalBubbles = bubblesLeft(totalSize);
    //instance_destroy(objBubble);
    win = true;
}

// Spawn cursor
instance_create_depth(spawnX, spawnY, -100, objCursor)