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
    birdX = x
    birdY = y