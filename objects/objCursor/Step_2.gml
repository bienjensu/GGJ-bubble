if window_mouse_get_locked()
{
    x+= window_mouse_get_delta_x()*sensitivity
    y+= window_mouse_get_delta_y()*sensitivity
}
else
{
    x = mouse_x
    y = mouse_y
}
if birdInst
{
    birdX = x
    birdY = y
}
else 
{
    birdX = lerp(birdX, birdIdealX, birdSpeed)
    birdY = lerp(birdY, birdIdealY, birdSpeed)
}