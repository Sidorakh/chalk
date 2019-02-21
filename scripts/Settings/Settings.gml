///The settings script holds macros and enums that control the gameplay
//Blocks
#macro size 32
#macro half size/2

//Paint blobs
enum Paint{
	X, //X
	Y, //Y
	S, //Speed
	D, //Direction
	C, //Color
	SC,//Scale
}
#macro blob_size_change_max 0.9
#macro blob_size_change_min 0.7
#macro blob_speed_change_max 0.9
#macro blob_speed_change_min 0.85
#macro sat 100
#macro val 255

//Player
enum States{
	normal,
	wall,
	dead,
	wj,
}
#macro default_controller 0
#macro deadzone 0.3
#macro player_size 32
#macro half_ps player_size/2
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
#macro jump_splat_num 20
#macro jump_splat_dir 360/jump_splat_num
#macro jump_splat_spd_min 5
#macro jump_splat_spd_max 15
#macro jump_splat_rng 10
#macro stretch_amount 1.5
#macro stretch_back 0.2
#macro corner_rise player_size/8
#macro corner_dip player_size/6.4
#macro hue_change 0.5

//Pellets
#macro pellet_grav 0.3
#macro pellet_fric 0.99