include <BOSL2/std.scad>
include <BOSL2/screws.scad>

$fn=50;

holes_x = 5;
holes_y = 5;
thickness = 8;

// Use calibration_holes.stl to find the right value for your printer.
thread_scale_xy = 108/100;

// These values defined by everclamp.org
screw_spec = "M6x1";
spacing = 25/3;

difference() {
  cube([spacing * (holes_x + 1), spacing * (holes_y + 1), thickness]);

  for(x=[1:holes_x]) {
    for(y=[1:holes_y]) {
      translate([spacing*x, spacing*y, -1])
      scale([thread_scale_xy, thread_scale_xy, 1])
      screw_hole(screw_spec, thread=true, length=thickness+2, anchor=BOTTOM);
    }
  }
}