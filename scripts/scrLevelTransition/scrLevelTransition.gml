
function bubblesLeft(totalsize){
    var bigBubbles = floor(totalsize/4)
    var mediumBubbles = floor((totalsize - bigBubbles * 4)/2)
    var smallBubbles = totalsize - (bigBubbles*4) - (mediumBubbles*2)
    return[bigBubbles, mediumBubbles, smallBubbles]
} 
var output = bubblesLeft(5)
show_debug_message("small {0} | med {1} | big {2}",output[0],output[1],output[2])