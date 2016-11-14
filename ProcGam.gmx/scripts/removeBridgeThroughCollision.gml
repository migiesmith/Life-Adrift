/// Remove Bridge Through Collision
var bridgeWall = instance_place(x,y,obj_bridge_wall);
while(bridgeWall != noone){
    with(bridgeWall){
        instance_destroy();
    }
    bridgeWall = instance_place(x,y,obj_bridge_wall);
}

var bridgeGround = instance_place(x,y,obj_bridge);
if(bridgeGround != noone){
    with(bridgeGround){
        instance_destroy();
    }
}

var bridgeBlock = instance_nearest(x,y,obj_bridge_block);
if(bridgeBlock != noone){
    with(bridgeBlock){
        instance_destroy();
    }
}

var roomChanger = instance_place(x,y,obj_room_change);
if(roomChanger != noone){
    with(roomChanger){
        instance_destroy();
    }
}
