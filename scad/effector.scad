include <conf.scad>
include <lazy.scad>
include <shapes.scad>
include <NopSCADlib/vitamins/hot_ends.scad>
include <NopSCADlib/vitamins/blowers.scad>

hot_end_height = hot_end_insulator_length(E3Dv6) + effector_thickness;

module effector_assembly() assembly("effector") {
  effector_stl();
  hotend_mount_positions() ry(180) screw(M3_dome_screw, 16);
  extruder_mount_assembly();
  explode([0, 0, 20]) {
    effector_hot_end_mount_assembly();
    tz(hot_end_height+th) explode([0, 0, 30]) orbiter_v2();
  }
}

module effector_hot_end_mount_assembly() 
  assembly("effector_hot_end_mount") {
  effector_hot_end_mount_back_assembly();
  explode([0, -30, 0], false,
          [0, -15, (hot_end_height+effector_thickness)/2])
    effector_hot_end_mount_front_assembly();
  tz(hot_end_height-4) hot_end(E3Dv6, 1.75, naked = true);
  tyz(20, fan_width(fan40x11)/2+effector_thickness)
    rx(90) explode([0, 0, -10], true) {
      fan(fan40x11);
      tz(-fan_depth(fan40x11)/2) {
        bottom_fan_holes(fan40x11) rx(180) screw(M3_cap_screw, 16);
        top_fan_holes(fan40x11) rx(180) screw(M3_cap_screw, 30);
      }
  }
}

module extruder_mount_assembly() assembly("extruder_mount") {
  tz(hot_end_height) effector_extruder_mount_stl();
  tz(hot_end_height+th-screw_head_height(M3_dome_screw))
    hotend_mount_positions() screw(M3_dome_screw, 10);
  orbiter_mount_positions() tz(hot_end_height+th)
    insert(M3_Voron_insert);
}

module effector_hot_end_mount_back_assembly()
  assembly("effector_hot_end_mount_back") {
  tz(effector_thickness) effector_hot_end_mount_back_stl();
  hotend_mount_positions(1) {
    tz(hot_end_height) insert(M3_Voron_insert);
    tz(effector_thickness) ry(180) insert(M3_Voron_insert);
  }
  tyz(15+eta, fan_width(fan40x11)/2+effector_thickness) rx(90)
    bottom_fan_holes(fan40x11)
      rx(180) insert(M3_Voron_insert);
}

module top_fan_holes(type) {
  hole_pitch = fan_hole_pitch(type);
  y = hole_pitch;
  for (x = [-hole_pitch, hole_pitch]) txy(x,y) children();
}

module bottom_fan_holes(type) {
  hole_pitch = fan_hole_pitch(type);
  y = -hole_pitch;
  for (x = [-hole_pitch, hole_pitch]) txy(x,y) children();
}

module effector_hot_end_mount_front_assembly()
  assembly("effector_hot_end_mount_front") {
  bl_screw = blower_screw(BL40x10);
  tz(effector_thickness) effector_hot_end_mount_front_stl();
  hotend_mount_positions(-1) {
    tz(hot_end_height) insert(M3_Voron_insert);
  }
  tyz(eta, fan_width(fan40x11)/2+effector_thickness) rx(90)
    top_fan_holes(fan40x11) rx(180) insert(M3_Voron_insert);
  txyz(-blower_width(BL40x10)/2, -15, effector_thickness) {
    explode([0, -10, 0], true,
            [blower_width(BL40x10)/2, 0, blower_width(BL40x10)/2]) {
      rx(90) blower(BL40x10);
      rx(90) blower_hole_positions(BL40x10)
        tz(blower_base(BL40x10)) screw(bl_screw, 6);
    }
  }
}

module hotend_clamp_positions() {
  tz(hot_end_height-8) myz(16) children();
}

module orbiter_v2() {
  vitamin("orbiter_v2(): orbiter v2.0");
  color("#404040") render()
    rz(180) import("orbiter-v20-full.stl", convexity = 20);
}

module effector_extruder_mount_stl() {
  stl("effector_extruder_mount") color(print_color) render() 
  difference() {
    extruder_mount_shape();
    hotend_mount_positions() {
      tz(th-screw_head_height(M3_dome_screw)-clearance)
        cylinder(r = screw_head_radius(M3_dome_screw)+clearance,
                 h = th);
      tz(-eta)
        cylinder(r = screw_clearance_radius(M3_dome_screw),
                 h = eta*2+th);
    }
   orbiter_mount_positions() tz(th)
      rx(180) cylinder(r = insert_hole_radius(M3_Voron_insert), h = 8);
  }
}

module effector_hot_end_mount_front_stl() {
  bl_screw = blower_screw(BL40x10);
  stl("effector_hot_end_mount_front") color(print_color) render() {
    difference() {
      union() {
        difference() {
          extruder_mount_shape(hot_end_height-effector_thickness);
          ty(250) cc([500,500,500]); // half
          tyz(-5.5, 2) rcc([50, 13, 26-2]); // air outlet
        }
        // tapped hole support
        hotend_mount_positions(-1) cylinder(r = 3, h = 6);
      }

      // fan shroud area
      cylinder(r = 12, h = 26);

      // groove mount lower
      cylinder(d = hot_end_insulator_diameter(E3Dv6)+clearance*2,
               h = 33);

      // groove mount upper
      tz(hot_end_insulator_length(E3Dv6)-4)
         cylinder(d = hot_end_insulator_diameter(E3Dv6)+clearance*2,
                  h = 4);

      // groove mount groove part
      cylinder(d = hot_end_groove_dia(E3Dv6)+clearance*2,
                h = hot_end_insulator_length(E3Dv6));

      // blower mount tapped holes
      txyz(-blower_width(BL40x10)/2, -15, 0)
        rx(90) blower_hole_positions(BL40x10) ry(180)
          cylinder(r = screw_pilot_hole(bl_screw), h = 8);

      // hotend mount holes
      hotend_mount_positions(-1) {
        // bottom holes are tapped
        cylinder(r = screw_pilot_hole(M3_dome_screw), h = 8);
        // top holes take inserts
        tz(hot_end_height-effector_thickness-8)
          cylinder(r = insert_hole_radius(M3_Voron_insert), h = 8);
      }

      // groove mount clamp (and top fan) holes
      tyz(eta, fan_width(fan40x11)/2) rx(90)
        top_fan_holes(fan40x11)
          cylinder(r = insert_hole_radius(M3_Voron_insert), h = 8);

      // cable tie hole
      myz(28) tz(30) difference() {
        cylinder(r = 8, h = 3, center = true);
        cylinder(r = 6, h = 4, center = true);
      }
    }
  }
}

module effector_hot_end_mount_back_stl() {
  stl("effector_hot_end_mount_back") color(print_color) render() {
    difference() {
      extruder_mount_shape(hot_end_height-effector_thickness);
      ty(-250) cc([500,500,500]); // half

      e3d_cutout();

      // air funnel shape
      hull() {
        tyz(15, fan_width(fan40x11)/2)
          rx(90) cylinder(d = fan_bore(fan40x11), h = eta);
        tz(2) rcc([24, eta, 26-2]);
      }

      // fan mount holes
      tyz(15+eta,  fan_width(fan40x11)/2) rx(90) {

        // bottom holes need inserts
        bottom_fan_holes(fan40x11)
          cylinder(r = insert_hole_radius(M3_Voron_insert), h = 8);

        // top holes are through holes for hotend clamping
        top_fan_holes(fan40x11)
          cylinder(r = screw_clearance_radius(M3_cap_screw),
                   h = 100, center = true);
      }

      // hotend mount holes for inserts
      hotend_mount_positions(1) {
        cylinder(r = insert_hole_radius(M3_Voron_insert), h = 8);
        tz(hot_end_height-effector_thickness-8)
          cylinder(r = insert_hole_radius(M3_Voron_insert), h = 8);
      }

      // wire through holes
      myz(15) tyz(6/2+1, -5) ry(30) rcc([10,6,50]);

      // cable tie hole
      myz(28) tz(30) difference() {
        cylinder(r = 8, h = 3, center = true);
        cylinder(r = 6, h = 4, center = true);
      }
    }
  }
}

module e3d_cutout() {
    // fan shroud area
    cylinder(r = 12, h = 26);

    // groove mount lower
    cylinder(d = hot_end_insulator_diameter(E3Dv6)+clearance*2,
             h = 33);

    // groove mount upper
    tz(hot_end_insulator_length(E3Dv6)-4)
       cylinder(d = hot_end_insulator_diameter(E3Dv6)+clearance*2,
                h = 4);

    // groove mount groove part
    cylinder(d = hot_end_groove_dia(E3Dv6)+clearance*2,
              h = hot_end_insulator_length(E3Dv6));
}

module extruder_mount_shape(h = th) {
  rrcf([50, 30, h], r = 3);
}

module orbiter_mount_positions() {
  tx(1) myz(18.5) children();
}

module hotend_mount_positions(y = 0) {
  myz(22) if (y == 0) {
    mxz(10) children();
  } else {
    ty(y*10) children();
  }
}

module blower_outlet_position() {
  tyz(12, -3.5) rx(35) ty(-10.5/2) children();
}

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
        }
        ty(-20) hull() {
          rcc([32, 10.5, eta]);
          blower_outlet_position() rcc([20, 6, eta]);
        }
      }

      // hotend hole
      tyz(5, -eta) rrcf([30, 35, effector_thickness+2*eta]);

      // wider part for cable pass-through
      tyz(4, -eta) hull() {
        rrcf([44, 6, effector_thickness+2*eta]);
        ty(3) rrcf([30, 8, effector_thickness+2*eta]);
      }

      // blower air hole
      tyz(-20, -eta) rcc([28, 6.5, effector_thickness+2*eta]);

      // blower shroud
      ty(-20) hull() {
        cc([28, 6, eta]);
        blower_outlet_position() cc([18, 5, eta]);
      }

      // traxxas holes
      tz(effector_thickness/2) for (a = [0, 120, 240])
        rz(a-30) tx(delta_effector_offset) rx(90)
          cylinder(r = screw_clearance_radius(M3_cap_screw),
                   h = arm_mount_w+eta, center = true);

      // hot end mount holes
      hotend_mount_positions()
        tz(-eta) cylinder(r = screw_clearance_radius(M3_cap_screw),
                   h = eta*2+effector_thickness);
    }
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
  //effector_hot_end_mount_assembly();
  //effector_hot_end_mount_back_assembly();
  //effector_hot_end_mount_front_assembly();
  //extruder_mount_assembly();
  //bowden_clip_assembly();
  //bowden_clip_stl();
}
