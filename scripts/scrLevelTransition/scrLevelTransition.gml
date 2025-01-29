global.roomsOrder = [rmTutorial, rmStage01, rmStage02, rmStage03, rmStage04, rmStage05, rmStage06, rmStage07, rmStage08, rmStage09,rmStage10,rmStage11, rmWin]
global.totalBubbles = [1,0,0]
global.currentScore = 0;
global.highScore = 0;
function bubblesLeft(totalsize){
    var bigBubbles = floor(totalsize/4)
    var mediumBubbles = floor((totalsize - bigBubbles * 4)/2)
    var smallBubbles = totalsize - (bigBubbles*4) - (mediumBubbles*2)
    return[bigBubbles, mediumBubbles, smallBubbles]
} 