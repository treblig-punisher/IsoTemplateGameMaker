///// @description Insert description here
//// You can write your code in this editor

var camX = camera_get_view_x(MAIN_CAM) - 100
var camY = camera_get_view_y(MAIN_CAM) - 100
var camX2 = camX + VIEW_W  + 100
var camY2 = camY + VIEW_H  + 100
var camPos = {
	camX ,
	camY ,
	camX2,
	camY2
}
//var passedCoords = {
//	x: 0,
//	y: 0,
//	tileId: 0,
//	hovered: false
//}
var tile = tilesList[currentTile]
var tileSprite = variable_struct_get(tiles, tile)
//draw_set_halign(fa_center)
//draw_set_valign(fa_middle)
//var createTriangle = function(){
	
//}

var mouseInTriangle = function(triangleStruct){
	return(point_in_triangle(mouse_x, mouse_y, 
			triangleStruct.x, triangleStruct.y, triangleStruct.x2, triangleStruct.y2, triangleStruct.x3, triangleStruct.y3)
		)
}
//var thisTile;
//var coords  ;
//var triangle, triangle2
//var rectColAndOpacity ={
//			col: c_aqua,
//			opacity: 0.3,
//			resetAll: function(){
//				col = c_white 
//				opacity = 1
//				draw_set_color(col)
//				draw_set_alpha(opacity)
//			},
//			setColAndOpac: function(){
//				draw_set_color(col)
//				draw_set_alpha(opacity)
//			}
//		}
////for(var yCoord = 0; yCoord < gridH; yCoord ++){
////	for(var xCoord = 0; xCoord < gridW; xCoord ++){
////		thisTile = worldGrid[# xCoord, yCoord]
////		//coords = cartToIsoCoords(xCoord, yCoord)
		
////		 triangle ={
////			x: thisTile.x+CELL_WIDTH/2, y: thisTile.y, x2: thisTile.x+CELL_WIDTH, y2: thisTile.y + CELL_HEIGHT/2,
////			x3: thisTile.x+CELL_WIDTH/2, y3: thisTile.y + CELL_HEIGHT
////		}	
////		triangle2 ={
////			x: thisTile.x+CELL_WIDTH/2, y: thisTile.y, x2: thisTile.x+CELL_WIDTH/2, y2: thisTile.y + CELL_HEIGHT,
////			x3: thisTile.x, y3: thisTile.y + CELL_HEIGHT/2
////		}
////		thisTile.drawTile(camPos)
////		if(mouseInTriangle(triangle) || mouseInTriangle(triangle2)){
////			var sprHeight = sprite_get_height(tileSprite)
////			thisTile.hovered = true
////			passedCoords.hovered = thisTile.hovered
////			draw_sprite_ext(tileSprite, 0, thisTile.x, thisTile.y - (sprHeight-CELL_HEIGHT), 1, 1, 0, c_white, 1)
////			if(mouse_check_button(mb_left)) thisTile.tileName = tileSprite			
////		}
		
////		//draw_sprite(thisTile.tileName, 0, coords.x, coords.y/* -(sprite_get_height(thisTile.tileName)-CELL_HEIGHT)*/) 
		
////		//draw_triangle(triangle.x, triangle.y, triangle.x2, triangle.y2, triangle.x3, triangle.y3, true)
////		//draw_triangle(triangle2.x, triangle2.y, triangle2.x2, triangle2.y2, triangle2.x3, triangle2.y3, true)
		
////	}
////}

////passedCoords
//with(oTile)
//{
//	draw_text(x+CELL_WIDTH/2, y, $"x: {x}\ny: {y}")
//}
//var tile = tilesList[currentTile]
//var tileSprite = variable_struct_get(tiles, tile)
//draw_sprite_ext(tileSprite, 0, passedCoordinates.x, passedCoordinates.y - (sprite_get_height(tileSprite)-CELL_HEIGHT), 1, 1, 0, c_white, 1)
//with(oTile)
//{
//	//draw_sprite(sprite_index, 0, x, y-(sprite_get_height(sprite_index)-CELL_HEIGHT))

//	if(hovered)
//	{
//		//image_alpha = 0
//		var passedSprite = oBuilderManager.currentTileSelected
//		//draw_sprite(passedSprite, 0, x, y-(sprite_get_height(passedSprite)-CELL_HEIGHT))
//	}
//	else image_alpha = 1
//}
var drawTile = function(tile, camPos){
		
	if(point_in_rectangle(tile.x, tile.y, camPos.camX, camPos.camY, camPos.camX2, camPos.camY2))
	{
		//if(tile.tileName != -1)
		
			//tile.alpha = lerp(tile.alpha, tile.hovered? 0.2: 1, 0.2)
			var sprHeight = sprite_get_height(tile.tileName)
				
			draw_sprite_ext(tile.tileName, 0, tile.x, tile.y-(sprHeight-CELL_HEIGHT) - tile.layerElevation, 1, 1, 0, c_white, tile.alpha) 
			//tile.hovered = false
		
	}
		
}


var drawGrid = function(camPos, mouseInTriangle)
{	
	var currentCoords ={ x: 0, y: 0}
	var tile
	for(var yCoord = 0; yCoord < gridH; yCoord ++){
		for(var xCoord = 0; xCoord < gridW; xCoord ++){
			tile = worldGrid[# xCoord,yCoord]
			draw_sprite_ext(tile.tileName, 0, tile.x, tile.y, 1, 1, 0, -1, 1)
			if(mouseInTriangle(tile.triangles[0]) || mouseInTriangle(tile.triangles[1])){
				draw_sprite_ext(currentTileSelected, 0, tile.x, tile.y, 1, 1, 0, c_white, 1)
				if(mouse_check_button(mb_left)) tile.tileName = currentTileSelected			
			}
		}
	}	
}
drawGrid(camPos, mouseInTriangle)
if(tileID != -1) draw_sprite(currentTileSelected, 0, tileID.x, tileID.y)