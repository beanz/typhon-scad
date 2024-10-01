include <conf.scad>
include <lazy.scad>
include <shapes.scad>

function dist(p1, p2) = sqrt((p1[0]-p2[0])*(p1[0]-p2[0])+
                             (p1[1]-p2[1])*(p1[1]-p2[1]));
function pdist(p, i = 0, a = 0) =
  len(p) > i+1 ? pdist(p, i+1, a+dist(p[i], p[i+1])) : a;

module mbelt(type, path, bcolor = top_belt_color) {
  th = belt_thickness(type);
  h = belt_width(type);
  vitamin(str("BELT: GT2 ", pdist(path)));
  color(bcolor) {
    for (i = [0:len(path)-2]) {
      hull() {
        txy(path[i][0], path[i][1]) cylinder(d = th, h = h, center = true);
        txy(path[i+1][0], path[i+1][1]) cylinder(d = th, h = h, center = true);
      }
    }
  }
}
