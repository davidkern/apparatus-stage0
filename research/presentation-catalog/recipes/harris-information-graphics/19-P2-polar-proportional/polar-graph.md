---
name: Polar Graph
slug: polar-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Polar Coordinate and Polar Graph and Polar Scale, pp. 298-300"

intent: Display data in terms of values and angles using a circular coordinate system where distance from center encodes value and angular position encodes direction or category
direction: both

components:
  - element: circular-grid
    encodes: Framework for plotting data points; concentric circles mark radial values
    required: true
  - element: value-scale
    encodes: Radial distance from center (radius vector); can be linear or logarithmic
    required: true
  - element: angle-scale
    encodes: Angular position in degrees or radians; typically 0-360 degrees
    required: true
  - element: zero-reference-axis
    encodes: Starting point for angle measurement; can be located anywhere
    required: true
  - element: radial-grid-lines
    encodes: Lines radiating from center to mark angular divisions
    required: false
  - element: circular-grid-lines
    encodes: Concentric circles marking value increments on the radial scale
    required: false
  - element: data-curve
    encodes: Connected data points showing values at various angles
    required: false
  - element: pole-or-origin
    encodes: Center point of the graph; represents zero or minimum radial value
    required: true

parameters:
  value_scale_type: linear | logarithmic
  angle_units: degrees | radians
  angle_direction: clockwise | counterclockwise
  zero_reference_position: top | right | bottom | left | custom
  angle_range: "0-360 | 0-720 | custom (for multiple revolutions)"

related:
  - slug: radar-graph
    relationship: variant-of
  - slug: three-dimensional-polar-graph
    relationship: variant-of
  - slug: polar-area-chart
    relationship: variant-of

warnings:
  - "The same point can be described by multiple sets of polar coordinates when angles exceed 360 degrees"
  - "Converting polar coordinates to rectangular coordinates is possible but may reduce intuitiveness for directional data"
  - "Zero reference axis and angle direction should follow conventions for the field or be clearly labeled"

extensions:
  harris_entry: "Polar Coordinate and Polar Graph and Polar Scale"
  alternate_names:
    - "radial graph"
    - "circular graph"
    - "polar coordinate graph"
  typical_use: "Showing values that vary by direction or angle, such as light intensity around a lamp, hearing ability from different angles, or wind direction frequency"
  coordinate_terminology:
    radial_distance: "radius vector, polar distance, radius, or value (designated r)"
    angular_position: "polar angle, vectorial angle, or circular angle (designated theta)"
    center: "pole or origin"
    angular_axis: "circular or polar axis"
---

## Description

A polar graph is a circular graph on which data are displayed in terms of values and angles. Data points are specified by two polar coordinates: one indicating distance from the center (radius vector or value) and one indicating angular position from a zero reference axis (polar angle).

The radial value scale typically has its smallest values at the center and largest at the circumference, though any upper and lower values can be used. The angular scale typically spans 0 to 360 degrees, with the zero reference axis positioned by convention or preference. Angles can progress in either direction (clockwise or counterclockwise).

Polar graphs are particularly suited for data that naturally relates to direction or angular position, such as directional measurements, cyclical phenomena, or any situation where the relationship between value and angle is meaningful.

## Examples

Harris illustrates two practical applications (p. 298):

**Hearing ability test:**
> A polar graph recording a person's hearing ability for sounds emanating from different angles around them. The center represents the subject's head position, with the curve showing relative hearing sensitivity at each angle. The graph reveals the subject can hear sounds on one side better than the other.

**Light intensity measurement:**
> A polar graph showing the intensity of light in all directions around a lamp. The curve demonstrates the lamp was designed to focus the majority of its light in one direction, with the shape clearly showing the directional light distribution.

**Degrees and radians (p. 299):**
> In certain fields, angles are measured in radians instead of degrees. There are 2 pi radians in a full 360 degree circle, making each degree equal to approximately 0.0175 radians.

**Multiple revolutions (p. 299):**
> When angles exceed 360 degrees (such as measuring force to turn a knob through several revolutions), data can be plotted around the circle multiple times, or the scale can be expanded to accommodate the additional degrees.

## Usage

**When to use:**
- Data that varies by direction or angle
- Directional measurements (wind, sound, light, radiation patterns)
- Cyclical phenomena with angular periodicity
- Technical applications where polar representation is conventional

**When NOT to use:**
- Time series data (use line graph or column graph)
- Category comparisons without directional meaning
- When precise value reading is critical (rectangular graphs are easier to decode)

**Scale conventions:**
- Zero reference axis location and angle direction often follow field-specific conventions
- If no convention exists, choose based on data nature and clearly label the graph
- Value scales can be linear or logarithmic depending on data range

**Multiple data series:**
Multiple data series can be plotted on the same polar graph using different symbols to differentiate them. Symbols can be shown alone or connected with lines.

## Notes

Polar data can be converted to rectangular coordinates and plotted on a rectangular grid. When this is done, the center of the rectangular grid corresponds to the center of the circular grid, and values increase in all four directions from the center. The conversion can be done mathematically or graphically.

Polar graphs can also be used as vector graphs by drawing arrows from the center to the data points, showing both magnitude and direction.
