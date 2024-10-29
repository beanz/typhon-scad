//! Cerberus-revised for MGN rails
include <conf.scad>
include <lazy.scad>
include <vitamins.scad>

use <bottom.scad>
use <effector.scad>
use <carriage.scad>
use <top.scad>

echo(delta_triangle_l-60);
//! Insert PSU

module main_assembly()
  pose([76.7, 0, 13.1], [6.53, -16.48, 139.66]) assembly("main") {

  rz(upright_a_angle) tx(delta_r) tower_a_assembly();
  rz(upright_b_angle) tx(delta_r) tower_b_assembly();
  rz(upright_c_angle) tx(delta_r) tower_c_assembly();
  txyz(pos_x,pos_y,pos_z+effector_thickness/2) effector_assembly();
  color("silver") render() tz(bed_height-bed_thickness)
    cylinder(d=bed_diameter, h=bed_thickness);
  myz(ew*1.5) myz((ew*1.5)/2)
    ty(-delta_triangle_r-80) rail_helper_stl();
  ty(30) duet_assembly();
}

module duet_assembly() assembly("duet") {
  b = DuetE;
  p = pcb_holes(b);
  mount_l = 40;
  pad_d = pcb_land_d(b) == 0 ? th : pcb_land_d(b);
  tz(th*1.5) pcb(b);

  left_pcb_mount_stl();
  ol = pcb_coord(b, p[1]);
  txy(ol[0]+26+0.5*mount_l*cos(60), ol[1]+pad_d/2-0.5*mount_l*sin(60)) {
    rz(30) mxz(10) txz(-th/2-eta, ew2/2) ry(-90)
      rz(90) extrusion_screw(M5_flanged_screw, 16, M5_sliding_t_nut);
  }

  right_pcb_mount_stl();
  or = pcb_coord(b, p[2]);
  txy(or[0]-26-0.5*mount_l*cos(60), or[1]+pad_d/2-0.5*mount_l*sin(60)) {
    rz(-30) mxz(10) txz(th/2+eta, ew2/2) ry(90)
      rz(90) extrusion_screw(M5_flanged_screw, 16, M5_sliding_t_nut);
  }

  for (h = p) {
    o = pcb_coord(b, h);
    txyz(o[0], o[1], th*1.5+pcb_thickness(b)) screw(M3_cap_screw, 6);
  }
}

module left_pcb_mount_stl() stl("left_pcb_mount") {
  b = DuetE;
  p = pcb_holes(b);
  mount_l = 40;
  pad_d = pcb_land_d(b) == 0 ? th : pcb_land_d(b);
  hole_d = pcb_hole_d(b);
  color(print_color) render() difference() {
    difference() {
      union() {
        hull() for (h = [0:1]) {
          o = pcb_coord(b, p[h]);
          txy(o[0], o[1]) cylinder(d = pad_d+th, h = th);
        }
        hull() {
          o = pcb_coord(b, p[1]);
          txy(o[0], o[1]) cylinder(d = pad_d+th, h = th);
          txy(o[0], o[1]-50) cylinder(d = pad_d+th, h = th);
          txy(o[0]+26, o[1]+pad_d/2) cylinder(d = th, h = th);
          txy(o[0]+26+mount_l*cos(60), o[1]+pad_d/2-mount_l*sin(60))
            cylinder(d = th, h = th);
        }
        hull() {
          o = pcb_coord(b, p[1]);
          txy(o[0]+26, o[1]+pad_d/2) cylinder(d = th, h = ew2);
          txy(o[0]+26+mount_l*cos(60), o[1]+pad_d/2-mount_l*sin(60))
            cylinder(d = th, h = ew2);
        }
        for (h = [0:1]) {
          o = pcb_coord(b, p[h]);
          txy(o[0], o[1]) cylinder(d = pad_d, h = th*1.5);
        }
      }
      for (h = [0:1]) {
        o = pcb_coord(b, p[h]);
        tz(th/4) txy(o[0], o[1])
          cylinder(r = screw_pilot_hole(M3_cap_screw), h = th*1.25);
      }
      o = pcb_coord(b, p[1]);
      txy(o[0]+26+0.5*mount_l*cos(60), o[1]+pad_d/2-0.5*mount_l*sin(60)) {
        rz(30) mxz(10) txz(-th/2-eta, ew2/2) ry(90)
          cylinder(r = screw_clearance_radius(M5_flanged_screw), h = th*3);
      }
    }
  }
}

module right_pcb_mount_stl() stl("right_pcb_mount") {
  b = DuetE;
  p = pcb_holes(b);
  mount_l = 40;
  pad_d = pcb_land_d(b) == 0 ? th : pcb_land_d(b);
  hole_d = pcb_hole_d(b);
  color(print_color) render() difference() {
    difference() {
      union() {
        hull() for (h = [2:3]) {
          o = pcb_coord(b, p[h]);
          txy(o[0], o[1]) cylinder(d = pad_d+th, h = th);
        }
        hull() {
          o = pcb_coord(b, p[2]);
          txy(o[0], o[1]) cylinder(d = pad_d+th, h = th);
          txy(o[0], o[1]-50) cylinder(d = pad_d+th, h = th);
          txy(o[0]-26, o[1]+pad_d/2) cylinder(d = th, h = th);
          txy(o[0]-26-mount_l*cos(60), o[1]+pad_d/2-mount_l*sin(60))
            cylinder(d = th, h = th);
        }
        hull() {
          o = pcb_coord(b, p[2]);
          txy(o[0]-26, o[1]+pad_d/2) cylinder(d = th, h = ew2);
          txy(o[0]-26-mount_l*cos(60), o[1]+pad_d/2-mount_l*sin(60))
            cylinder(d = th, h = ew2);
        }
        for (h = [2:3]) {
          o = pcb_coord(b, p[h]);
          txy(o[0], o[1]) cylinder(d = pad_d, h = th*1.5);
        }
      }
      for (h = [2:3]) {
        o = pcb_coord(b, p[h]);
        tz(th/4) txy(o[0], o[1])
          cylinder(r = screw_pilot_hole(M3_cap_screw), h = th*1.25);
      }
      o = pcb_coord(b, p[2]);
      txy(o[0]-26-0.5*mount_l*cos(60), o[1]+pad_d/2-0.5*mount_l*sin(60)) {
        rz(-30) mxz(10) txz(th/2+eta, ew2/2) ry(-90)
          cylinder(r = screw_clearance_radius(M5_flanged_screw), h = th*3);
      }
    }
  }
}

module tower_common() {
  bottom_corner_assembly();
  tz(delta_h+20+th) rx(180) top_corner_assembly();
}

module tower_a_assembly() assembly("tower_a") {
  upright_a_assembly();
  if (spectra_drive) {
    
  } else {
    tx(-belt_offset) upright_belt(carriage_a_h);
  }
  tower_common();
}

module tower_b_assembly() assembly("tower_b") {
  upright_b_assembly();
  if (spectra_drive) {
    
  } else {
    tx(-belt_offset) upright_belt(carriage_b_h);
  }
  tower_common();
}

module tower_c_assembly() assembly("tower_c") {
  upright_c_assembly();
  if (spectra_drive) {
    
  } else {
    tx(-belt_offset) upright_belt(carriage_c_h);
  }
  tower_common();
}

module upright_belt(carriage_h) {
  bottom_r = pulley_hub_dia(opulley)/2;
  bottom_offset = 60/2;
  top_r = bb_diameter(BBF625)/2;
  top_offset = delta_h + ew2/2;
  rz(90) rx(90)
    belt(GT2x6, [
      [-bottom_r+1, carriage_h+arm_mount_offset+th, 0],
      [-bottom_r+1, carriage_h+arm_mount_offset, 0],
      [-bottom_r+3, carriage_h+arm_mount_offset-3, 0],
      [-bottom_r+7, carriage_h+arm_mount_offset-7, 2],
      [-bottom_r, carriage_h+arm_mount_offset, 0],
      [0, top_offset, top_r],
      [0, bottom_offset, bottom_r],
      [-bottom_r+6, carriage_h-10, 6],
      [-bottom_r+10, carriage_h-25, 2],
      [-bottom_r+10.5, carriage_h-23, 0],
      [-bottom_r+10.5, carriage_h-11, 0],
    ], open = true, auto_twist = false);
}

module upright_a_assembly() assembly("upright_a") {
  upright(carriage_a_h, carriage_a_arm_angle_v, carriage_a_arm_angle_h);
}

module upright_b_assembly() assembly("upright_b") {
  upright(carriage_b_h, carriage_b_arm_angle_v, carriage_b_arm_angle_h);
}

module upright_c_assembly() assembly("upright_c") {
  upright(carriage_c_h, carriage_c_arm_angle_v, -carriage_c_arm_angle_h);
}

module upright(carriage_h, angle_v = 30, angle_h = 0) {
  tz(ew2) extrusion(upright_extrusion, delta_h, center = false);
  txz(-ew/2, -400+delta_h) ry(-90) rz(180) {
    rail(carriage_rail(car), 800);
  }
  txz(-ew/2, -800+delta_h) ry(-90) rz(180) {
    rail_guard_assembly();
  }
  txz(-ew/2, carriage_h) ry(-90) rz(180) {
    carriage_assembly(angle_v, angle_h);
  }
}
module rail_guard_assembly() assembly("rail_guard") {
  rail_guard_stl();
  txz(ew/4, th) extrusion_screw(M5_flanged_screw, 16);
}

module rail_guard_stl() stl("rail_guard") {
  rh = rail_height(carriage_rail(car));
  tx(ew/4) color(print_color) render() difference() {
    rrcf([ew/2,ew,rh], r = 3);
    tz(-eta) cylinder(r = screw_clearance_radius(M5_flanged_screw),
             h = rh*2);
    tz(th) cylinder(d = 2*clearance+washer_diameter(M5_washer),
             h = rh*2);
  }
}

module rail_helper_stl() stl("rail_helper") {
  h = ew/2+th+rail_height(car_rail);
  color(print_color) render() difference() {
    ty(-h/2+ew/2) rrcf([ew+th*2, h, th*2], r = 3);
    tyz(-rail_height(car_rail)/2, -eta) rcc([rail_width(car_rail), rail_height(car_rail), th*3]);
    tyz(ew/2,-eta) rcc([ew, ew, th*3]);
  }
}

if ($preview) {
  $explode = 1;
  //main_assembly();
  tower_a_assembly();
  //upright_a_assembly();
  //rail_guard_assembly();
  //upright_belt();
}
