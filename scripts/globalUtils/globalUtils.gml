// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro CELL_WIDTH 116
#macro CELL_HEIGHT CELL_WIDTH/2
#macro VIEW_W 1920
#macro VIEW_H 1080
#macro WINDOW_W display_get_width() / 2
#macro WINDOW_H display_get_height() /2
#macro CLIENT_W browser_width
#macro CLIENT_H browser_height
#macro MAIN_CAM view_camera[0]


function print(msg){
	show_debug_message(msg)	
}
function CamManager() constructor{
		camW = VIEW_W
		camH = VIEW_H
		static updateCam = function(){
			view_enabled = true
			view_set_visible(0, true)
			camera_set_view_size(MAIN_CAM, camW, camH)
			//camera_set_view_pos(mainCamera, room_width, -room_height/2)
			display_set_gui_size(VIEW_W, VIEW_H)	
		
			var surfSize = {
				width: os_browser? CLIENT_W: WINDOW_W*2,
				height: os_browser? CLIENT_H: WINDOW_H*2,
			}
			var windowSize = {
				width: os_browser? CLIENT_W/2:  WINDOW_W,
				height: os_browser? CLIENT_H/2: WINDOW_H,
			}
			window_set_size(windowSize.width, windowSize.height)
			surface_resize(application_surface, surfSize.width, surfSize.height)
			window_center()
		}
}
function TileStruct(tName = -1, tX = 0, tY = 0, layElevation = 0)constructor{
	tileName = tName
	yOffset = 0
	layerElevation = layElevation * CELL_HEIGHT
	x = tX 
	y = tY	
	hovered = false
	alpha = 1
	triangles =[]
	//static drawTile = function(camPos){
		
	//	//if(point_in_rectangle(x, y, camPos.camX, camPos.camY, camPos.camX2, camPos.camY2))
	//	{
	//		//if(tileName != -1)
	//		{
	//			//alpha = lerp(alpha, hovered? 0.2: 1, 0.2)
	//			var sprHeight = sprite_get_height(tileName)
				
	//			draw_sprite_ext(tileName, 0, x, y-(sprHeight-CELL_HEIGHT) - layerElevation, 1, 1, 0, c_white, alpha) 
	//			//hovered = false
	//		}
	//	}
		
	//}
	
}


