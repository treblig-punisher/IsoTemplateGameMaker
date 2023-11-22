/// @description Insert description here
// You can write your code in this editor
var size = 20
gridSize = {
	x: size,
	y: size-4
}
roomW = room_width
roomH = room_height 
camManager = new CamManager() 
camManager.updateCam()



worldGrid = ds_grid_create(gridSize.x, gridSize.y)
tiles ={
	greenTile: spr_greenTile,	
	unavailableTile: spr_unavailableTile,
	waterTile: spr_waterTile,
	availableTile: spr_availableTile, 
	outline: spr_outline
}
tilesList = variable_struct_get_names(tiles)

array_foreach(tilesList, function(item){
	var spr = variable_struct_get(tiles, item)
	var sprH= sprite_get_height(spr)
	sprite_set_offset(spr, 0, sprH-CELL_HEIGHT)
})
currentTile = 0
gridW = gridSize.x
gridH = gridSize.y

cartToIsoCoords = function(cartX, cartY){
	var isoCoords = {
		x: ((cartX - cartY) * (CELL_WIDTH * 0.5) ) + (room_width-450 ),
		y: ((cartX + cartY) * (CELL_HEIGHT * 0.5)) + (room_height/2)
	}
	return isoCoords
}

initializeStructs = function()
{
	for(var gridY = 0; gridY < gridH; gridY++){
		for(var gridX = 0; gridX < gridW; gridX++){		
			var coords = cartToIsoCoords(gridX, gridY)
			var triangle ={
				x: coords.x+CELL_WIDTH/2, y: coords.y, x2: coords.x+CELL_WIDTH, y2: coords.y + CELL_HEIGHT/2,
				x3: coords.x+CELL_WIDTH/2, y3: coords.y + CELL_HEIGHT
			}	
			var triangle2 ={
				x: coords.x+CELL_WIDTH/2, y: coords.y, x2: coords.x+CELL_WIDTH/2, y2: coords.y + CELL_HEIGHT,
				x3: coords.x, y3: coords.y + CELL_HEIGHT/2
			}

			var tileStruct = new TileStruct(tiles.outline, coords.x, coords.y)
			array_push(tileStruct.triangles, triangle, triangle2)
			ds_grid_add(worldGrid, gridX, gridY, tileStruct)
			//var sprH = sprite_get_height(ins.sprite_index)
			//if(sprH- CELL_HEIGHT > 0) sprite_set_offset(ins.sprite_index, 0, sprH-CELL_HEIGHT)
			//else sprite_set_offset(ins.sprite_index, 0, 0)
			
		
			
		}
	}
}
initializeStructs()
presentTileObjects = []
initializeGridObjects = function()
{
	for(var gridY = gridH; gridY > 0; gridY--){
		for(var gridX = gridW; gridX > 0; gridX--){	
			
			var coords = cartToIsoCoords(gridX, gridY)
			triangle ={
			x: coords.x+CELL_WIDTH/2, y: coords.y, x2: coords.x+CELL_WIDTH, y2: coords.y + CELL_HEIGHT/2,
			x3: coords.x+CELL_WIDTH/2, y3: coords.y + CELL_HEIGHT
			}	
			triangle2 ={
				x: coords.x+CELL_WIDTH/2, y: coords.y, x2: coords.x+CELL_WIDTH/2, y2: coords.y + CELL_HEIGHT,
				x3: coords.x, y3: coords.y + CELL_HEIGHT/2
			}
			var ins = instance_create_layer(coords.x, coords.y, "objectTiles", oTile, {hovered: false, 
				offsetY: 0, triangle, triangle2
				})
			array_push(presentTileObjects, ins)
			
			ins.sprite_index = tiles.waterTile
			var sprH = sprite_get_height(ins.sprite_index)
			if(sprH- CELL_HEIGHT > 0) sprite_set_offset(ins.sprite_index, 0, sprH-CELL_HEIGHT)
			else sprite_set_offset(ins.sprite_index, 0, 0)
			//ins.depth = -coords.y
		}
	}	
}
//initializeGridObjects()
show_debug_overlay(true)
passedCoordinates ={
	x: 0, y: 0,
	updateCoords: function(xx, yy){
		x = xx
		y = yy
	}
}

isoToCartCoords = function(isoX, isoY){
	
}

fixedCamPos = {
	x: 0,
	y: 0,
	xPrev: x,	
	yPrev: y,
}
setCamPos = function(coords){
	fixedCampPos = coords
}
mousePosition = {
	x: mouse_x,
	y: mouse_y
}

camera_set_view_pos(MAIN_CAM, (room_width-VIEW_W/2), room_height-VIEW_H/2)	
mousePrevious = {x: 0, y: 0}

currentTileSelected = -1
tileID = -1

