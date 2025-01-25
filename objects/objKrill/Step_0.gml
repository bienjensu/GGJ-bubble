
if !grabbed {
    if moveTimer % nextMove = 0
    {
        moveTimer = 0;
        nextMove = irandom_range(10,40);
        xPos = xstart + random_range(-moveDist, moveDist);
        yPos = ystart + random_range(-moveDist, moveDist);
    }
    x = lerp(x, xPos, lerpSpeed);
    y = lerp(y, yPos, lerpSpeed);
    moveTimer ++;
}
event_inherited();

