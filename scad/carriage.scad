include <conf.scad>
include <lazy.scad>
include <shapes.scad>

include <vitamins.scad>

module carriage_assembly() {
  assembly("carriage") {
    carriage(car);
    tz(carriage_height(car)) rz(90) carriage_stl();
    carriage_hole_positions(car)
      tz(th) screw_and_washer(M3_cap_screw, 10);
    mxz(arm_mount_w/2)
      txz(-arm_mount_offset, carriage_height(car)+arm_mount_h) {
        ty(traxxas_axle_length(Traxxas_5347)/2)
          rx(90) traxxas(Traxxas_5347);
        ty(traxxas_axle_length(Traxxas_5347))
          rx(-90) screw_and_washer(M3_cap_screw, 20);
        ty(-th*1.5) explode([0, 0, 20], false) {
          rx(90) washer(M3_washer);
          ty(-washer_thickness(M3_washer))
            rx(90) nut(M3_nut, nyloc = true);
        }
    }
  }
}

module carriage_stl() {
  mount_height = arm_mount_h;
  m3_nut_trap_h = nut_thickness(M3_nut, nyloc = true)
                  + washer_thickness(M3_washer)+clearance;
  arm_offset = arm_mount_offset;
  stl("carriage") color(print_color) render() {
    difference() {
      union() {
        ty(arm_offset) hull() {
          rrcf([arm_mount_w-4, th*2.5, th]);
          tz(mount_height) ry(90)
            cylinder(d = 8, h = arm_mount_w, center = true, $fn = 32);
        }
        hull() {
          ty(arm_offset) rrcf([arm_mount_w-4, th*2.5, th]);
          rrcf([carriage_width(car), carriage_length(car), th]);
        }
      }

      // belt clearance
      myz(8) tyz(arm_offset, mount_height+8/2)
        rc([th,20,th]);

      // clearance for traxis rod ends
      ty(arm_offset) {
        myz(arm_mount_w/2) tz(mount_height+2)
          ry(-45) tx(20) rcc([40,40,40]);

        // holes for rod mount m3 screw + washer + nylon nut
        myz(arm_mount_w/2) tz(mount_height) {
          ry(90) tz(-(th*2.5+m3_nut_trap_h))
            cylinder(r=screw_clearance_radius(M3_cap_screw),
                     h = arm_mount_w); 
          hull() {
            for (z = [0, 4]) tz(z) {
              ry(90) tz(-(th*1.5+m3_nut_trap_h))
                cylinder(d = washer_diameter(M3_washer)+2*clearance,
                         h = m3_nut_trap_h);
            }
          }
        }
      }
      // carriage mount holes
      tz(-carriage_height(car)) carriage_hole_positions(car) {
        cylinder(r = screw_clearance_radius(M3_cap_screw),
                 h = 100, center = true);
        tz(th) cylinder(d = washer_diameter(M3_washer)+2*clearance,
                        h = 100);
      }
    }
  }
}

if ($preview) {
  $explode = 0;
  carriage_assembly();
}

