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
function roomEnd()
{
    for (var i = 0 ; i < instance_number(objBubble) ; i++)
    {
        var bubble = instance_find(objBubble, i);
        totalSize += bubble.bubbleSize;
        if bubble.bubbleSize = 3
        {
            totalSize++;
        }
        bubblesPos[i] = {
            x : bubble.x,
            y : bubble.y,
            bubbleSize : bubble.bubbleSize
        }
        //instance_destroy(bubble)
    }
    global.totalBubbles = bubblesLeft(totalSize);
    instance_destroy(objBubble);
    win = true;
}