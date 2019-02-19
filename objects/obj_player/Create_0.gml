/// @description
enum States{
	normal,
	wall,
	dead,
	wj,
}
hsp=0;
vsp=0;
max_hsp=6;
accel=1;
air_accel=0.8;
grav=0.7;
fric=0.6;
air_fric=0.2;
hue=0;
air_jumps=1;
jump_short=-7;
jump_speed=-14;
air_jump_speed=-13;
max_fall_speed=10;
wall_slide_speed=3;
xstretch=1;
ystretch=xstretch;
wj_in_hsp=8;
wj_in_vsp=-14;
wj_in_time=10;
wj_out_hsp=10;
wj_out_vsp=-7;
wj_out_time=15;
wj_timer=0;
state=States.normal;
rtime=0;
ltime=0;