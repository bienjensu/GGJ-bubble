probeNumW = 10;
probeNumH = 10;
widthBuffer = 16;
heightBuffer = 16;
for(var i = 0; i<probeNumH; i++)
{
    for(var j = 0; j<probeNumW; j++)
    {
        var xPos = widthBuffer+(j*(room_width-(widthBuffer*2))/probeNumW);
        var yPos = heightBuffer+(i*(room_height-(heightBuffer*2))/probeNumH);
        xPos += random_range(10,-10);
        yPos += random_range(10,-10);
        if !place_meeting(xPos, yPos, objCollider) && irandom(10) == 1
        {
            instance_create_layer(xPos,yPos, layer,objKrill)
        }
    }
}