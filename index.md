## Specification

The Everclamp specification defines the following rectangular array of threaded holes:

- Thread pattern: **M6x1**
- Grid spacing: **25/3 mm** (8.333 mm) center to center

## Why these values?
M6 bolts have a 1mm thread pitch, which is just coarse enough to practically 3D print threaded holes and thumbscrews.  The densest possible spacing for such an array is about 8mm, so we're looking for a nearby value that aligns nicely with metric grids like 100x100 mm.  In theory, Everclamp would be compatible with [VESA MIS-F M6](https://en.wikipedia.org/wiki/Flat_Display_Mounting_Interface#Variants) if you printed a large enough array.

## Examples

This [5x5 Everclamp](https://www.thingiverse.com/thing:6083263) attaches to an oscillating multitool, using a 5x5 sqwasher and thumbscrews to hold sandpaper in any orientation:
![](media/multitool_sandpaper.jpg)

4 columns of Everclamp have a center-to-center spacing of exactly 25 mm:
![](media/everclamp5x5.jpg)

## Calibration

Always use an off-the-shelf M6 nut and bolt for tolerance calibration when 3D printing Everclamp-compatible threads.

When I create M6x1 threads in Fusion360, the holes are too tight when printed.  This solution is a bit janky, but it works for me:

- Search `%localappdata%\Autodesk` for the `ISOMetricprofile.xml` file.  See [this article](https://www.autodesk.com/support/technical/article/caas/sfdcarticles/sfdcarticles/Custom-Threads-in-Fusion-360.html) for details.

- Find this section:

```
  <ThreadSize>
    <Size>6.0</Size>
    <Designation>
      <ThreadDesignation>M6x1</ThreadDesignation>
      <CTD>M6x1</CTD>
      <Pitch>1.0</Pitch>
      ...
      <Thread>
        <Gender>internal</Gender>
        <Class>6H</Class>
        <MajorDia>6.147</MajorDia>
        <PitchDia>5.425</PitchDia>
        <MinorDia>5.035</MinorDia>
        <TapDrill>5.0</TapDrill>
      </Thread>
```

- Insert this block.  Your printer may require a different scaling factor:

```
      <Thread>
        <Gender>internal</Gender>
        <Class>6H x 108%</Class>
        <MajorDia>6.63876</MajorDia>
        <PitchDia>5.859</PitchDia>
        <MinorDia>5.4378</MinorDia>
        <TapDrill>5.4</TapDrill>
      </Thread>
```
