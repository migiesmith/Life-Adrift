/// Create Tiled Surface (background, tileWidth, tileHeight, tileOverrideToggle)
var background = argument[0];
var tw = argument[1];
var th = argument[2];
var tileOverrideToggle = noone;
if(argument_count > 3)
    tileOverrideToggle = argument[3];

var spWidth = sprite_get_width(sprite_index);
var spHeight = sprite_get_height(sprite_index);
var tiledSurface = surface_create(sprite_width, sprite_height + th*2);

surface_set_target(tiledSurface);
for(var yy = 0; yy < image_yscale div 1; yy++){
    for(var xx = 0; xx < image_xscale div 1; xx++){
        var xIndex = 1;
        var yIndex = 1;
        
        if(tileOverrideToggle == noone){  
            if(xx == 0 || xx == image_xscale - 1){
                xIndex = xx div (image_xscale-1) * 2;
            }
            if(yy == 0 || yy == image_yscale - 1){
                yIndex = yy div (image_yscale-1) * 2;
            }
                
            if(xIndex == 1 && yIndex == 1){
                var rand = irandom(3);
                if(rand != 0){
                    xIndex = 3;
                    yIndex = rand - 1;
                }
            }      
            draw_background_part(background, xIndex * tw, yIndex * th, tw, th, tw * xx, th * yy);
        }else{
            var right = !(xx+1 >= image_xscale div 1 || !tileOverrideToggle[xx+1, yy]);
            var down = !(yy+1 >= image_yscale div 1 || !tileOverrideToggle[xx, yy+1]);
            var left = !(xx-1 < 0 || !tileOverrideToggle[xx-1, yy]);
            var up = !(yy-1 < 0 || !tileOverrideToggle[xx, yy-1]);
            if(tileOverrideToggle[xx, yy]){
                if(right && down && left && up){ // Fully Connected
                    xIndex = 1;
                    yIndex = 1;
                }else if(!right && down && left && up){ // Right Edge
                    xIndex = 2;
                    yIndex = 1;
                }else if(right && down && !left && up){ // Left Edge
                    xIndex = 0;
                    yIndex = 1;
                }else if(right && down && left && !up){ // Up Edge
                    xIndex = 1;
                    yIndex = 0;
                }else if(right && !down && left && up){ // Down Edge
                    xIndex = 1;
                    yIndex = 2;
                }else if(right && down && !left && !up){ // Top Left Corner
                    xIndex = 0;
                    yIndex = 0;
                }else if(!right && down && left && !up){ // Top Right Corner
                    xIndex = 2;
                    yIndex = 0;
                }else if(right && !down && !left && up){ // Bottom Left Corner
                    xIndex = 0;
                    yIndex = 2;
                }else if(!right && !down && left && up){ // Bottom Right Corner
                    xIndex = 2;
                    yIndex = 2;
                }
                    
                if(xIndex == 1 && yIndex == 1){
                    var rand = irandom(3);
                    if(rand != 0){
                        xIndex = 3;
                        yIndex = rand - 1;
                    }
                }
                
                if(!down){
                    draw_background_part(bg_island, xIndex * tw, yIndex * th, tw, th, tw * xx, th * yy + (th - th div 4));
                }
                
                draw_background_part(background, xIndex * tw, yIndex * th, tw, th, tw * xx, th * yy);
            }
        }
    }
}
surface_reset_target();

return tiledSurface;
