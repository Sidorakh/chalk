/// @description
hsp+=clamp(-hsp,-fric,fric);
vsp+=grav;
x+=hsp;
y+=vsp;
image_angle=point_direction(0,0,hsp,vsp);
if (place_meeting(x,y,obj_block)) {
	splat(x,y,13,point_direction(0,0,hsp,vsp),hue,1);
	splat(x,y,10,irandom(360),hue,1.5);
	instance_destroy();
}