/*if (keyboard_check(ord("R"))) {
	room_restart()
}

if (keyboard_check(ord("1"))) {
    room_goto(Room1)
}
else 
if (keyboard_check(ord("2"))) {
    room_goto(Room2)
}else 
if (keyboard_check(ord("3"))) {
    room_goto(Room3)
}else 
if (keyboard_check(ord("4"))) {
    room_goto(Room4)
}else 
if (keyboard_check(ord("5"))) {
    room_goto(Room5)
}else 
if (keyboard_check(ord("6"))) {
    room_goto(Room6)
}else 
if (keyboard_check(ord("7"))) {
    room_goto(Room7)
}else 
if (keyboard_check(ord("8"))) {
    room_goto(Room8)
}else 
if (keyboard_check(ord("9"))) {
    room_goto(Room9)
}else 
if (keyboard_check(ord("0"))) {
    room_goto(Room10)
}
 * */
if (keyboard_check(vk_enter))
{
    roomEnd()
}

if prePhase
{
    if fadeInTimer > 0
    {
        fadeInTimer --
        if fadeInTimer == 0
        {
            postFadeTimer = postFadeTimerMax
        }
    }
    if postFadeTimer > 0
    {
        postFadeTimer --
        if postFadeTimer == 0
        {
            spawnBubbles = true;
        }
    }
    if spawnBubbles
    {
        for (var i = 0; i < array_length(global.totalBubbles); i++)
        { 
            for (var j = 0 ; j < global.totalBubbles[i]; j++)
            {
                var newBubble = instance_create_depth(spawnX,spawnY,-10,objBubble);
                newBubble.bubbleSize = 3-i;
                switch newBubble.bubbleSize 
                {   
                    case 3: newBubble.sprite_index = sprBubbleLarge 
                    break; 
                    case 2: newBubble.sprite_index = sprBubbleMedium 
                    break; 
                    case 1: newBubble.sprite_index = sprBubbleSmall 
                    break; 
                }
            }
        }
        prePhase = false
    }
    
}
if win
{
    if fadeTimer > 0
    {
        fadeTimer --
    }
    else
    {
        if !allReset
        {
           allReset = true;
           for (var i = 0; i < array_length(bubblesPos); i++)
           {
            var idealX = (spawnX-((array_length(bubblesPos)-1)*16)+(i*32))
               if abs(bubblesPos[i].x - idealX) < 1
               {
                   bubblesPos[i].x = idealX;
               }
               else
               {
                   allReset = false;
                   bubblesPos[i].x = lerp(bubblesPos[i].x, idealX, lerpSpeed);
               }
               if abs(bubblesPos[i].y - spawnY) < 1
               {
                   bubblesPos[i].y = spawnY;
               }
               else
               {
                   allReset = false;
                   bubblesPos[i].y = lerp(bubblesPos[i].y, spawnY, lerpSpeed);
               } 
            } 
            if allReset
            {
            //endTimer = endTimerMax
            objGameController.scoreCountup = true;
            }
        }

    }
    if allReset
    {

        if beginEnd
        {
            if !allReset2
            {
                allReset2 = true;
                for (var i = 0; i < array_length(bubblesPos); i++)
                {
                    if abs(bubblesPos[i].x - spawnX) < 1
                    {
                        bubblesPos[i].x = spawnX;
                    }
                    else
                    {
                        allReset2 = false;
                        bubblesPos[i].x = lerp(bubblesPos[i].x, spawnX, lerpSpeed);
                    }
                    if abs(bubblesPos[i].y - spawnY) < 1
                    {
                        bubblesPos[i].y = spawnY;
                    }
                    else
                    {
                        allReset2 = false;
                        bubblesPos[i].y = lerp(bubblesPos[i].y, spawnY, lerpSpeed);
                    } 
                    show_debug_message("moving d' bubble")
                } 
                if allReset2
                {
                    endTimer = endTimerMax 
                }
            }
            if endTimer != 0
            {
                endTimer --
            }
            else
            {
                var isRoom = function(roomName)
                {
                    return roomName = room
                }
                var roomNum = array_find_index(global.roomsOrder, isRoom)
                var nextRoom = global.roomsOrder[roomNum+1];
                if nextRoom != -1 && roomNum + 1 < array_length(global.roomsOrder)
                {
                    room_goto(nextRoom);
                }
                else
                {
                    room_goto(global.roomsOrder[0]);
                }
            }
        }
    }
}
if gameOver
{
    if fadeTimer > 0
    {
        fadeTimer --
    }
    else {
        beginEnd = true
        endTimer = endTimerMax
    }
    if endTimer > 0
    {
        endTimer --    
    }
    else
    {
        objGameController.gameOverEnd = true;
        objGameController.scoreTimer = objGameController.scoreTimerMax;
    }
    
}
