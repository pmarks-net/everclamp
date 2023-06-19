![](media/everclamp_logo.png)

## Specification

The Everclamp specification defines the following rectangular array of threaded holes:

- Thread pattern: **M6x1**
- Grid spacing: **25/3 mm** (8.333 mm) center to center

## Github repo

https://github.com/pmarks-net/everclamp/

## Why would anyone want a dense array of threaded holes?

For clamping stuff wherever.

I was trying to make a multi-tool to sandpaper adapter, thinking of all the ways one might attach sandpaper to a solid block.  The general solution is to squeeze two flat plates together like a clamp.  But where to put the threads, when there might be sandpaper in the way?  Well, we have 3D printers now, so let's print threads everywhere and figure out the rest at runtime.

My point is not that a dense array of threaded holes is incredibly useful, but it is *mildly* useful, and in order to use one I had to define a grid.  Hence the everclamp standard.  If you make an object with ~6mm holes spaced by some multiple of 25/3 mm, then it can clamp to an oscillating multi-tool, or whatever else someone makes an adapter for.

## Why M6 threads?

Let's see what the metric system has to offer:

| Bolt Size | Thread Pitch (mm) | Thread Diameter (mm) | Tensile Stress Area (mm^2)|
|-----------|-------------------|----------------------|---------------------|
| M3        | 0.5               | 3                    | 5.0                 |
| M4        | 0.7               | 4                    | 8.8                 |
| M5        | 0.8               | 5                    | 14.2                |
| **M6**    | **1**             | **6**                | **20.1**            |
| M7        | 1                 | 7                    | 28.9                |
| M8        | 1.25              | 8                    | 36.6                |

The main use case is 3D printing with layer heights around 0.2 mm, so a thread pitch below 1 mm is not reliable.  M6 is the smallest size with a 1 mm pitch, and also provides enough area for light duty plastic thumbscrews.

## Why 25/3 mm?

The densest possible spacing for an array of M6 holes is about 8 mm, so we're looking for a number in that ballpark.  10 mm is not dense enough for clamping wherever.

For a grid standard to make any sense in the context of the metric system, it needs to include round numbers like "100 mm".  It turns out that 25/3 = 8.333 is very close to our target density.  This spacing includes numbers like 16.6, 25, 33.3, 50, 66, 100, so it's like the megahertz race all over again.

An 8.333 mm spacing means that columns `n` and `n+3` are separated by exactly 25 mm, and `n+12` by 100 mm.  In theory, the Everclamp grid is compatible with [VESA MIS-F M6](https://en.wikipedia.org/wiki/Flat_Display_Mounting_Interface#Variants), given a large enough array.

<img src="media/everclamp5x5.jpg" width="480">

## Calibration

I modeled arrays of M6 holes ([scad](https://github.com/pmarks-net/everclamp/blob/main/calibration_holes.scad), [stl](https://github.com/pmarks-net/everclamp/blob/main/calibration_holes.stl)) and M6 bolts ([scad](https://github.com/pmarks-net/everclamp/blob/main/calibration_bolts.scad), [stl](https://github.com/pmarks-net/everclamp/blob/main/calibration_bolts.stl)) scaled by 90-114% in the X-Y plane, so you can print these calibration models and explore which scaling factor is needed to make your slicer and printer compatible with off-the-shelf M6 nuts and bolts.

In an ideal future, slicers and printers would just make perfect nuts and bolts at 100% scaling factor, in which case these models could serve as a benchmark.

![](media/calibration_arrays.jpg)

## Thread scaling in Fusion360

When I create M6 threads in Fusion360, the only scaling factor available is 100%, which prints too tight, so here is a somewhat-janky workaround:

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

- Insert these scaled alternatives:

```
      <Thread>
        <Gender>internal</Gender>
        <Class>6H x 90%</Class>
        <MajorDia>5.532</MajorDia>
        <PitchDia>4.883</PitchDia>
        <MinorDia>4.532</MinorDia>
        <TapDrill>4.500</TapDrill>
      </Thread>
      <Thread>
        <Gender>internal</Gender>
        <Class>6H x 92%</Class>
        <MajorDia>5.655</MajorDia>
        <PitchDia>4.991</PitchDia>
        <MinorDia>4.632</MinorDia>
        <TapDrill>4.600</TapDrill>
      </Thread>
      <Thread>
        <Gender>internal</Gender>
        <Class>6H x 94%</Class>
        <MajorDia>5.778</MajorDia>
        <PitchDia>5.099</PitchDia>
        <MinorDia>4.733</MinorDia>
        <TapDrill>4.700</TapDrill>
      </Thread>
      <Thread>
        <Gender>internal</Gender>
        <Class>6H x 96%</Class>
        <MajorDia>5.901</MajorDia>
        <PitchDia>5.208</PitchDia>
        <MinorDia>4.834</MinorDia>
        <TapDrill>4.800</TapDrill>
      </Thread>
      <Thread>
        <Gender>internal</Gender>
        <Class>6H x 98%</Class>
        <MajorDia>6.024</MajorDia>
        <PitchDia>5.316</PitchDia>
        <MinorDia>4.934</MinorDia>
        <TapDrill>4.900</TapDrill>
      </Thread>
      <Thread>
        <Gender>internal</Gender>
        <Class>6H x 102%</Class>
        <MajorDia>6.270</MajorDia>
        <PitchDia>5.534</PitchDia>
        <MinorDia>5.136</MinorDia>
        <TapDrill>5.100</TapDrill>
      </Thread>
      <Thread>
        <Gender>internal</Gender>
        <Class>6H x 104%</Class>
        <MajorDia>6.393</MajorDia>
        <PitchDia>5.642</PitchDia>
        <MinorDia>5.236</MinorDia>
        <TapDrill>5.200</TapDrill>
      </Thread>
      <Thread>
        <Gender>internal</Gender>
        <Class>6H x 106%</Class>
        <MajorDia>6.516</MajorDia>
        <PitchDia>5.750</PitchDia>
        <MinorDia>5.337</MinorDia>
        <TapDrill>5.300</TapDrill>
      </Thread>
      <Thread>
        <Gender>internal</Gender>
        <Class>6H x 108%</Class>
        <MajorDia>6.639</MajorDia>
        <PitchDia>5.859</PitchDia>
        <MinorDia>5.438</MinorDia>
        <TapDrill>5.400</TapDrill>
      </Thread>
```

## Example

This [5x5 Everclamp](https://www.thingiverse.com/thing:6083263) attaches to an oscillating multitool, using a 5x5 sqwasher and thumbscrews to hold sandpaper, a sponge, etc.:
![](media/multitool_sandpaper.jpg)
