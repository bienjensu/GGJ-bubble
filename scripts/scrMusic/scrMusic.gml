global.bgmDrum = audio_play_sound(bgm_drum, 1, true)
global.drumPlaying = true
global.bgmBass = audio_play_sound(bgm_drum_bass, 1, true)
global.bassPlaying = true
global.bgmAll = audio_play_sound(bgm_all, 1, true)
global.allPlaying = true

//bgmPanicDrum = audio_play_sound(bgm_panic_drum, 1, true)

function update_music() {
    var large = false
    var medium = false
    var small = false
    for (var i = 0; i < instance_number(objBubble) - 1; i++) {
        cur_bubble = instance_find(objBubble, i)
        switch cur_bubble.bubbleSize {
            case 3: large = true; break;
            case 2: medium = true; break;
            case 1: small = true ; break;
        }
        if large {
            audio_sound_gain(global.bgmAll, 1, 100)
            audio_sound_gain(global.bgmBass, 0, 100)
            audio_sound_gain(global.bgmDrum, 0, 100)
        } else if medium {
            audio_sound_gain(global.bgmAll, 0, 100)
            audio_sound_gain(global.bgmBass, 1, 100)
            audio_sound_gain(global.bgmDrum, 0, 100)
        } else if small {
            audio_sound_gain(global.bgmAll, 0, 100)
            audio_sound_gain(global.bgmBass, 0, 100)
            audio_sound_gain(global.bgmDrum, 1, 100)
        }
    }
}