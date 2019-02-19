/// @description
if (place_meeting(x,y,obj_player)) {
	if (room_exists(room_next(room))) {
		var _name = room_get_name(room_next(room));
		if (string_pos("rm_lvl",_name)) {
			room_goto_next();
			return;
		}
	}
	// if no more levels
	room_goto(rm_menu);	
}