/// @description Insert description here
// You can write your code in this editor
#macro VIEW_X camera_get_view_x(MAIN_CAM)
#macro VIEW_Y camera_get_view_y(MAIN_CAM)
if(keyboard_check_pressed(vk_escape)) game_end()
if(keyboard_check_pressed(ord("R"))) room_restart()
if(keyboard_check_pressed(ord("Q"))) ds_grid_shuffle(worldGrid)

var tilesListLen = array_length(tilesList)
currentTile += (mouse_wheel_down() - mouse_wheel_up())
currentTile = currentTile < 0 ? array_length(tilesList)-1: (currentTile > tilesListLen -1? 0: currentTile)



with(mousePosition)
{
	x = lerp(x, mouse_x, 0.1)
	y = lerp(y, mouse_y, 0.1)
}

if(keyboard_check(vk_space)) {
	var spd = 0.2
	camera_set_view_pos(MAIN_CAM, floor(mousePosition.x-VIEW_W/2), floor( mousePosition.y-VIEW_H/2))	
}
with(mousePrevious)
{
	x = mouse_x
	y = mouse_y
}
//instance_deactivate_all(true)
//instance_activate_region(viewX, viewY, viewX+VIEW_W, VIEW_H, true)
var tile = tilesList[currentTile]
var tileSprite = variable_struct_get(tiles, tile)
currentTileSelected = tileSprite
//oCursor.sprite_index = tileSprite
var mouseInTriangle = function(triangleStruct){
	return(point_in_triangle(mouse_x, mouse_y, 
			triangleStruct.x, triangleStruct.y, triangleStruct.x2, triangleStruct.y2, triangleStruct.x3, triangleStruct.y3)
		)
}
//with(oTile){
//	hovered = position_meeting(mouse_x, mouse_y, id)
//	if(hovered)
//	{
//		other.tileID = id
//		if(mouse_check_button(mb_left)){
//			var spr =  oBuilderManager.currentTileSelected		
//			sprite_index = spr
//		}
		
		
//	}
	
//}
