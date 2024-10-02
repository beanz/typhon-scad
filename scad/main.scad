//! Cerberus-revised for MGN rails
include <conf.scad>
include <lazy.scad>
include <vitamins.scad>

use <bottom.scad>
use <carriage.scad>
use <top.scad>

echo(delta_triangle_l-60);
//! Insert PSU

module main_assembly()
  pose([76.7, 0, 13.1], [6.53, -16.48, 139.66]) assembly("main") {

  for (a = [0, 120, 240]) {
    rz(a) tx(delta_r) {
      upright_assembly();
      bottom_corner_assembly();
      tz(delta_h+20+th) rx(180) top_corner_assembly();
      tx(-belt_offset) upright_belt();
    }
  }
  color("silver") render() tz(bed_height-bed_thickness)
    cylinder(d=bed_diameter, h=bed_thickness);
}

module upright_belt() {
  bottom_r = pulley_hub_dia(opulley)/2;
  bottom_offset = 60/2;
  top_r = bb_diameter(BBF625)/2;
  top_offset = delta_h + ew2/2;
  rz(90) rx(90)
    belt(GT2x6, [
      [-bottom_r+1, carriage_height+arm_mount_offset+th, 0],
      [-bottom_r+1, carriage_height+arm_mount_offset, 0],
      [-bottom_r+3, carriage_height+arm_mount_offset-3, 0],
      [-bottom_r+7, carriage_height+arm_mount_offset-7, 2],
      [-bottom_r, carriage_height+arm_mount_offset, 0],
      [0, top_offset, top_r],
      [0, bottom_offset, bottom_r],
      [-bottom_r+6, carriage_height-10, 6],
      [-bottom_r+10, carriage_height-25, 2],
      [-bottom_r+10.5, carriage_height-23, 0],
      [-bottom_r+10.5, carriage_height-11, 0],
    ], open = true, auto_twist = false);
}

module upright_assembly() {
  assembly("upright") {
    tz(ew2) extrusion(upright_extrusion, delta_h, center = false);
    txz(-ew/2, -400+delta_h) ry(-90) rz(180) {
      rail(carriage_rail(car), 800);
    }
    txz(-ew/2, carriage_height) ry(-90) rz(180) {
      carriage_assembly();
    }
  }
}

if ($preview) {
  $explode = 0;
  main_assembly();
  //upright_assembly();
  //upright_belt();
}
