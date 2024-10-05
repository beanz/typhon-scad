include <conf.scad>
include <lazy.scad>
include <shapes.scad>

module carbon_fibre_rod(d, l, center = false) {
  vitamin(str("rod(", d, ", ", l, "): CF rod ", d, "mm x ", l, "mm"));
  color(cf_color) {
    cylinder(d = d, h = l, center = center);
  }
}

Traxxas_5347 = ["Traxxas 5347", 3, 3, 3.5, 6, 10, 6.3, 24];

function traxxas_name(t) = t[0];
function traxxas_axle_diameter(t) = t[1];
function traxxas_rod_diameter(t) = t[2];
function traxxas_axle_thickness(t) = t[3];
function traxxas_rod_outer_diameter(t) = t[4];
function traxxas_axle_outer_diameter(t) = t[5];
function traxxas_axle_length(t) = t[6];
function traxxas_length(t) = t[7];

module traxxas(t) {
  offset = traxxas_length(t)/2 - traxxas_axle_outer_diameter(t)/2;
  color("black") {
    difference() {
      union() {
        cylinder(d = traxxas_axle_outer_diameter(t),
                 h = traxxas_axle_thickness(t), center = true);
        hull() {
          cylinder(d = traxxas_axle_outer_diameter(t),
                   h = 0.8*traxxas_axle_thickness(t), center = true);
          tx(offset)
            cylinder(d = traxxas_rod_outer_diameter(t),
                     h = 0.8*traxxas_axle_thickness(t), center = true);
        }
        tx(offset) ry(90) {
          cylinder(d = traxxas_rod_outer_diameter(t),
                   h = traxxas_length(t)/2);
          rx(180) cylinder(d1 = traxxas_rod_outer_diameter(t),
                           d2 = traxxas_axle_thickness(t),
                           h = offset-traxxas_axle_outer_diameter(t)/2);
        }
      }
      sphere(d=traxxas_axle_length(t));
      tx(offset) ry(90) {
        cylinder(d = traxxas_rod_diameter(t),
                 h = traxxas_length(t));
      }
    }
  }
  color("silver") {
    difference() {
      union() {
        sphere(d=traxxas_axle_length(t));
        mxy(0) cylinder(d1 = traxxas_axle_diameter(t),
                        d2 = traxxas_axle_length(t),
                        h = traxxas_axle_length(t)/2);
      }
      cylinder(d = traxxas_axle_diameter(t),
               h = traxxas_axle_length(t)*2, center = true);
    }
  }
}


