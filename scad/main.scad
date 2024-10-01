//! Cerberus-revised for MGN rails
include <conf.scad>
include <lazy.scad>
include <vitamins.scad>

use <belts.scad>
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
  bottom_offset = 60/2 - bottom_r;
  top_r = bb_diameter(BBF625)/2;
  top_offset = delta_h + ew2/2 + top_r;
  echo("bottom_r", bottom_r);
  echo("top_r", top_r);
  rz(90) rx(90)
    mbelt(GT2x6,
      [
       [-bottom_r, carriage_height+5],
       [-top_r,    top_offset],
       [ top_r,    top_offset],
       [ bottom_r, bottom_offset],
       [-bottom_r, bottom_offset],
       [-bottom_r, carriage_height-10],
       [-bottom_r+2.5, carriage_height-7.5],
       [-bottom_r+5, carriage_height-7.5],
       [-bottom_r+7.5, carriage_height-10],
      ]);
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
}
