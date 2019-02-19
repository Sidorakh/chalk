/// @description Player draw
var xsize=(half*xstretch);
var ysize=(half*ystretch);

//The player is a primitive that changes based on movements
draw_primitive_begin(pr_trianglestrip);
draw_vertex_color(x-xsize,y-ysize-((hsp/max_hsp)*-4),c_white,1);
draw_vertex_color(x+xsize,y-ysize-((hsp/max_hsp)*4),c_white,1);
draw_vertex_color(x-xsize,y+ysize-((vsp/jump_speed)*-5*sign(hsp)),c_white,1);
draw_vertex_color(x+xsize,y+ysize-((vsp/jump_speed)*5*sign(hsp)),c_white,1);
draw_primitive_end();