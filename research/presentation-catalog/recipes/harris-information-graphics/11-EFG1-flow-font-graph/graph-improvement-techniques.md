---
name: Graph Improvement Techniques
slug: graph-improvement-techniques
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Graph, Methods for improving graphs, pp. 168-169"

intent: Enhance graph value and clarity through encoding techniques, visual aids, and design refinements
direction: construction

components:
  - element: symbol-encoding
    encodes: Additional variables via symbol size, color, shape, pattern
    required: false
  - element: confidence-intervals
    encodes: Probability ranges around data points
    required: false
  - element: drop-lines
    encodes: Visual connection from data points to axes
    required: false
  - element: reference-lines
    encodes: Comparison values or baselines
    required: false
  - element: fills
    encodes: Area highlighting or differentiation
    required: false
  - element: scale-bars
    encodes: Visual reference for comparing graphs with different scales
    required: false

parameters:
  technique_type: "data encoding | visual aid | scale adjustment | annotation"

related:
  - slug: graph-overview
    relationship: contained-by

warnings:
  - "Scale expansion can make comparisons between graphs misleading; use scale bars to mitigate"
  - "Multiple encoding techniques can clutter; balance information density with readability"

extensions:
  harris_entry: "Graph"
  section: "Methods for improving the value and ease of understanding of graphs"
  techniques_covered:
    - "Additional variable encoded with symbols"
    - "Confidence intervals"
    - "Direction of changes"
    - "Drop lines"
    - "Fills"
    - "Focus on ranges"
    - "Frame shifted for clarity"
    - "Multiple variables encoded into symbols"
    - "Pictures or images"
    - "Projections of data"
    - "Reference lines"
    - "Scale bars"
    - "Scales expanded for clarity"
---

## Description

Many methods have been developed to increase the amount of information encoded into graphs and to make them easier to understand. Some techniques apply only to specific types of graphs; others are applicable to almost all types.

Harris presents these methods alphabetically with examples showing how each technique improves graph communication.

## Techniques

### Additional Variable Encoded with Symbols

An additional variable can be encoded by varying the sizes of plotting symbols (circles). Other methods include varying color, shading, patterns, shapes, or line thickness.

Example: A scatter graph where circle size represents a third variable beyond the X and Y positions.

### Confidence Intervals to Show Probabilities

Methods for indicating confidence limits and intervals have been developed for many graph types:
- Point graph with fitted curve showing confidence interval bands
- Column graph with error bars
- Box graph showing distribution ranges

### Direction of Changes

By means of arrow heads and color coding, the direction of change and whether it is favorable can be encoded.

Example: Change graph showing measures A-D with arrows pointing left (unfavorable) or right (favorable) and values noted.

### Drop Lines to Help Locate Data Points

Thin lines help the viewer's eye relate a data point and its value or location:
- Line graph with vertical drop lines from points to axis
- Scatter graph with drop lines connecting points to both axes

### Fills to Highlight Particular Data

A wide variety of fills are available to differentiate data series, highlight differences, or call attention to particular data:
- Silhouette graphs with filled areas
- Difference graphs highlighting the gap between two series

### Focus Placed on Ranges

When ranges or spreads are important, traditional bars or columns are sometimes eliminated and only the ranges plus some inner value (average or median) are shown:
- Bar range graph
- Column range graph

### Frame Shifted for Clarity

To avoid having data points appear on the axes or scale lines, the frame and scale lines are sometimes shifted slightly horizontally and/or vertically.

Example: Frame not shifted (points on axis) vs. frame shifted (points clearly visible inside plot area).

### Multiple Variables Encoded into Symbols

When several variables are to be encoded, symbols become more complex. Symbols capable of encoding large numbers of variables are sometimes called icons.

Example: Chernoff faces where facial features encode different variables.

### Pictures or Images to Expedite Orientation

Pictures, images, or icons are sometimes used to orient the viewer and improve appearance for presentation purposes:
- Pictorial column graphs using stacked icons
- Pictorial bar graphs with themed images

### Projections of Data

Graphs are often used to project or estimate future values of a data series. The projected portions are generally clearly differentiated:
- Line graph with solid actual line and dashed forecast line
- Multiple projection scenarios shown with different line styles

### Reference Lines to Make Deviations Stand Out

Reference lines can compare actual data against a baseline or highlight a value of interest:
- Drop lines extending to zero axis
- Drop lines extending to reference line (highlighting deviations)

### Scale Bars for Comparing Graphs with Different Scales

When scales are expanded, comparisons between graphs can be misleading. Scale bars help reduce this problem by showing what one unit looks like on each graph's scale.

Example: Three graphs with different Y-axis ranges, each with a scale bar showing "= 1 vertical unit."

### Scales Expanded for Clarity

To magnify the portion of the graph containing the data under study, scales are sometimes expanded:
- Full scale (0-100) showing compressed data
- Expanded scale (80-90) showing same data with more detail

## Examples

Harris provides visual examples for each technique (pp. 168-169), showing before/after or comparison illustrations that demonstrate how each method improves graph readability or information content.

## Usage

Select improvement techniques based on:
- **Communication goal**: What aspect of the data needs emphasis?
- **Audience sophistication**: Can they interpret complex encodings?
- **Data characteristics**: Does the data have ranges, uncertainty, multiple dimensions?
- **Medium**: Print allows more detail than projected slides

Multiple techniques can be combined, but balance information density against visual clutter.

## Notes

This section from the Graph entry provides a toolkit of enhancements applicable across graph types. Individual technique details appear under separate entries (Drop Line, Reference Line, Symbol, etc.).
