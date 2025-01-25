if (instance_place(x, y, objBubble)) {
    var i = instance_place(x, y, objBubble)
    if i != noone {
        if i.y > y {
            vulnerable = true
        } else {
            vulnerable = false
            i.split()
        }
    }
}
event_inherited();