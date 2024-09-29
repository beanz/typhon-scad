include <conf.scad>
include <lazy.scad>
include <shapes.scad>

module top_corner_assembly() assembly("top_corner") {
  top_corner_stl();

  top_corner_extrusion_positions(both = false)
    ry(-90) extrusion(side_extrusion, delta_triangle_l-60, center = false);

  top_corner_upright_screw_positions()
    rz(90) extrusion_screw(M5_cap_screw, 14, M5_sliding_t_nut);

  top_corner_side_screw_positions()
    extrusion_screw(M4_cap_screw, 10);

  tz(th) idler_assembly();
}

module idler_assembly() assembly("idler") {
  idler_stl();
  idler_mount_screw_positions() rx(90) extrusion_screw(M4_cap_screw, 10);
  txz(-idler_mount_offset-th/2, ew2/2) ry(-90)
    extrusion_screw(M5_cap_screw, idler_mount_offset-ew/4);
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
    }
    idler_mount_screw_positions()
      rx(-90) cylinder(r=screw_clearance_radius(M4_cap_screw),
                       h = th*3);
    txz(-idler_mount_offset, ew2/2) ry(90)
      cylinder(r = screw_clearance_radius(M5_cap_screw),
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
      tz(th) rrcf([40+clearance, 40+clearance, 100],2);

      top_corner_extrusion_positions(both = true)
        ry(-90) rcc([20+eta,20+clearance,40+eta]);

      top_corner_upright_screw_positions(inner = true) tz(-th) {
        cylinder(r = screw_clearance_radius(M5_cap_screw), h = ew);
        tz(th+clearance) cylinder(d = 2*clearance+washer_diameter(M5_washer), h = ew);
      }
      top_corner_side_screw_positions() tz(-th)
        cylinder(r = screw_clearance_radius(M4_cap_screw), h = ew);
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
