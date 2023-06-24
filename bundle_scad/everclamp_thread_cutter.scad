// Use calibration_holes.stl to find the right value for your printer.
thread_scale_xy = 100/100;

$fn=50;

holes_x = 3;
holes_y = 7;

// These only make sense for odd arrays.
center_x = floor(holes_x/2);
center_y = floor(holes_y/2);

// Choose a reference hole:
//reference_hole = [0, 0];  // bottom left hole
//reference_hole = [center_x, center_y];  // center hole
reference_hole = [-1, -1];  // typical slab corner, not a hole

// The reference hole will be cut +Z from these coordinates.
reference_xyz = [4, 0, 0];

// How far +Z to cut the threads, typically the slab thickness.
thread_length = 8;

// Leave this empty for a complete array.
// Otherwise, specific holes may be turned off or cut short.
suppress_holes = [
  [center_x, center_y, 0],       // z=0, hole suppressed
  [center_x-1, center_y-1, -4],  // z < 0, cut threads z mm from the top.
  [center_x+1, center_y-1, 4],   // z > 0, cut threads z mm from the bottom.
];

// These values are defined by everclamp.org
screw_spec = "M6x1";
spacing = 25/3;

module transparent_stl() {
  if ($preview) {
    // Muck with OpenSCAD preview mode.
    %color("darkcyan", .5) stl_blob();
  } else {
    stl_blob();
  }
}

function lookup_suppress_holes(x, y, arr=suppress_holes, i=0) = 
    i >= len(arr) ? undef : 
    (arr[i].x == x && arr[i].y == y) ? arr[i].z : 
    lookup_suppress_holes(x, y, arr, i+1);

difference() {
  transparent_stl();
  
  color("red")
  translate(reference_xyz)
  for(x=[0:holes_x-1]) {
    for(y=[0:holes_y-1]) {
      z = lookup_suppress_holes(x, y);
      translate([spacing*(x-reference_hole.x), spacing*(y-reference_hole.y), 0])
      scale([thread_scale_xy, thread_scale_xy, 1])      
      if (z == undef) {
        // Default, cut threads the entire length.
        screw_hole(screw_spec, thread=true, length=thread_length, anchor=BOTTOM);
      } else if (z > 0) {
        // Cut threads from 0 up.
        screw_hole(screw_spec, thread=true, length=thread_length-abs(z), anchor=BOTTOM);
      } else if (z < 0) {
        // Cut threads from thread_length down.
        translate([0, 0, abs(z)])
        screw_hole(screw_spec, thread=true, length=thread_length-abs(z), anchor=BOTTOM);
      } else {
        // z = 0, hole suppressed.
      }
    }
  }
}

// bundle_scad includes everything below this point.
include <demo_unthreaded.stl.scad>
include <BOSL2/std.scad>
include <BOSL2/screws.scad>
