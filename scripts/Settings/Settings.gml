///The settings script holds macros and enums that control the gameplay
//Paint blobs
enum Paint{
	X, //X
	Y, //Y
	S, //Speed
	D, //Direction
	C, //Color
	SC,//Scale
}

//Player
enum States{
	normal,
	wall,
	dead,
	wj,
}
#macro max_hsp 6
#macro accel 1
#macro air_accel 0.8
#macro grav 0.7
#macro fric 0.6
#macro air_fric 0.2
#macro jump_short -7
#macro jump_speed -14
#macro air_jump_speed -13
#macro max_fall_speed 10
#macro wall_slide_speed 3
#macro wall_slide_time 5
#macro wj_in_hsp 8
#macro wj_in_vsp -14
#macro wj_in_time 10
#macro wj_out_hsp 10
#macro wj_out_vsp -7
#macro wj_out_time 15
#macro jump_splat_num 12
#macro jump_splat_dir 360/jump_splat_num
#macro jump_splat_spd 14
#macro jump_splat_rng 10
#macro stretch_amount 1.5
#macro stretch_back 0.2
#macro hue_change 0.4

//Blocks
#macro size 32
#macro half size/2

//Pellets
#macro pellet_grav 0.3
#macro pellet_fric 0.1