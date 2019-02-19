/// @description
if (mouse_check_button(mb_left)) {
	splat(mouse_x,mouse_y,16,irandom(360),(get_timer()/1000) mod 255,3);
}
//if (keyboard_check(vk_anykey)) {
//	room_goto_next();
//}

if (mouse_check_button_pressed(mb_left)) {
	var _cx = room_width/2;
	var _cy = room_height/2;
	
	if(clamp(mouse_y,542-20,542+20)==mouse_y) {
		if (clamp(mouse_x,_cx/2-160,_cx/2+160)==mouse_x) {
			//show_message("Start Game");
			room_goto(rm_lvl1);
		} else if (clamp(mouse_x,_cx+_cx/2-160,_cx+_cx/2+160)==mouse_x) {
			show_message("I don't exist yet");
		}
	}
	
	
	
	draw_text(_cx/2,_cy+_cy/2,"Start Game");
	draw_text(_cx/2+_cx,_cy+_cy/2,"Custom Levels");
}