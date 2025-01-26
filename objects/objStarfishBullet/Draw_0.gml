if killTimer < killTimeFlash || (killTimer > killTimeFlash && killTimer mod 4 > 2) {
    draw_sprite_wrapped(sprite_index,image_index,x,y,image_angle)
}