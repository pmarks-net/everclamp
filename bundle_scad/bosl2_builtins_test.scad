// This test file uses lots of features from BOSL2/builtins.scad.
// bundle_scad.py requires renamer_hack() to successfully bundle this file.

include <BOSL2/std.scad>

translate(rands(-20,20,3)) linear_extrude(1) square(10);  // don't rename square()
translate(rands(-20,20,3)) linear_extrude(1) circle(10);
translate(rands(-20,20,3)) text(str("text()", version()), size=4, anchor=TOP);
translate(rands(-20,20,3)) rotate(rands(0,20,3)) cube(10, anchor=TOP);
translate(rands(-20,20,3)) scale([1, 1, 1]) cylinder(h=10, d=10, anchor=TOP);
translate(rands(-20,20,3)) multmatrix([[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]) sphere
(d=10, anchor=TOP);

// None of this stuff should actually be included.
union() {} // include <bogus.scad>
/*
include <bogus.scad>
*/
*text("\"/**/include <bogus.scad>");