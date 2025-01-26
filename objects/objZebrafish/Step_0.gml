if (instance_place(x, y, objBubble)) {
    var i = instance_place(x, y, objBubble)
    if i != noone {
        if i.y > y {
            vulnerable = true
        } else if !grabbed{
            vulnerable = false
            i.split()
        }
    }
}
if (instance_exists(objBubble)) {
    target = instance_nearest(x,y,objBubble)
}



x += xVel;

event_inherited();


