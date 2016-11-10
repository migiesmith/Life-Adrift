/// pushApart(objectType, pushSpeed)
var objectType = argument[0];
var pushSpeed = argument[1];

var otherObj = instance_place(x, y, objectType);
var iterations = 0;
while(otherObj != noone && iterations < 10){
    var dx = random(pushSpeed) - pushSpeed / 2;
    var dy = random(pushSpeed) - pushSpeed / 2;
    
    x += dx;
    y += dy;
    with(otherObj){
        x -= dx;
        y -= dy;
    }

    otherObj = instance_place(x, y, objectType);
    iterations++;
}
