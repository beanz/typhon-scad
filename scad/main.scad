//! Cerberus-revised for MGN rails
include <conf.scad>
include <lazy.scad>
include <vitamins.scad>

use <bottom.scad>
use <effector.scad>
use <carriage.scad>
use <top.scad>

echo(delta_triangle_l-60);
//! Insert PSU

module main_assembly()
  pose([76.7, 0, 13.1], [6.53, -16.48, 139.66]) assembly("main") {

  rz(upright_a_angle) tx(delta_r) tower_a_assembly();
  rz(upright_b_angle) tx(delta_r) tower_b_assembly();
  rz(upright_c_angle) tx(delta_r) tower_c_assembly();
  txyz(pos_x,pos_y,pos_z+effector_thickness/2) effector_assembly();
  color("silver") render() tz(bed_height-bed_thickness)
    cylinder(d=bed_diameter, h=bed_thickness);
}

module tower_common() {
  bottom_corner_assembly();
  tz(delta_h+20+th) rx(180) top_corner_assembly();
}

module tower_a_assembly() assembly("tower_a") {
  upright_a_assembly();
  if (spectra_drive) {
    
  } else {
    tx(-belt_offset) upright_belt(carriage_a_h);
  }
  tower_common();
}

module tower_b_assembly() assembly("tower_b") {
  upright_b_assembly();
  if (spectra_drive) {
    
  } else {
    tx(-belt_offset) upright_belt(carriage_b_h);
  }
  tower_common();
}

module tower_c_assembly() assembly("tower_c") {
  upright_c_assembly();
  if (spectra_drive) {
    
  } else {
    tx(-belt_offset) upright_belt(carriage_c_h);
  }
  tower_common();
}

module upright_belt(carriage_h) {
  bottom_r = pulley_hub_dia(opulley)/2;
  bottom_offset = 60/2;
  top_r = bb_diameter(BBF625)/2;
  top_offset = delta_h + ew2/2;
  rz(90) rx(90)
    belt(GT2x6, [
      [-bottom_r+1, carriage_h+arm_mount_offset+th, 0],
      [-bottom_r+1, carriage_h+arm_mount_offset, 0],
      [-bottom_r+3, carriage_h+arm_mount_offset-3, 0],
      [-bottom_r+7, carriage_h+arm_mount_offset-7, 2],
      [-bottom_r, carriage_h+arm_mount_offset, 0],
      [0, top_offset, top_r],
      [0, bottom_offset, bottom_r],
      [-bottom_r+6, carriage_h-10, 6],
      [-bottom_r+10, carriage_h-25, 2],
      [-bottom_r+10.5, carriage_h-23, 0],
      [-bottom_r+10.5, carriage_h-11, 0],
    ], open = true, auto_twist = false);
}

module upright_a_assembly() assembly("upright_a") {
  upright(carriage_a_h, carriage_a_arm_angle_v, carriage_a_arm_angle_h);
}

module upright_b_assembly() assembly("upright_b") {
  upright(carriage_b_h, carriage_b_arm_angle_v, carriage_b_arm_angle_h);
}

module upright_c_assembly() assembly("upright_c") {
  upright(carriage_c_h, carriage_c_arm_angle_v, -carriage_c_arm_angle_h);
}

module upright(carriage_h, angle_v = 30, angle_h = 0) {
  tz(ew2) extrusion(upright_extrusion, delta_h, center = false);
  txz(-ew/2, -400+delta_h) ry(-90) rz(180) {
    rail(carriage_rail(car), 800);
  }
  txz(-ew/2, -800+delta_h) ry(-90) rz(180) {
    rail_guard_stl();
  }
  txz(-ew/2, carriage_h) ry(-90) rz(180) {
    carriage_assembly(angle_v, angle_h);
  }
}

module rail_guard_stl() stl("rail_guard") {
  rh = rail_height(carriage_rail(car));
  tx(ew/4) color(print_color) render() difference() {
    rrcf([ew/2,ew,rh], r = 3);
    tz(-eta) cylinder(r = screw_clearance_radius(M5_cap_screw),
             h = rh*2);
    tz(th) cylinder(d = 2*clearance+washer_diameter(M5_washer),
             h = rh*2);
  }
}

if ($preview) {
  $explode = 0;
  main_assembly();
  //upright_assembly();
  //upright_belt();
}
