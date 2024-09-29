//! Cerberus-revised for MGN rails
include <conf.scad>
include <lazy.scad>
include <vitamins.scad>

//use <belts.scad>
use <bottom.scad>
use <carriage.scad>
use <top.scad>

echo(delta_triangle_l-60);
//! Insert PSU

module main_assembly()
  pose([76.7, 0, 13.1], [6.53, -16.48, 139.66]) assembly("main") {

  for (a = [0, 120, 240]) {
    rz(a) tx(delta_r) {
      tz(20) upright_assembly();
      bottom_corner_assembly();
      tz(delta_h+20+th) rx(180) top_corner_assembly();
    }
  }
  color("silver") render() tz(74) cylinder(d=bed_diameter, h=4);
}

module upright_assembly() {
  assembly("upright") {
    extrusion(upright_extrusion, delta_h, center = false);
    txz(-ew/2, -400+delta_h-ew2) ry(-90) rz(180) {
      rail(carriage_rail(car), 800);
      carriage_assembly();
    }
  }
}

if ($preview) {
  $explode = 0;
  main_assembly();
  //upright_assembly();
}
