/// @description Insert description here
// You can write your code in this editor

if (!surface_exists(menu_surf)) {
	menu_surf = surface_create(room_width,room_height);
	if (init == true) {		// already made
		buffer_set_surface(menu_buff,menu_surf,0,0,0);
	} else {
		surface_set_target(menu_surf);
		
		var _cx = room_width/2;
		var _cy = room_height/2;

		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_font(fnt_title);
		
		
		
		draw_set_color(c_black);
		draw_text(_cx/2,_cy+_cy/2,"Start Game");
		draw_text(_cx/2+_cx,_cy+_cy/2,"Custom Levels");
		
		gpu_set_blendmode(bm_subtract);
		for (var _x=0;_x<room_width;_x+=16) {
			for (var _y=0;_y<room_height;_y+=16) {
				draw_sprite_ext(spr_circle,0,_x,_y,0.5,0.5,0,c_white,1);
			}
		}
		gpu_set_blendmode(bm_normal);
		draw_set_color(c_white);
		
		surface_reset_target();
		
		buffer_get_surface(menu_buff,menu_surf,0,0,0);
	}
}	

draw_surface(menu_surf,0,0);