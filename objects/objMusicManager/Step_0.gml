if (keyboard_check_released(vk_f1)) {
    show_debug_message("Toggling drums...")
    toggle_drum()
}
if (keyboard_check_released(vk_f2)) {
    show_debug_message("Toggling bass...")
    toggle_bass()
}