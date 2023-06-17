## Specification

The Everclamp specification simply defines an array of threaded holes:

- Thread pattern: **M6x1**
- Grid spacing: **25/3 mm** (8.333 mm) center to center

## Why these values?
M6 bolts have a 1mm thread pitch, which is just coarse enough to practically 3D print threaded holes and thumbscrews.  The densest possible spacing for such an array is about 8mm, so we're looking for a nearby value that aligns nicely with metric grids like 100x100 mm.  In theory, Everclamp would be compatible with [VESA MIS-F M6](https://en.wikipedia.org/wiki/Flat_Display_Mounting_Interface#Variants) if you printed a large enough array.

## Calibration

When 3D printing Everclamp-compatible threads, use a standard M6 nut and bolt for tolerance calibration.

## Examples

This 5x5 Everclamp attaches to an oscillating multitool, using a 5x5 sqwasher and M6 thumbscrews to hold sandpaper in any orientation:
![](media/multitool_sandpaper.jpg)

4 columns of Everclamp should have a center-to-center spacing of 25 mm:
![](media/everclamp5x5.jpg)
