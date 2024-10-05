include <conf.scad>
include <lazy.scad>
include <shapes.scad>

module effector_assembly() assembly("effector") {
  effector_stl();
}

module effector_stl() {
  thickness = 8;
  hole_radius = 50/2;
  stl("effector") color(print_color) render() {
    difference() {
      union() {
        cylinder(r = effector_hole_r+thickness,
                 h = thickness, center = true);
        for (a = [0, 120, 240]) hull() {
          for (j = [.5, 1]) {
            rz(a-30) tx(delta_effector_offset*j)
              rx(90) cylinder(r = thickness/2,
                              h = arm_mount_w, center = true);
          }
        }
      }
      // center hole
      cylinder(r = effector_hole_r-thickness/2,
               h = thickness+2*eta, center = true);

      // mount holes
      for (n = [0:5]) rz(30+n*60) tx(hole_radius) {
        cylinder(r=screw_clearance_radius(M3_cap_screw),
                 h=thickness+eta, center = true);
      }
    }
  }
}

if ($preview) {
  $explode = 0;
  effector_assembly();
  //effector_stl();
}

