global.roomsOrder = [Room1, Room2, Room3, Room4]
global.totalBubbles = [1,0,0]
global.currentScore = 0;
global.highScore = 0;
function bubblesLeft(totalsize){
    var bigBubbles = floor(totalsize/4)
    var mediumBubbles = floor((totalsize - bigBubbles * 4)/2)
    var smallBubbles = totalsize - (bigBubbles*4) - (mediumBubbles*2)
    return[bigBubbles, mediumBubbles, smallBubbles]
} 