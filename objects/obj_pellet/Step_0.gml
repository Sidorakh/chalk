/// @description Pellet logic
//Movement
//hsp+=clamp(-hsp,-pellet_fric,pellet_fric);
hsp*=pellet_fric;
vsp+=pellet_grav;
x+=hsp;
y+=vsp;

//Colors
if (image_blend == c_white) {
	image_blend = make_color_hsv(hue%255,sat,val);
}

//Angle
image_angle=point_direction(0,0,hsp,vsp);

//Destroy
if (place_meeting(x,y,obj_block)) {
	splat(x,y,5,point_direction(0,0,hsp,vsp),hue,1);
	splat(x,y,5,irandom(360),hue,1.5);
	instance_destroy();
}