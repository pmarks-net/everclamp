![](media/everclamp_logo.png)

## Specification

The Everclamp specification defines the following rectangular array of threaded holes:

- Thread pattern: **M6x1**
- Grid spacing: **25/3 mm** (8.333 mm) center to center

## Why would anyone want a dense array of threaded holes?

For clamping stuff wherever.

I was trying to make a mutli-tool to sandpaper adapter, thinking of all the ways one might attach sandpaper to a solid block.  The basic problem is to make two flat plates squeeze together like a clamp.  But where to put the threads, when there might be sandpaper in the way?  Well, 3D printers can make threads now, so why not put them everywhere and figure out the rest at runtime?

My point is not that a dense array of threaded holes is incredibly useful, but it is *mildly* useful, and in order to use one I had to define a grid.  Hence the everclamp standard.  If you make an object with ~6mm diameter holes spaced by some multiple of 25/3 mm, then it can attach to an oscillating multi-tool, or whatever else someone makes an adapter for.

## Why M6 threads?

Let's see what the metric system has to offer:

| Bolt Size | Thread Pitch (mm) | Thread Diameter (mm) | Hexagonal Head Width (mm)|
|-----------|-------------------|----------------------|--------------------------|
| M3        | 0.5               | 3                    | 5.5                      |
| M4        | 0.7               | 4                    | 7                        |
| M5        | 0.8               | 5                    | 8                        |
| M6        | 1                 | 6                    | 10                       |
| M7        | 1                 | 7                    | 11                       |
| M8        | 1.25              | 8                    | 13                       |

The main use case is 3D printing with layer heights around 0.2 mm, so a thread pitch below 1 mm is not reliable.  M6 is the smallest size with a 1 mm pitch, and also has enough cross-sectional area for light duty plastic thumbscrews.

## Why 25/3 mm?

The densest possible spacing for an array of M6 holes is about 8 mm, so we're looking for a number in that ballpark.  I don't like 10 mm because it's not dense enough.

For a grid standard to make any sense in the context of the metric system, it needs to include round numbers like "100 mm".  It turns out that 25/3 = 8.333 is very close to our target density.  This spacing includes numbers like 16.6, 25, 33.3, 50, 66, 100, it's the megahertz race all over again.

The 8.333 mm spacing means that columns `n` and `n+3` are separated by exactly 25 mm, and `n+12` by 100 mm.  So the everclamp grid aligns with [VESA MIS-F M6](https://en.wikipedia.org/wiki/Flat_Display_Mounting_Interface#Variants) given a large enough array.

<img src="media/everclamp5x5.jpg" width="480">

## Example

This [5x5 Everclamp](https://www.thingiverse.com/thing:6083263) attaches to an oscillating multitool, using a 5x5 sqwasher and thumbscrews to hold sandpaper, a sponge, etc.:
![](media/multitool_sandpaper.jpg)

## Calibration

Always use an off-the-shelf M6 nut and bolt for tolerance calibration when 3D printing Everclamp-compatible threads.

When I create M6x1 threads in Fusion360, the holes print too tight.  My solution is a bit janky, but it works:

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

- Insert these scaled-up alternatives:

```
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
        <Class>6H x 105%</Class>
        <MajorDia>6.454</MajorDia>
        <PitchDia>5.696</PitchDia>
        <MinorDia>5.287</MinorDia>
        <TapDrill>5.250</TapDrill>
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
