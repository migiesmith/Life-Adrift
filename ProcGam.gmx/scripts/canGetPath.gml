/// canGetPath(startX, startY, endX, endY)
var sx = argument[0];
var sy = argument[1];
var ex = argument[2];
var ey = argument[3];


if(!mp_grid_path(global.pathingGrid, path, sx, sy, ex, ey, true)){
    return false;
}else{
    path_set_kind(path, 1);
    path_set_precision(path, 4);
    return true;
}
