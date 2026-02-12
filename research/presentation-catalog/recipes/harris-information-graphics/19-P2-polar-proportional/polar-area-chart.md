---
name: Polar Area Chart
slug: polar-area-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Polar Coordinate and Polar Graph, pp. 298-300"

intent: Display values across angular categories using sectors whose radial extent (area) encodes magnitude, creating a rose or coxcomb-like pattern
direction: both

components:
  - element: angular-sectors
    encodes: Categories or time periods; typically equal angular width
    required: true
  - element: radial-extent
    encodes: Value for each category; sector radius proportional to value (or sometimes area)
    required: true
  - element: center-point
    encodes: Origin from which all sectors radiate; represents zero value
    required: true
  - element: radial-scale
    encodes: Value scale from center outward
    required: true
  - element: sector-boundaries
    encodes: Lines or gaps separating adjacent sectors
    required: false
  - element: angular-labels
    encodes: Category or period names around the circumference
    required: true

parameters:
  sector_count: "typically 4-12 sectors"
  encoding_method: "radius proportional to value | area proportional to value"
  sector_fill: "solid | patterned | colored"
  sector_spacing: "adjacent | separated"

related:
  - slug: polar-graph
    relationship: variant-of
  - slug: pie-chart
    relationship: contrasts
  - slug: radar-graph
    relationship: contrasts

warnings:
  - "If radius is proportional to value, area grows with the square of the value, potentially exaggerating differences"
  - "If area is proportional to value, radius grows with square root, which may understate visual differences"
  - "Clearly indicate whether radius or area encodes the data"
  - "Best suited for cyclical data (hours, months, directions) rather than arbitrary categories"

extensions:
  harris_entry: "Polar Coordinate and Polar Graph"
  alternate_names:
    - "rose diagram"
    - "coxcomb chart"
    - "Nightingale rose chart"
    - "polar bar chart"
    - "radial bar chart"
    - "circular histogram"
  typical_use: "Wind rose diagrams, seasonal data patterns, directional frequencies, cyclical time series"
  historical_note: "Florence Nightingale famously used this chart type (coxcomb) to visualize causes of mortality in the Crimean War"
---

## Description

A polar area chart displays values using sectors radiating from a central point, where the radial extent of each sector encodes a value. Unlike a pie chart where the angle of each slice varies, in a polar area chart all sectors typically have equal angular width, and the radius (or area) varies to show different values.

This chart type is particularly suited for data that has a natural circular or cyclical arrangement, such as:
- Wind direction and speed (wind rose)
- Monthly or hourly patterns
- Compass directions
- Any data with angular periodicity

The polar area chart combines the directional clarity of polar graphs with the area-based comparison of bar charts.

## Examples

While Harris does not extensively detail the polar area chart as a separate entry, the concept emerges from the polar graph discussion. The light intensity example (p. 298) demonstrates the principle:
> A polar graph showing the intensity of light in all directions around a lamp. The curve shows how intensity varies by angle, and when filled to the center, this creates a polar area representation.

The hearing ability example similarly shows values at each angle:
> A polar graph used to record a person's hearing ability for sounds emanating from different angles. The radial distance at each angle represents hearing sensitivity.

These continuous curves can be discretized into sectors for categorical angular data, creating what is commonly known as a rose diagram or coxcomb chart.

## Usage

**When to use:**
- Cyclical data with natural angular meaning (time of day, months, compass directions)
- Wind speed and direction data (wind rose)
- Any periodic phenomenon measured at regular angular intervals
- Comparing multiple values across categories that wrap around

**When NOT to use:**
- Non-cyclical categorical data (use bar chart instead)
- When precise value comparison is critical
- When categories have no natural angular relationship
- Small number of categories (3 or fewer)

**Design considerations:**
- Decide whether radius or area should be proportional to value
  - Radius proportional: easier to construct, but visually exaggerates large values
  - Area proportional: fairer visual comparison, but harder to read specific values
- Use consistent coloring or fill patterns
- Clearly label each sector
- Include a radial scale for reference

**Comparison with related charts:**
- **Pie chart:** Angle varies, radius constant; shows parts of whole
- **Polar area chart:** Radius varies, angle constant; shows values by direction/category
- **Radar graph:** Points connected by lines; emphasizes profile shape

## Notes

The polar area chart is historically significant as the chart type Florence Nightingale used in her famous diagram showing causes of mortality during the Crimean War. Her "coxcomb" diagram used sectors representing months, with radial extent showing death rates from different causes.

When multiple data series are shown, they can be displayed as nested sectors, stacked sectors, or multiple overlapping polar area charts with transparency.
