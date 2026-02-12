---
name: Expanded Scale
slug: expanded-scale
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Expanded scales, p. 340"

intent: Increase the physical distance between scale values to improve precision in reading data within a focused range
direction: construction

components:
  - element: expanded-range
    encodes: Region of scale with increased physical spacing
    required: true
  - element: scale-labels
    encodes: Numeric values at the expanded spacing
    required: true
  - element: non-zero-indicator
    encodes: Visual cue that scale does not start at zero (wavy edge, break symbol)
    required: false

parameters:
  minimum_value: "lowest value on expanded scale (often non-zero)"
  maximum_value: "highest value on expanded scale"
  expansion_factor: "ratio of expanded to standard interval size"

related: []  # TBD: scale-break, linear-scale, scale-bars

warnings:
  - "Scales not starting at zero have generated much criticism"
  - "Changing the scale can dramatically affect graph appearance and potentially mislead"
  - "Unfamiliar viewers may overlook that the scale does not start at zero"

extensions:
  harris_entry: "Scale"
  typical_use: "detailed analysis of variations within a narrow range"
  tradeoff: "improved precision vs. risk of misinterpretation"
---

## Description

When a scale is expanded, the physical distance is increased between the labels on the scale. For example, if a scale originally has one-fourth inch between the values 57 and 58, after expanding the two values might be separated by one-half inch. This expansion improves the viewer's ability to see trends and determine values more accurately within the displayed range.

When a scale is expanded, the graph becomes larger unless a portion of the scale is eliminated. To maintain graph size, a section is generally removed from the center (scale break) or bottom (non-zero baseline). Although offering advantages, scales that do not start at zero have generated much criticism.

## Examples

> "The examples below illustrate how using expanded scales in the area under study increases the viewer's ability to see trends and determine values more accurately. The examples also illustrate how changing the scale can have a dramatic effect on the appearance of the graph and therefore potentially mislead the casual observer." (p. 340)

The PDF shows four graphs with identical data:
1. Value scale starts at zero (variations appear minimal)
2. Expanded scale with a full scale break (variations clearly visible)
3. Expanded scale with lower portion of graph removed (variations visible, but no zero reference)
4. Wavy lower edge to call attention to non-zero axis

All four contain the same data, but the visual impression of variability differs dramatically.

## Usage

Expanded scales are appropriate when:
- Small variations in data are significant and need to be visible
- The audience is sophisticated enough to check scale labels
- Detailed analysis requires precise value reading
- The data naturally clusters in a narrow range far from zero

Expanded scales require caution when:
- Viewers may not notice the non-zero baseline
- Casual observers might be misled about variability
- Comparisons across graphs with different scale ranges are needed

Mitigation techniques:
- Use wavy lines or other indicators at non-zero baselines
- Include scale bars for visual reference
- Note explicitly that the scale does not start at zero

## Notes

Harris recommends that for persons not familiar with graphs, scales should start at zero. For persons more familiar with graphs, expanded scales offer significant advantages even at the risk of viewers overlooking the non-zero axis. The shifted frame technique (moving frame and scale labels slightly away from axes) can improve readability of data points near the axis boundaries.
