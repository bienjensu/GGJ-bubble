variant = 0

moveTimer = 0;
xPos = xstart;
yPos = ystart;
moveDist = 2;
lerpSpeed =0.2;
nextMove = 10;
event_inherited();
vulnerable = true;
image_xscale = choose(-1,1)

// shiny
var r = irandom(256) 
show_debug_message(r)
if r == 1
{
    variant = 1;
}
show_debug_message(variant)
switch variant
{
    case 0 : sprite_index = choose(sprKrill1,sprKrill2);
        break;
    case 1 : sprite_index = sprKrillGold;
        break;
        
}