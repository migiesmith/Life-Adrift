/// removeObjectFromGrid(grid, ?object)
var grid = argument[0];
var object = id;
if(argument_count > 1)
    object = argument[1];

var w = object.sprite_width / PATH_GRID_SIZE;
var h = object.sprite_height / PATH_GRID_SIZE;

for(var yy = 0; yy < h; yy++){
    for(var xx = 0; xx < w; xx++){
        mp_grid_clear_cell(global.pathingGrid, object.bbox_left div PATH_GRID_SIZE + xx, object.bbox_top div PATH_GRID_SIZE + yy);
    }
}

