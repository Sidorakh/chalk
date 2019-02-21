/// @description Player draw
var xsize=(half_ps*xstretch);
var ysize=(half_ps*ystretch);

//The player is a primitive that changes based on movements
draw_primitive_begin(pr_trianglestrip);
draw_vertex_color(x-xsize,y-ysize-((hsp/max_hsp)*-corner_rise),c_white,1);
draw_vertex_color(x+xsize,y-ysize-((hsp/max_hsp)*corner_rise),c_white,1);
draw_vertex_color(x-xsize,y+ysize-((vsp/jump_speed)*-corner_dip*sign(hsp)),c_white,1);
draw_vertex_color(x+xsize,y+ysize-((vsp/jump_speed)*corner_dip*sign(hsp)),c_white,1);
draw_primitive_end();