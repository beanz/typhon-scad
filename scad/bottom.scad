include <conf.scad>
include <lazy.scad>
include <shapes.scad>

module bottom_corner_assembly() assembly("bottom_corner") {
  bottom_corner_part();

  corner_extrusion_positions(both = false)
    ry(-90) extrusion(side_extrusion, delta_triangle_l-60, center = false);

  corner_extrusion_positions(both = false)
    bottom_extrusion_assembly();

  bottom_corner_upright_screw_positions()
    extrusion_screw(M5_flanged_screw, 16, M5_sliding_t_nut);

  bottom_corner_side_screw_positions()
    extrusion_screw(M4_flanged_screw, 10);

  bottom_motor_mount_assembly();
}

module bottom_motor_mount_assembly() assembly("bottom_motor_mount") {
  tz(20) {
    bottom_motor_mount_stl();
    motor_mount_screw_positions()
      rx(90) extrusion_screw(M4_flanged_screw, 10);
    motor_position() {
      NEMA(NEMA17_47);
      NEMA_screw_positions(NEMA17_47, 4)
        tz(th) screw_and_washer(motor_screw, 8);
      if (spectra_drive) {
        
      } else {
        tz(motor_mount_offset-belt_offset
           +pulley_hub_length(opulley)/2
           -pulley_flange_thickness(opulley)/2)
          pulley_assembly(opulley);
      }
    }
  }
}

module motor_position() {
  txz(-motor_mount_offset-th/2, 10) ry(90) children();
}

module bottom_motor_mount_stl() stl("bottom_motor_mount") {
  o = motor_mount_offset*tan(30)+th*2*cos(30);
  h = 60;
  color(print_color) render() difference() {
    union() {
      tz(10) {
        hull() {
          tx(-motor_mount_offset) mxz(o) cylinder(d = th, h = h, center = true);
        }
        mxz(o) tx(-motor_mount_offset) hull() {
          cylinder(d = th, h = h, center = true);
          txy(-40*cos(30), 40*sin(30)) cylinder(d = th, h = h, center = true);
        }
      }
      motor_mount_screw_positions() rz(90) ry(90)
        tz(th-eta) extrusion_aligner(E2020, l = 20);
    }
    motor_mount_screw_positions()
      rx(-90) cylinder(r=screw_clearance_radius(M4_flanged_screw), h = th*3);
    motor_position() {
      cylinder(r = NEMA_big_hole(NEMA17_47)+1,
               h = th*3, center = true);
      NEMA_screw_positions(NEMA17_47, 4)
        cylinder(d = screw_clearance_d(motor_screw),
                 h = th*3, center = true);
    }
  }
}

module motor_mount_screw_positions() {
  o = motor_mount_offset*tan(30)+th*2*cos(30);
  tz(10) mxy(ew2) {
    mxz(o+10*sin(30)-0.5*th*cos(30))
      tx(-motor_mount_offset-10*cos(30)-0.5*th*sin(30))
      rz(-30) children();
    mxz(o+30*sin(30)-0.5*th*cos(30))
      tx(-motor_mount_offset-30*cos(30)-0.5*th*sin(30))
      rz(-30) children();
  }
}

module bottom_extrusion_assembly() assembly("bottom_extrusion") {
  l = delta_triangle_l-60;
  tz(40) {
    ry(-90) extrusion(side_extrusion, l, center = false);
    txz(-l/2, ew2/2) tx(-bed_mount_width/2) {
      rz(90) bed_mount_right_assembly();
    }
    if (six_point_bed_mount) {
      txz(-l/2, ew2/2) tx(bed_mount_width/2) {
        rz(90) bed_mount_left_assembly();
      }
    }
  }
}

module bottom_corner_part() {
  if (split_large_parts) {
    two_part_bottom_corner_assembly();
  } else {
    bottom_corner_stl();
  }
}

module two_part_bottom_corner_assembly()
  assembly("two_part_bottom_corner") {
    tz(30) bottom_corner_top_stl();
    explode([0,0,-10]) bottom_corner_bottom_assembly();
    bottom_corner_insert_positions() {
      explode([0,0,30]) tz(30+th) screw(M3_cap_screw, 10);
    }
}

module bottom_corner_top_stl() {
  stl("bottom_corner_top") color(print_color) render() {
    difference() {
      tz(-30) bottom_corner_model();
      tz(-500) cube(1000, center = true);
      bottom_corner_insert_positions() {
        cylinder(r = screw_clearance_radius(M3_cap_screw), h = 100);
        tz(3)
          cylinder(d = washer_diameter(M3_washer), h = 100);
      }
    }
  }
}

module bottom_corner_bottom_assembly()
  assembly("bottom_corner_bottom") {
    bottom_corner_bottom_stl();
    bottom_corner_insert_positions() {
      tz(30) insert(M3_Voron_insert);
    }
}

module bottom_corner_bottom_stl() {
  stl("bottom_corner_bottom") color(print_color) render() {
    difference() {
      bottom_corner_model();
      tz(500+30) cube(1000, center = true);
      bottom_corner_insert_positions() tz(30) {
        tz(-5) cylinder(r = insert_hole_radius(M3_Voron_insert), h = 100);
        tz(-8)
          cylinder(r = screw_clearance_radius(M3_cap_screw), h = 100);
      }
    }
  }
}

module bottom_corner_insert_positions() {
  corner_extrusion_positions(both = true)
    txz(-20,-10) myz(ew2/2)
    children();
  mxz(25) myz(15) children();
}

module bottom_corner_model() {
  difference() {
    union() {
      hull() {
        rrcf([40+th*2, 40+th*2, 60], 5);
        for (i=[1,-1]) rz(i*30) {
          txy(6,-i*(35-5)) cylinder(r=5, h =60);
        }
      }
      for (i=[1,-1]) rz(i*30) {
        hull() {
          txy(6,-i*(35-5)) cylinder(r=5, h =60);
          txy(-30,-i*(35-(20/2+th))) rrcf([80,20+th*2,60], 5);
        }
      }
    }
    // 4040 cutout
    tz(20) extrusion_cut(e = E4040, l = 100);

    // 2020 cutouts
    for (z = [0, 40]) tz(z) corner_extrusion_positions()
      ry(-90) rz(z == 40? 180 : 0)
        extrusion_cut(E2020, l = 40+eta, a = [0, 90, 270]);

    // 4040 screw holes
    bottom_corner_upright_screw_positions() tz(-th) {
      tz(-2) cylinder(r = screw_clearance_radius(M5_flanged_screw), h = ew+2);
      tz(th+clearance) cylinder(d = 2*clearance+washer_diameter(M5_washer), h = ew);
    }

    // 2020 screw holes
    bottom_corner_side_screw_positions() tz(-th)
      tz(-2) cylinder(r = screw_clearance_radius(M4_flanged_screw), h = ew);
  }
}

module bottom_corner_stl() {
  stl("bottom_corner") color(print_color) render() {
    bottom_corner_model();
  }
}

module bottom_corner_side_screw_positions() {
  tz(20) corner_extrusion_positions(both = true)
    mxy(ew2) tx(-20) myz(ew2/2) mxz(ew2/2+th) rx(-90)
    children();
}

module bottom_corner_upright_screw_positions() {
  tz(40)
    mxy(ew/4)
    for (a = [-90, 0, 180]) 
      rz(a) ty(ew/2+th) rx(-90) rz(90) children();
}

module bed_mount_right_stl() {
  //! Top hole should be tapped for M6
  stl("bed_mount_right") mirror([0,1,0]) bed_mount_stl();
}

module bed_mount_left_stl() {
  //! Top hole should be tapped for M6
  stl("bed_mount_left") bed_mount_stl();
}

module bed_mount_stl() {
  color(print_color) render() {
    difference() {
      union() {
        tx(4) rz(30) {
          tx(3) rrcf([25, 18, 13], 5);
          rrcf([20, 18, 17], 5);
        }
        rrcf([20, 50, th], 5);
        tz(eta) ry(180) extrusion_aligner(e = E2020, l = 50);
      }
      tx(4) rz(30)
        cylinder(r = screw_pilot_hole(M6_cap_screw),
                 h = 60, center = true);
      mxz(50/2-th-screw_radius(M4_flanged_screw)) {
        cylinder(r = screw_clearance_radius(M4_flanged_screw),
                 h = th*3, center = true);
      }
      txy(delta_triangle_r+ew2, bed_mount_width/2) {
        tz(13) cylinder(d=bed_diameter, h=10);
      }
    }
  }
}

module bed_mount_left_assembly() assembly("bed_mount_left") {
  bed_mount_left_stl();
  txz(4,17) rz(30) {
    tz(washer_thickness(M6_washer)) screw(M6_cap_screw, 10);
    washer(M6_rubber_washer);
  }
  tz(th) mxz(50/2-th-screw_radius(M4_flanged_screw))
    rz(90) extrusion_screw(M4_flanged_screw, 10);
}

module bed_mount_right_assembly() assembly("bed_mount_right") {
  bed_mount_right_stl();
  txz(4,17) rz(30) {
    tz(washer_thickness(M6_washer)) screw(M6_cap_screw, 10);
    washer(M6_rubber_washer);
  }
  tz(th) mxz(50/2-th-screw_radius(M4_flanged_screw))
    rz(90) extrusion_screw(M4_flanged_screw, 10);
}

if ($preview) {
  $explode = 0;
  bottom_corner_assembly();
  //two_part_bottom_corner_assembly();
  //bed_mount_left_assembly();
  //bed_mount_right_assembly();
  //bottom_motor_mount_assembly();
  //bottom_motor_mount_stl();
}
