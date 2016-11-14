/// addSpriteToGrid(grid)
var grid = argument[0];

var w = sprite_width / PATH_GRID_SIZE;
var h = sprite_height / PATH_GRID_SIZE;

for(var yy = 0; yy < h; yy++){
    for(var xx = 0; xx < w; xx++){
        mp_grid_add_cell(global.pathingGrid, solidBase.x div 16 + xx, solidBase.y div 16 + yy);
    }
}

