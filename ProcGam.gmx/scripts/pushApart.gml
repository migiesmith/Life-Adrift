/// pushApart(objectType, pushSpeed)
var objectType = argument[0];
var pushSpeed = argument[1];

var otherObj = instance_place(x, y, objectType);
while(otherObj != noone){
    x += random(pushSpeed) - pushSpeed / 2;
    y += random(pushSpeed) - pushSpeed / 2;
    with(otherObj){
        x += random(pushSpeed) - pushSpeed / 2;
        y += random(pushSpeed) - pushSpeed / 2;
    }

    otherObj = instance_place(x, y, objectType);
}

