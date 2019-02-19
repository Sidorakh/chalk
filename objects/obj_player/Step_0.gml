/// @description

#region Controls

var rl = 0,
    ud = 0,
    jump_hold = 0,
    on_ground = false,
    wall_right = false,
    wall_left = false;

rtime = (keyboard_check(vk_right) || keyboard_check(ord("D"))) ? rtime + 1 : 0;
ltime = (keyboard_check(vk_left) || keyboard_check(ord("A"))) ? ltime + 1 : 0;

if (rtime > 0 && (ltime == 0 || rtime < ltime)) {
    rl = 1;
}
if (ltime > 0 && (rtime == 0 || ltime < rtime)) {
    rl = -1;
}

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
        //Right left
        if (on_ground) {
            air_jumps = 1;
        }
        if (rl != 0) {
            if (on_ground) {
                hsp += rl * accel;
            } else {
                hsp += rl * air_accel;
            }
        } else {
            if (on_ground) {
                hsp += clamp(-hsp, -fric, fric);
            } else {
                hsp += clamp(-hsp, -air_fric, air_fric);
            }
        }
        hsp = clamp(hsp, -max_hsp, max_hsp);
        if (ud == -1) {
            if (on_ground) {
                vsp = jump_speed;
                ystretch = 1.5;
            } else if (air_jumps > 0) {
                for (var i = 0; i < 8; i++) {
                    with(instance_create_layer(x, y, layer, obj_pellet)) {
                        var newdir = (i * 45) + irandom_range(-10, 10);
                        hsp = lengthdir_x(14, newdir);
                        vsp = lengthdir_y(14, newdir);
                        hue = other.hue;
                    }
                }
                air_jumps--;
                vsp = air_jump_speed;
            }
        }
        if (!on_ground) {
            vsp = min(vsp + grav, max_fall_speed);
            if (!jump_hold && vsp < jump_short) {
                vsp = jump_short;
            }
            if (vsp > 0 && ((wall_right) || (wall_left))) {
                state = States.wall;
            }
        }
        break;
    case States.wall:
        vsp = min(vsp + grav, wall_slide_speed);
        if (ud == -1) {
            if (wall_right) {
                if (rl == 1) {
                    hsp = -wj_in_hsp;
                    vsp = wj_in_vsp;
                    wj_timer = wj_in_time;
                } else {
                    hsp = -wj_out_hsp;
                    vsp = wj_out_vsp;
                    wj_timer = wj_out_time;
                }
            } else if (wall_left) {
                if (rl == -1) {
                    hsp = wj_in_hsp;
                    vsp = wj_in_vsp;
                    wj_timer = wj_in_time;
                } else {
                    hsp = wj_out_hsp;
                    vsp = wj_out_vsp;
                    wj_timer = wj_out_time;
                }
            }
            state = States.wj;
        }
        if (on_ground || (!wall_right && !wall_left) || ((wall_right && ltime > 5) || (wall_left && rtime > 5))) {
            state = States.normal;
        }
        break;
    case States.wj:
        if (on_ground) {
            state = States.normal;
        }
        if (sign(rl) != sign(hsp)) {
            hsp += rl * air_accel;
        }
        hsp += clamp(-hsp, -air_fric, air_fric);
        vsp = min(vsp + grav, wall_slide_speed);
        if (--wj_timer < 0) {
            state = States.normal;
        }
        break;
}

#endregion

#region Splatting

if (hsp != 0 || vsp != 0) {
    for (var i = 0; i < 4; i++) {
        splat(x, y, random_range(10, 16), (i * 90) + irandom_range(-45, 45), hue % 255, random_range(2, 3));
    }
}
hue += 0.4;

#endregion

#endregion

#region Collisions

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
        xstretch = 1.5;
        vsp = 0;
        break;
    }
}

#endregion

#region Extra

xstretch = lerp(xstretch, 1, 0.2);
ystretch = lerp(ystretch, 1, 0.2);

#endregion