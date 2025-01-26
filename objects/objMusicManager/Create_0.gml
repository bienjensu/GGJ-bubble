function toggle_drum() {
    if global.drumPlaying {
        audio_sound_gain(global.bgmDrum, 0, 100)   
    } else {
        audio_sound_gain(global.bgmDrum, 1, 100)
    }
    global.drumPlauing = !global.drumPlaying
}

function toggle_bass() {
    if global.bassPlaying {
        audio_sound_gain(global.bgmBass, 0, 100)   
    } else {
        audio_sound_gain(global.bgmBass, 1, 100)
    }
    global.bassPlaying = !global.bassPlaying
}

function toggle_all() {
    
}

function restart_all() {
    
}