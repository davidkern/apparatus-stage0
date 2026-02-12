---
name: Icon Symbol
slug: icon-symbol
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Symbol, Icons as symbols, p. 386"

intent: Use miniature graphs as symbols to encode multiple variables (up to 10-20) for comparative display on graphs or maps
direction: both

components:
  - element: icon-shape
    encodes: Multiple variables through profile, bars, or polygon form
    required: true
  - element: icon-position
    encodes: Location (on map) or category (in array)
    required: true
  - element: legend
    encodes: Variable names mapped to icon elements
    required: true

parameters:
  icon_type: area | line | column | polygon
  variable_count: 3-20
  display_context: graph | map | comparison-array

related: []  # TBD: see symbol-display, icon-comparison-display

warnings:
  - "Since there are no scales on the icons, a legend always accompanies such a display"
  - "Icons show relative sizes and patterns, not specific quantitative information"

extensions:
  harris_entry: "Symbol"
  alternate_names: ["profile icon", "star symbol", "snowflake symbol", "glyph"]
  typical_use: "Comparing multiple entities across many variables"
---

## Description

Miniature graphs without titles, labels, tick marks, or grid lines are sometimes used as symbols. In this form they are sometimes referred to as icons. As many as 10 to 20 variables can be encoded on this type of symbol. The variables might be quantitative or qualitative.

Icons transform the familiar forms of statistical graphs (area charts, line charts, column charts, radar/polygon charts) into compact symbols suitable for placement on maps or in comparative arrays.

## Examples

**Four icon types** (p. 386):

| Icon Type | Description |
|-----------|-------------|
| Area or profile | "Each point on the curve represents a different variable. The higher the point, the more favorable that characteristic. The greater the area of a symbol, the higher the overall rating of the thing represented." |
| Line | "Similar to an area icon except a border is added as a frame of reference for estimating relative values. When a scale of zero to one is used, the bottom of the frame is zero and the top is one." |
| Column or histogram | "Each column represents a different variable. The height of the columns are proportional to the values they represent." |
| Polygon, star, snowflake, or profile | "Each point on the polygon represents a different variable. The length of the spoke leading to the point is proportional to the value it represents." |

**Icon symbols used on a graph** (p. 386):
Harris shows an example with sales data where column-type icons display seasonal cycles. The icon shows "Actual values for five years used in average" alongside a line showing "Seasonal cycle based on five-year averages."

**Icon symbols used on a map** (p. 386):
Polygon/star icons positioned at geographic locations, each encoding the same set of variables for that region.

**Icon comparison display** (p. 386):
An array of segmented line icons (Brands A through J) with an accompanying legend:
- A - Hard disk capacity
- B - Installed RAM
- C - Expandable RAM
- D - Speed
- E - Monitor resolution
- F - Monitor size
- G - Accessories
- H - Price

## Usage

**When to use icon symbols:**
- Comparing multiple entities across many variables
- Geographic distribution of multivariate data
- Quick visual scanning for patterns and outliers
- When overall profiles matter more than precise values

**Legend requirements:**
> "Since there are no scales on the icons, a legend always accompanies such a display." (p. 386)

The legend must identify:
- What each position/spoke/column represents
- The meaning of high vs. low values
- Any scale information (if applicable)

**Interpretation approach:**
> "The function of the icons is not to convey specific quantitative information. Instead, they are used to show such things as relative sizes, overall comparisons, trends, patterns, etc." (p. 386)

**Design considerations:**
- Consistent variable ordering across all icons
- Sufficient size for pattern recognition
- Clear differentiation between icons in close proximity

## Notes

Harris also describes Symbol Display (or Symbolic Display), "sometimes called an icon comparison display," as a group of icons assembled for simultaneously comparing and/or screening a sizable number of entities with regards to three or more variables.

The polygon/star icon is particularly effective for detecting overall "good" vs. "poor" performers (larger area = better overall) and for spotting unusual profiles (asymmetric shapes indicate variable performance across dimensions).

See Icon Comparison Display entry for more extensive treatment of comparative icon arrays.
