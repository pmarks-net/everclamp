// An array of M6 bolts (male threads) with different m6_bolt_scale_xy values.
// Use a real M6 nut and bolt to find the correct value for your slicer/printer.

include <BOSL2/std.scad>
include <BOSL2/screws.scad>

$fn=50;

thickness = 1.0;  // flexible?
edge_spacing = 8;
hole_spacing = 10;
screw_spec = "M6x1";
screw_length = 8;
text_height = 0.6;


holes_x = 5;
holes_y = 5;
thread_scales = [for (i = [90:1:114]) i];
function thread_scale(x, y) = thread_scales[(holes_y-y-1)*holes_x + x]/100;

total_x = edge_spacing*2 + hole_spacing*(holes_x-1);
total_y = edge_spacing*2 + hole_spacing*(holes_y-1);

cube([total_x, total_y, thickness]);

for(x=[0:holes_x-1]) {
  for(y=[0:holes_y-1]) {
    translate([edge_spacing + hole_spacing*x, edge_spacing + hole_spacing*y, thickness])
    scale([thread_scale(x, y), thread_scale(x, y), 1])
    screw(screw_spec, length=screw_length, head="none", drive="none", blunt_start1=false, blunt_start2=true, anchor=BOTTOM);    

    
    translate([edge_spacing + hole_spacing*x, edge_spacing + hole_spacing*(y-0.5), thickness])
    linear_extrude(height = text_height) {
      text(str(thread_scale(x, y) * 100), size = 2, halign = "center", valign = "center", font = "DejaVu Sans:style=Bold");
    }
  
  }
}

translate([total_x/2, edge_spacing + hole_spacing*(holes_y-0.5), thickness])
linear_extrude(height = text_height) {
  text("M6 scaled by %", size = 2, halign = "center", valign = "center", font = "DejaVu Sans:style=Bold");
}