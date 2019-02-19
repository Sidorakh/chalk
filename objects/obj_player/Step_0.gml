/// @description Player state machine
//Settings (middle click)
#region Controls

var rl = 0,
    ud = 0,
    jump_hold = 0,
    on_ground = false,
    wall_right = false,
    wall_left = false;

//Increase held time
rtime = (keyboard_check(vk_right) || keyboard_check(ord("D"))) ? rtime + 1 : 0;
ltime = (keyboard_check(vk_left) || keyboard_check(ord("A"))) ? ltime + 1 : 0;

//Newer inputs override older ones
if (rtime > 0 && (ltime == 0 || rtime < ltime)) {
    rl = 1;
}
if (ltime > 0 && (rtime == 0 || ltime < rtime)) {
    rl = -1;
}

//Collect all input and certain collision checks
ud = sign(keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up) +
    keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W")) -
    keyboard_check_pressed(ord("X")));
jump_hold = (keyboard_check(vk_up) || keyboard_check(ord("W")) || keyboard_check(ord("X")));
on_ground = place_meeting(x, y + 1, obj_block);
wall_right = place_meeting(x + 1, y, obj_block);
wall_left = place_meeting(x - 1, y, obj_block);

#endregion

#region Logic

#region State Machine

switch (state) {
    case States.normal:
        //Set air jumps
        if (on_ground) {
            air_jumps = 1;
        }
		//Accelerate right or left
        if (rl != 0) {
            if (on_ground) {
                hsp += rl * accel;
            } else {
                hsp += rl * air_accel;
            }
		//Friction
        } else {
            if (on_ground) {
                hsp += clamp(-hsp, -fric, fric);
            } else {
                hsp += clamp(-hsp, -air_fric, air_fric);
            }
        }
		//Max speed
        hsp = clamp(hsp, -max_hsp, max_hsp);
		//Jumping
        if (ud == -1) {
            if (on_ground) {
				//Grounded
                vsp = jump_speed;
                ystretch = stretch_amount;
            } else if (air_jumps > 0) {
				//Aerial + Splatter effect
                for (var i = 0; i < jump_splat_num; i++) {
                    with(instance_create_layer(x, y, layer, obj_pellet)) {
                        var newdir = (i * jump_splat_dir) + 
							irandom_range(-jump_splat_rng, jump_splat_rng);
                        hsp = lengthdir_x(jump_splat_spd, newdir);
                        vsp = lengthdir_y(jump_splat_spd, newdir);
                        hue = irandom(255);
                    }
                }
                air_jumps--;
                vsp = air_jump_speed;
            }
        }
		//Gravity
        if (!on_ground) {
            vsp = min(vsp + grav, max_fall_speed);
			//Short hop
            if (!jump_hold && vsp < jump_short) {
                vsp = jump_short;
            }
			//Transition to wall slide state
            if (vsp > 0 && ((wall_right) || (wall_left))) {
                state = States.wall;
            }
        }
        break;
    case States.wall:
		//Lowered gravity
        vsp = min(vsp + grav, wall_slide_speed);
		
		//Wall jump begin
        if (ud == -1) {
            if (wall_right) {
                if (rl == 1) {
					//Jump in
                    hsp = -wj_in_hsp;
                    vsp = wj_in_vsp;
                    wj_timer = wj_in_time;
                } else {
					//Jump out 
                    hsp = -wj_out_hsp;
                    vsp = wj_out_vsp;
                    wj_timer = wj_out_time;
                }
            } else if (wall_left) {
                if (rl == -1) {
					//Jump in
                    hsp = wj_in_hsp;
                    vsp = wj_in_vsp;
                    wj_timer = wj_in_time;
                } else {
					//Jump out
                    hsp = wj_out_hsp;
                    vsp = wj_out_vsp;
                    wj_timer = wj_out_time;
                }
            }
			//Transition to walljump state
            state = States.wj;
        }
		//Transition to normal state
        if (on_ground || (!wall_right && !wall_left) || 
			((wall_right && ltime > wall_slide_time) || 
			(wall_left && rtime > wall_slide_time))) {
            state = States.normal;
        }
        break;
    case States.wj:
		//End state on the ground
        if (on_ground) {
            state = States.normal;
        }
		//Air acceleration
        if (sign(rl) != sign(hsp)) {
            hsp += rl * air_accel;
        }
		//Air friction
        hsp += clamp(-hsp, -air_fric, air_fric);
		//Gravity
        vsp = min(vsp + grav, wall_slide_speed);
		//End state when the timer is up
        if (--wj_timer < 0) {
            state = States.normal;
        }
        break;
}

#endregion

#region Splatting

//While moving, create paint blobs all around
if (hsp != 0 || vsp != 0) {
    for (var i = 0; i < 4; i++) {
        splat(x, y, random_range(10, 16), (i * 90) + irandom_range(-45, 45), hue % 255, random_range(2, 3));
    }
}
//Slowly change color
hue += hue_change;

#endregion

#endregion

#region Collisions

//Horizontal and vertical loops
repeat(abs(hsp)) {
    if (!place_meeting(x + sign(hsp), y, obj_block)) {
        x += sign(hsp);
    } else {
        hsp = 0;
        break;
    }
}
repeat(abs(vsp)) {
    if (!place_meeting(x, y + sign(vsp), obj_block)) {
        y += sign(vsp);
    } else {
        xstretch = stretch_amount;
        vsp = 0;
        break;
    }
}

#endregion

#region Extra

//Handle the stretch animations
xstretch = lerp(xstretch, 1, stretch_back);
ystretch = lerp(ystretch, 1, stretch_back);

#endregion

#region Out of bounds

if (y > room_height + sprite_height) {
	room_reset();
}

#endregion