include <conf.scad>
include <lazy.scad>
include <shapes.scad>

include <vitamins.scad>

module carriage_assembly(angle_v = 30, angle_h = 0) {
  assembly("carriage") {
    carriage(car);
    tz(carriage_height(car)) rz(90) carriage_stl();
    carriage_hole_positions(car)
      tz(th) screw_and_washer(M3_cap_screw, 10);
      txz(-arm_mount_offset, carriage_height(car)+arm_mount_h) {
        arm_assembly(angle_v, angle_h);
        mxz(arm_mount_w/2) {
          ty(traxxas_axle_length(Traxxas_5347))
            rx(-90) screw_and_washer(M3_cap_screw, 20);
          ty(-th*1.5) explode([0, 0, 20], false) {
            rx(90) washer(M3_washer);
            ty(-washer_thickness(M3_washer))
              rx(90) nut(M3_nut, nyloc = true);
          }
        }
    }
    // tensioner screw + nut
    txyz(carriage_length(car)/2, 2.5,
         carriage_height(car)+arm_mount_h+3+(belt_width(GT2x6)+clearance)/2) {
      ry(90) {
        tz(8) screw(M3_cap_screw, 20);
        tz(-5) nut(M3_nut);
      }
      txz(-10, clearance) carriage_belt_tensioner_stl();
    }
  }
}
module carriage_belt_tensioner_stl() {
  belt_w = belt_width(GT2x6);
  stl("carriage_belt_tensioner") color(print_color) render()
  difference() {
    hull() {
      tx(-.5) cc([1,10,belt_w]);
      tx(-3) intersection() {
        cylinder(d = 10, h = belt_w, center = true);
        tx(-5) cc([6,12,belt_w*2]);
      }
    }
    ry(-90) cylinder(r = screw_clearance_radius(M3_cap_screw), h = 7);
  }
}

module carriage_stl() {
  mount_height = arm_mount_h;
  m3_nut_trap_h = nut_thickness(M3_nut, nyloc = true)
                  + washer_thickness(M3_washer)+clearance;
  arm_offset = arm_mount_offset;
  bottom_r = pulley_hub_dia(opulley)/2;
  top_r = bb_diameter(BBF625)/2;
  belt_gap = belt_thickness(GT2x6)*2 - belt_tooth_height(GT2x6);
  belt_w = belt_width(GT2x6)+clearance;
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
        tx(2) rrcf([16, carriage_length(car), mount_height+th/2+belt_w]);
      }

      // through belt clearance
      tx(-8) tyz(arm_offset, mount_height+8/2)
        rc([th,20,th]);

      // top belt grip
      txyz(top_r, arm_offset, mount_height+3) {
        hull() {
          ty(th*2) cylinder(d = belt_gap, h = belt_w);
          cylinder(d = belt_gap, h = belt_w);
        }
        hull() {
          cylinder(d = belt_gap, h = belt_w);
          txy(-5,-5) cylinder(d = belt_gap, h = belt_w);
        }
        hull() {
          txy(-7,-7) cylinder(d = 6, h = belt_w);
          txy(-5,-5) cylinder(d = belt_gap, h = belt_w);
        }
      }

      // bottom belt path
      txyz(bottom_r, -carriage_length(car)/2, mount_height+3) {
        // belt entry
        ty(5) rcc([belt_gap, 12, belt_w]);
        // tensioner cleanance
        txy(-5.5, 9) hull() {
          rcc([12, 1, belt_w]);
          ty(12) cylinder(d = 12, h = belt_w);
          txy(-6, 12) cylinder(d = belt_gap, h = belt_w);
        }
        // belt grip
        hull() {
          txy(-11, 20) cylinder(d = belt_gap, h = belt_w);
          txy(-11, 0) cylinder(d = belt_gap, h = belt_w);
        }

        // nut trap
        txyz(-5.5, 4, belt_w/2) {
          cc([clearance*2+nut_trap_flat_radius(M3_nut)*2, 
               nut_thickness(M3_nut)+clearance*2, nut_trap_radius(M3_nut)*2+clearance]);
          rx(90) cylinder(r = screw_radius(M3_cap_screw)+clearance,
                          h = 10, center = true);
        }
      }

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

module arm_assembly(angle_v = 30, angle_h = 0) assembly("arm") {
  t = Traxxas_5347;
  rod_length = arm_length - traxxas_length(t);
  ty(arm_mount_w/2+traxxas_axle_length(t)/2) rz(angle_h) ry(-angle_v) {
    ry(90) tz(traxxas_length(t)/2)
      carbon_fibre_rod(d = traxxas_rod_diameter(t),
                       l = rod_length);
    rx(90) tx(arm_length/2) myz(rod_length/2)
      tx(traxxas_length(t)/2) ry(180) traxxas(t);
  }
  ty(-(arm_mount_w/2+traxxas_axle_length(t)/2)) rz(angle_h) ry(-angle_v) {
    ry(90) tz(traxxas_length(t)/2)
      carbon_fibre_rod(d = traxxas_rod_diameter(t),
                       l = rod_length);
    rx(90) tx(arm_length/2) myz(rod_length/2)
      tx(traxxas_length(t)/2) ry(180) traxxas(t);
  }
}

if ($preview) {
  $explode = 0;
  carriage_assembly();
  //carriage_belt_tensioner_stl();
  //carriage_stl();
  //arm_assembly(30, 20);
}

