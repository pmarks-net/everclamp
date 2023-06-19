// An array of M6 holes (female threads) with different thread_scale_xy values.
// Use a real M6 nut and bolt to find the correct value for your slicer/printer.

include <BOSL2/std.scad>
include <BOSL2/screws.scad>

$fn=50;

thickness = 8;
spacing = 25/3;
screw_spec = "M6x1";

holes_x = 5;
holes_y = 5;
thread_scales = [for (i = [90:1:114]) i];
function thread_scale(x, y) = thread_scales[(holes_y-y-1)*holes_x + x]/100;

// Create a cube with thread holes.
difference() {
  cube([spacing * (holes_x + 1), spacing * (holes_y + 1), thickness]);

  for(x=[0:holes_x-1]) {
    for(y=[0:holes_y-1]) {
      translate([spacing*(x+1), spacing*(y+1), -1])
      scale([thread_scale(x, y), thread_scale(x, y), 1])
      screw_hole(screw_spec, thread=true, length=thickness+2, anchor=BOTTOM);
    }
  }
}

// Add text labels.

text_height = 0.6;

for(x=[0:holes_x-1]) {
  for(y=[0:holes_y-1]) {
    translate([spacing*(x+1), spacing*(y+0.5), thickness])
    linear_extrude(height = text_height) {
      text(str(thread_scale(x, y) * 100), size = 2, halign = "center", valign = "center", font = "DejaVu Sans:style=Bold");
    }
  }
}

translate([spacing * (holes_x + 1) / 2, spacing * (holes_y + 0.5), thickness])
linear_extrude(height = text_height) {
  text("M6 scaled by %", size = 2, halign = "center", valign = "center", font = "DejaVu Sans:style=Bold");
}