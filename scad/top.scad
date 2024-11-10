include <conf.scad>
include <lazy.scad>
include <shapes.scad>

module top_corner_assembly() assembly("top_corner") {
  top_corner_stl();

  top_corner_extrusion_positions(both = false)
    ry(-90) extrusion(side_extrusion, delta_triangle_l-60, center = false);

  top_corner_upright_screw_positions()
    rz(90) extrusion_screw(M5_flanged_screw, 16, M5_sliding_t_nut);

  top_corner_side_screw_positions()
    extrusion_screw(M4_flanged_screw, 10);

  tz(th) idler_assembly();
}

module idler_assembly() assembly("idler") {
  idler_stl();
  idler_mount_screw_positions() rx(90) extrusion_screw(M4_flanged_screw, 10);
  txz(-idler_mount_offset-th/2, ew2/2) ry(-90)
    extrusion_screw(M5_flanged_screw, idler_mount_offset-ew/4, M5_sliding_t_nut);
  if (spectra_drive) {
    
  } else {
    txz(-belt_offset, ew2/2) ry(-90) tz(-pulley_height(idler_pulley)/2) pulley(idler_pulley);
    txz(th-idler_mount_offset-th/2, 1+th+ew2/2) ry(90)
      idler_spacers_stl();
  }
}

module spacer(id = 2*(clearance+screw_clearance_radius(M5_flanged_screw)), od = washer_diameter(M5_washer), l = 10) {
  difference() {
    union() {
      cylinder(d = od, h = l-2);
      tz(l-2-eta) cylinder(d1 = od, d2 = id, h = 2);
    }
    tz(-eta) cylinder(d = id, h = l+eta*2);
  }
}

module idler_spacers_stl() stl("idler_spacers") {
  color(print_color) render() {
    spacer(l = 5);
    tz(5.2+pulley_height(idler_pulley)) tz(17.5) rx(180) spacer(l = 17.5);
  }
}

module idler_bearing_assembly() assembly("idler_bearing") {
  mxy(0) {
    explode([0, 0, 5], true) {
      tz(ball_bearing_h(BBF625)/2) {
        mirror([0,0,1]) ball_bearing(BBF625);
        explode([0, 0, 5], true) {
          tz(ball_bearing_h(BBF625)/2) {
            washer(M5_washer);
          }
        }
      }
    }
  }
}

module idler_stl() stl("idler") {
  o = idler_mount_offset*tan(30)+th*2*cos(30);
  color(print_color) render() difference() {
    union() {
      hull() {
        tx(-idler_mount_offset) mxz(o) cylinder(d = th, h = ew2);
      }
      mxz(o) tx(-idler_mount_offset) hull() {
        cylinder(d = th, h = ew2);
        txy(-40*cos(30), 40*sin(30)) cylinder(d = th, h = ew2);
      }
      idler_mount_screw_positions() ty(th-eta) rz(90) ry(90)
        extrusion_aligner(E2020, l = 20);
    }
    idler_mount_screw_positions()
      rx(-90) cylinder(r=screw_clearance_radius(M4_flanged_screw),
                       h = th*3);
    txz(-idler_mount_offset, ew2/2) ry(90)
      cylinder(r = screw_clearance_radius(M5_flanged_screw),
               h = th*3, center = true);
  }
}

module idler_mount_screw_positions() {
  o = idler_mount_offset*tan(30)+th*2*cos(30);
  tz(ew2/2) mxz(o+10*sin(30)-0.5*th*cos(30)) tx(-idler_mount_offset-10*cos(30)-0.5*th*sin(30))
    rz(-30) children();
  tz(ew2/2) mxz(o+30*sin(30)-0.5*th*cos(30)) tx(-idler_mount_offset-30*cos(30)-0.5*th*sin(30))
    rz(-30) children();
}

module top_corner_stl() {
  stl("top_corner") {
    color(print_color) render() difference() {
      union() {
        hull() {
          rrcf([40+th*2, 40+th*2, ew2+th], 5);
          for (i=[1,-1]) rz(i*30) {
            txy(6,-i*(35-5)) cylinder(r=5, h =ew2+th);
          }
        }
        for (i=[1,-1]) rz(i*30) {
          hull() {
            txy(6,-i*(35-5)) cylinder(r=5, h =ew2+th);
            txy(-30,-i*(35-(20/2+th))) rrcf([80,20+th*2,ew2+th], 5);
          }
        }
      }
      tz(th) extrusion_cut(e = E4040, l = 100);

      top_corner_extrusion_positions(both = true)
        ry(-90) extrusion_cut(E2020, l = 40+eta, a = [90, 180, 270]);

      top_corner_upright_screw_positions(inner = true) tz(-th) {
        tz(-2) cylinder(r = screw_clearance_radius(M5_flanged_screw), h = ew);
        tz(th+clearance) cylinder(d = 2*clearance+washer_diameter(M5_washer), h = ew);
      }
      top_corner_side_screw_positions() tz(-th)
        tz(-2) cylinder(r = screw_clearance_radius(M4_flanged_screw), h = ew);
    }
  }
}

module top_corner_extrusion_positions(both = true) {
  tz(th) corner_extrusion_positions(both) children();
}

module top_corner_upright_screw_positions(inner = false) {
  p = inner ? [0, 90, 180, 270] : [0, 180, 270];
  tz(th+ew2/2) for (a = p) rz(a) ty(ew/2+th) rx(-90) children();
}

module top_corner_side_screw_positions() {
  top_corner_extrusion_positions(both = true)
    tx(-20) myz(ew2/2) mxz(ew2/2+th) rx(-90)
    children();
}

if ($preview) {
  $explode = 0;
  top_corner_assembly();
  //top_corner_stl();
}
