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
if win
{
    if fadeTimer == fadeTimerMax
    {
        allReset = true;
        for (var i = 0; i < array_length(bubblesPos); i++)
        {
            if abs(bubblesPos[i].x - spawnX) < 1
            {
                bubblesPos[i].x = spawnX;
            }
            else
            {
                allReset = false;
                bubblesPos[i].x = lerp(bubblesPos[i].x, spawnX, lerpSpeed);
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
    }
    else{
        fadeTimer ++
    }
    if allReset
    {
        endTimer ++
        if endTimer > endTimerMax
        {
            var isRoom = function(roomName)
            {
                return roomName = room
            }
            var nextRoom = global.roomsOrder[array_find_index(global.roomsOrder, isRoom)+1];
            if nextRoom != -1
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
