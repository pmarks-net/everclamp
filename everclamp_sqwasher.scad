include <BOSL2/std.scad>

$fn=50;

holes_x = 5;
holes_y = 5;
thickness = 4;
hole_diameter = 6.5;
spacing = 25/3;

difference() {
  cube([spacing * (holes_x + 1), spacing * (holes_y + 1), thickness]);

  for(x=[1:holes_x]) {
    for(y=[1:holes_y]) {
      translate([spacing*x, spacing*y, -1])
      cylinder(thickness+2, d=hole_diameter, anchor=BOTTOM);
    }
  }
}