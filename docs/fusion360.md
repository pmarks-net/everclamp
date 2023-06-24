Moved Fusion360-specific stuff to its own file, because I'm not using this for threads anymore.

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
