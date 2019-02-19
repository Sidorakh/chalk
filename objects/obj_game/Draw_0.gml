/// @description Render all paint blobs
for(var i=0;i<ds_list_size(global.splatters);i++) {
	//Grab the array of the current blob
	var _paint=global.splatters[|i];
	//Get all of the surfaces in collision, and draw to them
	ds_list_clear(global.col_list);
	var _size=abs(size*_paint[@Paint.SC]);
	var _x=_paint[@Paint.X];
	var _y=_paint[@Paint.Y];
	var _c=_paint[@Paint.C];
	var _sc=_paint[@Paint.SC];
	if (collision_rectangle_list(_x-_size,_y-_size,_x+_size,_y+_size,obj_block,false,true,global.col_list,false)) {
		for(var m=0;m<ds_list_size(global.col_list);m++) {
			//Get the block's surface
			var _inst=global.col_list[|m];
			var _surf=_inst.mysurf;
			if (surface_exists(_surf)) {
				surface_set_target(_surf);
				draw_sprite_ext(spr_circle,0,_x-_inst.x,_y-_inst.y,_sc,_sc,irandom(360),_c,1);
				//draw_circle_color(_x-_inst.x,_y-_inst.y,_r,_c,_c,false);
				surface_reset_target();
			}
		}
	}
}