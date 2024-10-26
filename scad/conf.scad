include <NopSCADlib/core.scad>
include <NopSCADlib/vitamins/extrusions.scad>
include <NopSCADlib/vitamins/psus.scad>
include <NopSCADlib/vitamins/rails.scad>
include <NopSCADlib/vitamins/stepper_motors.scad>
include <NopSCADlib/vitamins/pcbs.scad>
include <NopSCADlib/vitamins/pulleys.scad>
include <NopSCADlib/vitamins/ball_bearings.scad>
include <NopSCADlib/vitamins/extrusion_brackets.scad>
include <NopSCADlib/vitamins/swiss_clips.scad>
include <NopSCADlib/vitamins/inserts.scad>
include <NopSCADlib/vitamins/spools.scad>
use <NopSCADlib/vitamins/rod.scad>

printed_z_motor_mount = true;

$fn = 72;
eta = 0.01;
clearance = 0.2;
th = 5;
pw = 300;
pd = 200;
ph = 200;
carriage_inserts = false;
insert_d = 5.2;
o_insert = [ "F1BM3",   5, 5.4, 5, 3, 5.4, 1.5, 4, 5.4 ];

pos_x = 50+cos($t*360);
pos_y = 50+sin($t*360);
pos_z = 90;
echo(str("$t = ", $t));
echo(str("pos = [", pos_x, ", ", pos_y, "]"));
delta_d = 392;
delta_r = delta_d/2;
delta_h = 1000;
arm_mount_w = 46;
arm_mount_h = 8;
arm_length = 255;
bed_mount_width = 140;
bed_diameter = 260;
upright_extrusion = E4040;
side_extrusion = E2020;
car = MGN12H_carriage;
car_rail = carriage_rail(MGN12H_carriage);
arm_mount_offset = carriage_length(car)/2-th*1.25;
motor_mount_offset = 59;
idler_mount_offset = 59;
belt_offset = 47;
bed_thickness = 4;
bed_height = 74+bed_thickness; // top of bed is 60+13+1+thickness
delta_effector_offset = 33.5;
effector_arm_w = arm_mount_w;
effector_thickness = 8;
effector_hole_r = 50/2;
ew = extrusion_width(upright_extrusion);
ew2 = extrusion_height(side_extrusion);

delta_triangle_r = delta_r*cos(60);
delta_triangle_l = delta_d*sin(60);
PSU_S_350 = S_300_12;
sp = spool_200x60;
sp_h = spool_height(sp);

rod_offset = delta_r-(carriage_height(car)+arm_mount_h+ew/2);
function tower_x(a, o = rod_offset) = o * cos(a);
function tower_y(a, o = rod_offset) = o * sin(a);
function dist(x1,y1,x2,y2) = sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));

pos_dist = sqrt(pos_x*pos_x+pos_y*pos_y);
upright_a_angle = 210; // front left
upright_a_x = tower_x(upright_a_angle);
upright_a_y = tower_y(upright_a_angle);
carriage_a_dist = dist(upright_a_x, upright_a_y, pos_x, pos_y)-delta_effector_offset;
carriage_a_z_offset = sqrt(arm_length*arm_length-carriage_a_dist*carriage_a_dist);
carriage_a_arm_angle_v = acos(carriage_a_z_offset/arm_length);
carriage_a_arm_angle_h = asin(pos_dist*.5/carriage_a_dist);
carriage_a_h = bed_height+carriage_a_z_offset;
echo(str("upright_a = ", upright_a_angle,
         " = [", upright_a_x, ", ", upright_a_y, "]"));

upright_b_angle = 90;  // middle back
upright_b_x = tower_x(upright_b_angle);
upright_b_y = tower_y(upright_b_angle);
carriage_b_dist = dist(upright_b_x, upright_b_y, pos_x, pos_y)-delta_effector_offset;
carriage_b_z_offset = sqrt(arm_length*arm_length
                           -carriage_b_dist*carriage_b_dist);
carriage_b_arm_angle_v = acos(carriage_b_z_offset/arm_length);
carriage_b_arm_angle_h = asin(pos_dist*.5/carriage_b_dist);
carriage_b_h = bed_height+carriage_b_z_offset;
echo(str("upright_b = ", upright_b_angle,
         " = [", upright_b_x, ", ", upright_b_y, "]"));

upright_c_angle = 330; // front right
upright_c_x = tower_x(upright_c_angle);
upright_c_y = tower_y(upright_c_angle);
carriage_c_dist = dist(upright_c_x, upright_c_y, pos_x, pos_y)-delta_effector_offset;
carriage_c_z_offset = sqrt(arm_length*arm_length
                           -carriage_c_dist*carriage_c_dist);
carriage_c_arm_angle_v = acos(carriage_c_z_offset/arm_length);
carriage_c_arm_angle_h = asin(pos_dist*.5/carriage_c_dist);
carriage_c_h = bed_height+carriage_c_z_offset;
echo(str("upright_c = ", upright_c_angle,
         " = [", upright_c_x, ", ", upright_c_y, "]"));

M6_rubber_washer = [
  "M6", 6, 12.5, 1.5, true, 10.6,  9.9, 1.9, M6_penny_washer];
m3_insert = ["M3x5", 5, 5, 4.2, 3, 4.2, 0.5, 4.2, 4.2,   2, 0.6];
m4_insert = ["M4x5", 5, 6,   5, 4, 5.2, 0.5, 5.2, 5.2, 2.5, 0.6];

psu_w = psu_width(PSU_S_350);
psu_h = psu_height(PSU_S_350);
psu_l = psu_length(PSU_S_350);
psu_cover_l = 50;

ms = medium_microswitch;
car_screw = M3_cap_screw;

module extrusion_screw(s, l, n = M4_sliding_t_nut) {
  screw_and_washer(s, l);
  tz(-l+nut_thickness(n)) vflip() sliding_t_nut(n);
}

function screw_clearance_d(t) = 2 * screw_clearance_radius(t);
function screw_d(t) = 2 * screw_radius(t);
function screw_head_d(t) = 2 * screw_head_radius(t);
function screw_head_h(t) = screw_head_height(t);
function washer_h(t) = washer_thickness(t);
function washer_od(t) = washer_diameter(t);
function ball_bearing_h(t) = bb_width(t);
function ball_bearing_od(t) = bb_diameter(t);
function ball_bearing_id(t) = bb_bore(t);
function carriage_total_h(t) = carriage_height(t);
function carriage_l(t) = carriage_length(t);
function carriage_w(t) = carriage_width(t);
function pulley_od(t) = 12.22; // TOFIX
function pulley_length(t) = 16.2; // TOFIX
function pulley_belt_center(t) = 11.5;
function nut_h(t) = nut_thickness(t);
function nut_flats_d(t) = 2 * nut_flat_radius(t);
function screw_tap_d(t) = 2 * screw_pilot_hole(t);
function carriage_screw_gap_l(t) = carriage_pitch_x(t);
function carriage_screw_gap_w(t) = carriage_pitch_y(t);

M3_tnut = 0;
M4_tnut = 1;
M5_tnut = 2;
module tnut(t) {
  rz(90) ry(180) {
    sliding_t_nut(t == M3_tnut ? M3_sliding_t_nut :
                  t == M4_tnut ? M4_sliding_t_nut :
                  M5_sliding_t_nut);
  }
}
function screw_for(l) = (l <= 8 ? 8 :
                         (l <= 10 ? 10:
                          (l <= 12 ? 12 :
                           (l <= 14 ? 14 :
                            (l <= 16 ? 16 :
                             ceil(l / 5) * 5)))));

module screw_washer(t, l) {
  screw_and_washer(t, screw_for(l+washer_h(screw_washer(t))));
}

module screw_washer_nut(t, l) {
  n = screw_nut(t);
  w = screw_washer(t);
  tl = l + washer_h(w) + nut_h(n);
  sl = screw_for(tl);
  screw_and_washer(t, sl);
  explode([0, 0, -10]) tz(-l-nut_h(n)) nut(n);
}

module screw_washer_nut_up(t, l) {
  mirror([0, 0, 1]) {
    screw_washer_nut(t, l);
  }
}

module screw_washer_washer_nut(t, l) {
  n = screw_nut(t);
  w = screw_washer(t);
  tl = l + washer_h(w) * 2 + nut_h(n);
  sl = screw_for(tl);
  screw_and_washer(t, sl);
  tz(-l) nut_washer_up(n);
}

module screw_washer_washer_nut_up(t, l) {
  mirror([0, 0, 1]) {
    screw_washer_washer_nut(t, l);
  }
}

module screw_up(t, l) ry(180) screw(t, screw_for(l));
module screw_washer_up(t, l) ry(180) screw_washer(t, l);

module nut_washer_up(t) {
  mirror([0, 0, 1]) {
    nut_washer(t);
  }
}

module nut_washer(t) {
  tz(exploded() ? -4 : 0) {
    nut_and_washer(t);
  }
}

module inside_hidden_corner_bracket() {
  extrusion_inner_corner_bracket(E20_inner_corner_bracket);
}

module iec_socket() {
  rz(90) iec(IEC_320_C14_switched_fused_inlet);
}

function iec_socket_screw_gap() = iec_pitch(IEC_320_C14_switched_fused_inlet);
function iec_socket_cut_out_h() = iec_body_w(IEC_320_C14_switched_fused_inlet);
function iec_socket_cut_out_w() = iec_body_h(IEC_320_C14_switched_fused_inlet);
function iec_socket_back_clearance_d() = 25;
module duet_wifi() pcb(DuetE);
module duet_wifi_mount_holes() pcb_hole_positions(DuetE) children();
duet_th = pcb_thickness(DuetE);
duet_w = pcb_width(DuetE);
duet_h = pcb_length(DuetE);
duet_clearance = 20;
duet_standoff_h = 2;
duet_mount_w = duet_w+th*2+ew+duet_clearance;
duet_mount_pitch = 60;
duet_mount_offset = 10;

print_color = [0.7, 0.2, 0.7];
flex_print_color = [0.7, 0.2, 0.2];
aluminium_color = grey(50);
screw_color = grey(80);
black_aluminium_color = [0.2, 0.2, 0.2];
black_delrin_color = [0.2, 0.2, 0.2];
bed_color = "#dedede7f";
bottom_belt_color = [0.6,0.6,0.2];
top_belt_color = [0.7,0.2,0.2];
cf_color = "grey";

M12_toothed_washer =
  ["M12 Toothed Washer", 12, undef, 1, false, 21.5, undef, undef, undef];
M12_probe_nut_depth = 4;
M12_probe_nut = ["M12 Probe nut", 12, 17, 4, undef, M12_toothed_washer,
  M12_probe_nut_depth, 0];
probe_offset = [25, 0, 3]; // Z is position not sensing offset obviously
hotend_mount_screw = M3_cap_screw;
hotend_offset = -2;
idler_screw = M3_cap_screw;
motor_screw = M3_cap_screw;
pcb_mount_screw = M3_cap_screw;
ex_screw = M4_cap_screw;
ex_screw_l = 10;
nema_plate_screw = M5_low_profile_screw;
ex_print_screw = M4_flanged_screw;
ex_tap_screw = M5_flanged_screw;
bed_level_screw = M5_cap_screw;
microswitch_screw = M3_cap_screw; // Tap the microswitch
foot_screw = ex_tap_screw;
psu_screw = M4_cap_screw;
psu_low_screw = M4_flanged_screw;
opulley = GT2x20ob_pulley; // TOFIX: GT2x20_ooznest_pulley;

z_car = MGN15H_carriage;
z_rail = carriage_rail(z_car);
z_car_l = carriage_l(z_car);
z_car_w = carriage_w(z_car);
z_car_h = carriage_total_h(z_car);
y_car = MGN15H_carriage;
y_rail = carriage_rail(y_car);
y_car_l = carriage_l(y_car);
y_car_w = carriage_w(y_car);
y_car_h = carriage_total_h(y_car);
x_car = MGN12H_carriage;
x_rail = carriage_rail(x_car);
x_car_l = carriage_l(x_car);
x_car_h = ew+carriage_total_h(x_car)+(screw_clearance_d(car_screw)+th)*2+th/2;
pulley_d = pulley_od(opulley);
belt_width = 1.38;
belt_h = 6;
cl = 0.2;
idler_h = ball_bearing_h(BBF623)*2+washer_h(M3_washer)*3;
acme_nut_w = 12;

// offset from fd/2 to z shaft
z_shaft_offset = ew+z_car_h+th+ew+acme_nut_w/2;

fw = pw+252;
fd = pd+194;
fh = ph+230;

//pos = [cos(360*$t)*pw/2, sin(360*$t)*pd/2, sin(720*$t)*ph/2+100];
pos = [pw/4, pd/2, 100];
y_rail_l = 300;
y_rail_offset = 22;

y_bar_h = fh-ew*2-10; // top of y bar 2040 extrusion == bottom of y rail
x_bar_l = fw-ew*4-22;
x_rail_l = x_bar_l - 50;
x_bar_h = y_bar_h-ew/2;
y_bar_w = fw/2-ew*2;
z_bar_l = y_bar_h-ew*3;
z_rail_l = ph+100;
z_offset = 44;

hotend_mount_h = carriage_total_h(x_car)+ew+screw_clearance_d(car_screw)+th*1.5;
motor_offset = sqrt(2*NEMA_width(NEMA17_47)*NEMA_width(NEMA17_47)) / 2;
motor_hole_offset = sqrt(2*NEMA_hole_pitch(NEMA17_47)*NEMA_hole_pitch(NEMA17_47)) / 2;

bottom_belt_h = th-8-pulley_belt_center(opulley);
top_belt_h = th-5.5-(pulley_length(opulley)-pulley_belt_center(opulley));

motor_x = y_bar_w-motor_hole_offset+ew/2;
motor_y = -fd/2+motor_offset+ew/2;
motor_z =  y_bar_h+th;

bbr = (ball_bearing_od(BBF623)+belt_width)/2;
pbr = (pulley_od(opulley)+belt_width)/2;
idler_offset = motor_hole_offset-pbr+bbr;

module corner_extrusion_positions(both = true) {
  rz(30) txyz(-30, -1*(35-(ew2/2+th)), ew2/2)
    children();
  if (both) {
    mirror([0,1,0]) rz(30) txyz(-30, -1*(35-(ew2/2+th)), ew2/2)
    children();
  }
}

module extrusion_aligner(e = E2020, h=1, l = 100) {
  w = extrusion_channel_width(e);
  hull() {
    rcc([w, l, eta]);
    tz(h-eta) rcc([w-h*2, l, eta]);
  }
}

module extrusion_cut(e = E2020, l = 100, a = [0, 90, 180, 270]) {
  w = extrusion_width(e);
  tz(l/2) difference() {
    cc([w, w, l]);
    for (r = a) {
      rz(r) tx(w/2+eta) rz(-90) rx(90) extrusion_aligner(e, l = l+eta);
    }
  }
}
