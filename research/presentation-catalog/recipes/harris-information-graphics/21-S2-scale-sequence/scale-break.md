---
name: Scale Break
slug: scale-break
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Scale Breaks, pp. 338-339"

intent: Introduce an intentional discontinuity in a graph scale to accommodate data with large value gaps or to expand detail in a specific range
direction: construction

components:
  - element: break-indicator
    encodes: Visual symbol showing where scale is discontinuous (wavy lines, straight lines, or gaps)
    required: true
  - element: upper-scale-segment
    encodes: Scale portion above the break
    required: true
  - element: lower-scale-segment
    encodes: Scale portion below the break (often near zero for reference)
    required: false
  - element: data-graphic-break
    encodes: Corresponding break shown in data graphics (bars, columns)
    required: false

parameters:
  break_type: "full | partial"
  break_style: "wavy lines | straight lines | gap"
  include_zero: "whether to retain zero baseline for reference"
  break_location: "interior | bottom | top"

related: []  # TBD: expanded-scale, linear-scale

warnings:
  - "Scale breaks are controversial and can cause misinterpretation"
  - "Partial breaks may be overlooked by viewers"
  - "Breaks distort area-based comparisons in histograms and area graphs"
  - "Avoid using breaks with graphs where area encodes value"

extensions:
  harris_entry: "Scale"
  alternate_names: ["split grid"]
  typical_use: "accommodating large data gaps, expanding scale in region of interest"
---

## Description

Scale breaks are intentional discontinuities in the scales of graphs. They are one of the more controversial aspects of graphs and are a significant factor in misinterpretations. The major reasons scale breaks are used are: (1) to reduce the size of the graph when scales are expanded, and (2) to call changes in scales to the viewer's attention.

Three major situations where scale breaks are used:
1. Large differences exist between the high and low values of the data being plotted
2. Differences between data points are small compared to the actual values of the data points
3. Changes in scale intervals or units of measure occur (e.g., years and quarters on the same axis)

## Examples

> "Scale breaks are intentional discontinuities in the scales of graphs. They are one of the more controversial aspects of graphs and are a significant factor in misinterpretations." (p. 338)

**Full vs. Partial Scale Breaks:**
The PDF shows three variations: (1) full scale break using wavy lines running completely across the graph, (2) full scale break using straight lines, (3) partial scale break appearing only at the edges. "Full scale breaks are better than partial breaks at bringing the scale break to the viewer's attention." (p. 338)

**Data Graphics Extending Across Breaks:**
> "Even though it is the tops of columns and the ends of bars that denote the values the data graphics represent, viewers many times equate the area of the data graphics to the values they represent." (p. 338)

The PDF illustrates how scale breaks should extend through data graphics (bars, columns) as well as the scale itself, to clearly alert viewers to the discontinuity.

## Usage

Scale breaks are appropriate when:
- Data values cluster far from zero and fine differences matter
- The graph would otherwise be impractically large
- Alerting viewers to an intentional change in scale intervals

Scale breaks should be avoided with:
- Histograms and area graphs where area encodes value
- Graphs where viewers might miss the break
- Time series used for trend analysis (breaks distort perceived trends)

Best practices:
- Use full breaks (across entire graph width/height) rather than partial
- Use wavy or ragged lines that attract attention
- Extend breaks through data graphics, not just scales
- Consider whether two separate graphs would be clearer

## Notes

> "Breaks generally are not used with any graph in which the areas of the data graphics are proportional to the values they represent, such as histograms, area bar graphs, and area column graphs. The introduction of scale breaks in such graphs distorts the data and makes it difficult for the viewer to make meaningful observations." (p. 339)

When data is missing on a time series graph, the intervals should be included and the data left blank or bridged over, rather than using a scale break to compress the gap.
