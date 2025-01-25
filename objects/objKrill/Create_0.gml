var variant = choose(0,1)
var r = irandom(256) 
show_debug_message(r)
if r == 1
{
    variant = 2;
}
show_debug_message(variant)
switch variant
{
    case 0 : sprite_index = sprKrill1;
        break;
    case 1 : sprite_index = sprKrill2;
        break;
    case 2 : sprite_index = sprKrillGold;
        break;
        
}
moveTimer = 0;
xPos = xstart;
yPos = ystart;
moveDist = 2;
lerpSpeed =0.2;
nextMove = 10;
event_inherited();
vulnerable = true;

