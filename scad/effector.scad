include <conf.scad>
include <lazy.scad>
include <shapes.scad>
include <NopSCADlib/vitamins/hot_ends.scad>

orbiter_clearance_h = 10;

module effector_assembly() assembly("effector") {
  effector_stl();
  tz(-4) hot_end(E3Dv6, 1.75, naked = true);
  hotend_mount_positions() ry(180) insert(M3_Voron_insert);
  orbiter_mount_positions() tz(effector_thickness)
    insert(M3_Voron_insert);
}

module orbiter_mount_positions() {
  tx(1) myz(18.5) children();
}

module hotend_mount_positions() {
  for (n = [0:5]) rz(30+n*60) tx(effector_hole_radius) children();
}

module effector_insert_hole(long = false) {
  l = eta*2 + effector_thickness + (long ? orbiter_clearance_h : 0);
  tz(-eta) cylinder(r = insert_hole_radius(M3_Voron_insert), h = l);
}
tx(19.5) cylinder(r=0.1, h = 100);

module effector_stl() {
  stl("effector") color(print_color) render() {
    difference() {
      union() {
        tz(effector_thickness/2) difference() {
          union() {
            cylinder(r = effector_hole_radius+effector_thickness,
                     h = effector_thickness, center = true);
            for (a = [0, 120, 240]) {
              rz(a) arm_mount();
            }
          }
          tz(-eta-effector_thickness/2)
            cylinder(r = effector_hole_radius-effector_thickness/2,
                     h = effector_thickness+2*eta);
        }
        ty(3.15) rrcf([46, 22, effector_thickness+orbiter_clearance_h], r = 2);
      }

      // wire holes
      //wire_hole();
      //rz(180) wire_hole();

      // traxxas holes
      tz(effector_thickness/2) for (a = [0, 120, 240])
        rz(a-30) tx(delta_effector_offset) rx(90)
          cylinder(r = screw_clearance_radius(M3_cap_screw),
                   h = arm_mount_w+eta, center = true);

      // center hole
      tz(-eta) cylinder(d = 4.2,
        h = effector_thickness+2*eta+orbiter_clearance_h);

      // hot end mount holes
      hotend_mount_positions() effector_insert_hole();

      // orbiter 2 mount
      orbiter_mount_positions() effector_insert_hole(long = true);
    }
  }
}

module wire_hole() {
  render() for (i = [0:6]) {
    rz(-i*5) ty(30/2) tz(-eta) cylinder(d = 8, h = effector_thickness+2*eta);
  }
}

module arm_mount() {
  render() difference() {
    hull() {
      //     translate([0, -2, 18]) cube([arm_mount_w-4, 4, 14], center = true);
      for (j=[0.5,1]) {
        translate([0, j*delta_effector_offset, 0]) {
          ry(90) {
            cylinder(r = 8/2, h = arm_mount_w, center = true, $fn=20);
          }
        }
      }
    }

    translate([0, delta_effector_offset, 0]) {
      // cut for clearance of the traxxas
      for (i = [-1, 1]) {
        translate([i*arm_mount_w/2, 0, 0]) {
          for (a = [0, 22.5, 45, 67.5, 90]) {
            rx(-a) ry(i*45)
              translate([0, 0, 20+1.5]) cube(40, center = true);
          }
        }
      }
    }
  }
}

module bowden_clip_stl() {
  stl("bowden_clip") color(print_color) render() difference() {
    union() {
      rrc([60, 30, th], fb = true);
      hull() rz(30) {
        rcc([8+th*2, 10, 0.1]);
        tz(20) rx(90) cylinder(d = 8+th*2, h=10, center = true);
      }
    }
    myz(20) cylinder(d = 5.4, h = 20, center = true);
    rz(30) tz(20) rx(90) cylinder(d = 8, h=20, center = true);
  }
}

module bowden_clip_assembly() {
  assembly("bowden_clip") {
    bowden_clip_stl();
    tz(th) myz(20)
      extrusion_screw(M5_flanged_screw, 16, M5_sliding_t_nut);
  }
}

if ($preview) {
  $explode = 0;
  effector_assembly();
  //effector_stl();
  //bowden_clip_assembly();
  //bowden_clip_stl();
}
