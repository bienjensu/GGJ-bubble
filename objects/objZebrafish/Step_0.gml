

event_inherited();

if (instance_place(x, y, objBilliardsBubble)) {
    var i = instance_place(x, y, objBilliardsBubble)
    if i != noone {
        if i.y > y {
            vulnerable = true
        } else {
            vulnerable = false
            i.split()
        }
    }
}