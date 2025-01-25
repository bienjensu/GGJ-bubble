if killTimer < killTimeFlash || (killTimer > killTimeFlash && killTimer mod 4 > 2) {
    draw_self()
}