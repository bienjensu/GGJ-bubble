// Inherit the parent event
event_inherited();
draw_sprite(birdIndex, 0, birdX, birdY)
draw_sprite(birdIndex, 0, birdX+room_width, birdY)
draw_sprite(birdIndex, 0, birdX-room_width, birdY)
draw_sprite(birdIndex, 0, birdX, birdY+room_height)
draw_sprite(birdIndex, 0, birdX, birdY+room_height)

if grabbedBubble != noone
{
    
    draw_line(grabbedBubble.x,grabbedBubble.y,x,y)
}
