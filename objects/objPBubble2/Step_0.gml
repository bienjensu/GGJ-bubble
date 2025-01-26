x += xv
y-= yv

xv = clamp(xv-0.01*sign(-xv),-1,1)
yv = min(yv+0.01,yvm)



if decay == 0 {
    instance_destroy()
}

decay --