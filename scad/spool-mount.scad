include <conf.scad>
include <lazy.scad>
include <shapes.scad>

module spool_mount_assembly() assembly("spool_mount") {
  spool_mount_stl();
  hole_w = 44;
  mxz(hole_w/2)
    tz(th) rz(90) extrusion_screw(M5_flanged_screw, 16, M5_sliding_t_nut);
  tz(-10) studding(8, 120, center = false);
  tz(th)
    rz(90) nut(M8_nut)
    tz(th+1) washer(M8_penny_washer)
    washer(M8_washer)
    tz(bb_width(BB608)/2) ball_bearing(BB608)
    washer(M8_washer) 
    nut(M8_nut);
  tz(120-10) rx(180)
    nut(M8_nut)
    washer(M8_penny_washer)
    washer(M8_washer)
    tz(bb_width(BB608)/2) ball_bearing(BB608)
    washer(M8_washer)
    nut(M8_nut);
}

module spool_mount_stl() {
  hole_w = 44;
  l = hole_w+th*3;
  mw = l-15*2;
  fh = th*2+nut_thickness(M8_nut)+1;
  stl("spool_mount") color(print_color) render() difference() {
    union() {
      hull() {
        mxz(mw/2) {
          cylinder(r = 15, h = th);
        }
      }
      cylinder(r=15, h = fh);
    }

    // nut trap
    tyz(15/2-(nut_radius(M8_nut)+1)/2, th)
      rcc([nut_flat_radius(M8_nut)*2+1, 15+nut_radius(M8_nut)+1, nut_thickness(M8_nut)+1]);

    // bar hole
    cylinder(d = 8+clearance*2, h = fh*3, center = true);

    // mount holes
    mxz(hole_w/2)
      cylinder(r=screw_clearance_radius(M5_cap_screw),
               h=th*3, center = true);
  }
}

  spool_mount_stl();
if ($preview) {
  $explode = 0;
  spool_mount_assembly();
  //spool_mount_stl();
}

