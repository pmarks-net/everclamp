include <BOSL2/std.scad>
include <BOSL2/screws.scad>

// Use calibration_bolts.stl to find the right value for your printer.
thread_scale_xy = 96/100;

// Dimensions of the thumb-fitting head.
thumb_diameter = 15;
thumb_height = 8;

// Length of the screw threads.
screw_length = 10;

// See https://github.com/BelfrySCAD/BOSL2/wiki/screws.scad#subsection-screw-naming
screw_spec = "M6x1";

$fn=50;

difference() {
    cylinder(d=thumb_diameter, h=thumb_height, anchor=BOTTOM);

    bumps = 12;
    for(i=[0:bumps-1]) {
        rotate([0, 0, i*(360/bumps)]) {
            translate([thumb_diameter/2, 0, -1]) {
                cylinder(d=2, h=thumb_height+2, anchor=BOTTOM);
            }
        }
    }
}

translate([0, 0, thumb_height]) {
    scale([thread_scale_xy, thread_scale_xy, 1])
    screw(screw_spec, length=screw_length, head="none", drive="none", blunt_start1=false, blunt_start2=true, anchor=BOTTOM);
}
