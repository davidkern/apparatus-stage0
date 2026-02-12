---
name: Graph Terminology and Elements
slug: graph-terminology
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Graph, Terminology, pp. 176-177"

intent: Identify and name the standard components of graphs using consistent terminology
direction: recognition

components:
  - element: chart-title
    encodes: Overall identification of the chart
    required: false
  - element: chart-subtitle
    encodes: Secondary descriptive text
    required: false
  - element: graph-title
    encodes: Specific title for the data display
    required: false
  - element: plot-area
    encodes: Region where data graphics are drawn (also called data region)
  - element: axes
    encodes: Lines defining scale positions (vertical/Y-axis, horizontal/X-axis)
  - element: scale
    encodes: Numeric or categorical values along axes
  - element: tick-marks
    encodes: Small marks indicating scale divisions (major and minor)
  - element: grid-lines
    encodes: Lines extending from tick marks across plot area
  - element: data-graphic
    encodes: Visual elements representing data (bars, lines, points)
  - element: legend
    encodes: Key identifying data series
  - element: axis-labels
    encodes: Text identifying what each axis represents
  - element: data-labels
    encodes: Values displayed on or near data graphics

parameters:
  graph_family: "point | line | area | column"
  scale_types: "category | sequence | quantitative"
  data_series: "single | multiple"

related: []  # TBD: grid-lines, axis-configuration, legend-design

extensions:
  harris_entry: "Graph"
  terminology_note: "Multiple names exist for many elements; Harris lists common alternatives"
---

## Description

With more and more graphs being generated on computers, the name a graph is referred to by is becoming increasingly important. To match the type of data to an appropriate graph, and to obtain the maximum benefit from graphical software, one has to understand the terminology.

The name of a graph might be affected by:
- Its configuration (line, column, area, etc.)
- The number of data series (single or grouped)
- The type of data (quantitative, category, time series)
- The arrangement of data series (stacked, overlapped)

## Examples

Harris provides two comprehensive annotated diagrams (p. 177) identifying all major graph elements. Key terminology with alternatives:

**Frame and Border Elements:**
- Chart title frame or border
- Chart frame or border
- Graph frame / grid border / box / rectangle / plot area border / scale lines

**Title Elements:**
- Chart title / label / heading / caption
- Chart subtitle
- Graph title
- Vertical axis title / scale label / scale title / axis label / scale legend / heading / caption / axis name
- Horizontal axis title (same alternatives)

**Scale Elements:**
- Axis label / tick mark label / caption / scale label / scale figures / scale designation / stub / stub item
- Major tick mark / stub / stub mark / tick / tic / scale point
- Minor tick mark (same alternatives)
- Vertical or Y-axis scale
- Horizontal or X-axis scale

**Grid Elements:**
- Major horizontal grid line / scale line / coordinate line / ruling / grid rule
- Minor horizontal grid line (same alternatives)
- Major vertical grid line (same alternatives)

**Data Elements:**
- Data graphic / data marker / marker / data measure
- Data graphic label / marker label / data point label / interior label
- Data series labels or names
- Data points
- Curve (for line graphs)

**Legend Elements:**
- Legend or key
- Legend or key title
- Legend or key frame or border

**Axis Lines:**
- Left vertical axis / left Y-axis / left scale line
- Right vertical axis / right Y-axis / right scale line
- Top horizontal axis / top X-axis / top scale line
- Bottom horizontal axis / bottom X-axis / bottom scale line
- Origin (where axes meet, typically at zero)
- Extent (end of data range)

## Usage

Understanding terminology enables:
- Clear communication about graph design
- Effective use of charting software
- Consistent documentation and instruction
- Precise specification of design changes

Note that most graph elements have multiple common names. When communicating, clarify terminology or use visual indication.

## Notes

Harris emphasizes that all parts of a graph (grid lines, axes, labels, tick marks, legends, data graphics, notes, etc.) are referred to collectively as "graph elements." This comprehensive terminology supports both construction (knowing what to include) and recognition (identifying elements in existing graphs).
