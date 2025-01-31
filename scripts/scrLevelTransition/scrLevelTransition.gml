function bubblesLeft(totalsize){
    var bigBubbles = floor(totalsize/4)
    var mediumBubbles = floor((totalsize - bigBubbles * 4)/2)
    var smallBubbles = totalsize - (bigBubbles*4) - (mediumBubbles*2)
    return[bigBubbles, mediumBubbles, smallBubbles]
} 