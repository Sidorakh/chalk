/// @description Surface management
//Create surface
if (!surface_exists(mysurf)) {
	mysurf=surface_create(size*image_xscale,size*image_yscale);
	clear=true;
}

//Recreate from buffer
if (clear) {
	clear=false;
	buffer_set_surface(mybuff,mysurf,0,0,0);
	//surface_set_target(mysurf);
	//draw_clear_alpha(c_white,0);
	//surface_reset_target();
}

//Draw to screen and save to buffer
if (surface_exists(mysurf)) {
	draw_surface(mysurf,x,y);
	buffer_get_surface(mybuff,mysurf,0,0,0);
}