/// @description Follow the player
if (instance_exists(obj_player)) {
	var _x = clamp(obj_player.x - vw/2,0,room_width-vw);
	var _y = clamp(obj_player.y - (vh)*3/4,0,room_height-vh);
	
	camera_set_view_pos(cam,_x,_y);
}