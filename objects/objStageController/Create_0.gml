bubbles = [];
bubblesPos = [];
totalSize = 0;
spawnX = room_width/2;
spawnY = room_height -32;
win = false;
allReset = false;
lerpSpeed = 0.2;
fadeTimer = 0;
fadeTimerMax = 100;
endTimer = 0;
endTimerMax = 50;
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
        instance_destroy(bubble)
    }
    win = true;
}