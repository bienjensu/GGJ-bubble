event_inherited();
draw_sprite(birdIndex, 0, birdX, birdY)
draw_sprite(birdIndex, 0, birdX+room_width, birdY)
draw_sprite(birdIndex, 0, birdX-room_width, birdY)
draw_sprite(birdIndex, 0, birdX, birdY+room_height)
draw_sprite(birdIndex, 0, birdX, birdY+room_height)

if instance_exists(grabbedBubble)
{
    var lineTargetX = grabbedBubble.x + lengthdir_x(point_distance(grabbedBubble.x,grabbedBubble.y,birdIdealX, birdIdealY),point_direction(grabbedBubble.x,grabbedBubble.y,birdIdealX,birdIdealY)+180)
    var lineTargetY = grabbedBubble.y + lengthdir_y(point_distance(grabbedBubble.x,grabbedBubble.y,birdIdealX, birdIdealY),point_direction(grabbedBubble.x,grabbedBubble.y,birdIdealX,birdIdealY)+180)
   // var lineOriginX = grabbedBubble.x + lengthdir_x(grabbedBubble.sprite_width/2,point_direction(grabbedBubble.x,grabbedBubble.y,birdIdealX,birdIdealY)+180)
    //var lineOriginY = grabbedBubble.y + lengthdir_y(grabbedBubble.sprite_height/2,point_direction(grabbedBubble.x,grabbedBubble.y,birdIdealX,birdIdealY)+180)
    //draw_line(lineOriginX,lineOriginY,lineTargetX,lineTargetY)
    draw_sprite_wrapped(sprArrow,0,lineTargetX,lineTargetY, point_direction(grabbedBubble.x,grabbedBubble.y,birdIdealX,birdIdealY)+90)
}



