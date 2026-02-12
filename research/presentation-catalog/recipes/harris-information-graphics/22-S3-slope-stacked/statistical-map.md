---
name: Statistical Map
slug: statistical-map
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Statistical Map, pp. 361-367"

intent: Present quantitative information about geographic areas, points, distances, or lines by encoding data values onto a base map
direction: both

components:
  - element: base-map
    encodes: Geographic context (deemphasized, showing only essential orientation)
    required: true
  - element: data-graphics
    encodes: Quantitative values via symbols, patterns, colors, or shapes
    required: true
  - element: legend
    encodes: Mapping between visual encoding and data values
    required: true
  - element: reference-type
    encodes: What the data refers to (areas, points, distances, or lines/bands)
    required: true

parameters:
  data_reference: "areas | points | distances | lines/bands"
  encoding_method: "class intervals | symbols | continuous shading"
  class_interval_method: "equal size | quantiles | natural breaks | standard deviations | progression"

related: []  # TBD: choropleth-map, proportional-symbol-map, isoline-map

warnings:
  - "Class interval selection significantly affects map interpretation"
  - "Geographic area size can bias perception independent of data values"
  - "Small areas may be difficult to fill with patterns or symbols"
  - "Eye movement between map and legend can cause distraction"

extensions:
  harris_entry: "Statistical Map"
  alternate_names:
    - "quantitative map"
    - "data map"
    - "thematic map"
  encoding_variations:
    single_variable: ["numeric value", "pattern/texture", "shading/color", "dot density", "proportional symbols", "columns", "framed rectangles", "pie sectors", "spheres"]
    multiple_variables: ["pie charts", "star icons", "bar/column graphs", "multi-point symbols"]
---

## Description

A statistical map presents quantitative information by encoding data values onto a geographic base map. The data may reference areas (countries, states), specific points (cities, stores), distances between locations, or lines/bands of equal values. Harris notes that "the base map containing geographic information onto which the attribute data is superimposed is deemphasized with only enough detail included to orient the viewer."

## Examples

Harris provides extensive examples across seven pages (361-367), covering:

**Area encoding methods (p. 361, 365):**
- Class intervals (choropleth): Areas filled with patterns/shades representing value ranges
- Proportional symbols: Circles, columns, or framed rectangles sized by value
- Example shows a choropleth map with legend showing ranges: 0-49, 50-99, 100-149, etc.

**Point encoding (p. 362):**
- Proportional circles placed at city locations
- Pie segments showing breakdown at each point

**Distance encoding (p. 362):**
- Lines connecting cities with numeric distance labels
- Example shows both "Air distances in thousands of kilometers" and "Driving distances in miles"

**Isoline/band encoding (p. 362):**
- Contour lines connecting points of equal value
- Bands of equal value (e.g., shipping zones where all destinations cost the same)

**Distorted maps (p. 363):**
- Area sizes proportional to data values rather than land area
- Time-distance maps where distance represents travel time

## Usage

Statistical maps are most effective when:
- Geographic patterns in data are meaningful
- Spatial distribution is the primary interest
- Audience can orient themselves with minimal geographic detail
- Data can be meaningfully aggregated by geographic units

**Class interval selection methods (p. 367):**
- **Equal size intervals**: Total range divided by desired number of intervals
- **Quantiles**: Each interval contains equal number of observations
- **Natural breaks**: Intervals at dips in data histogram
- **Standard deviations**: For normally distributed data highlighting deviation from mean
- **Arithmetic/geometric progression**: For highly skewed data

## Notes

Harris identifies key concerns with class interval maps: interval selection is somewhat arbitrary, geographic area size biases perception, small areas are hard to fill, and legend consultation causes distraction. The "unclassed" or "classless" methods using proportional symbols were developed partly in response to these concerns. The extensive treatment (7 pages) reflects the complexity and importance of statistical mapping in information graphics.
