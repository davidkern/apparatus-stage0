---
name: Chernoff Faces
slug: chernoff-faces
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Chernoff Faces, p. 72"

intent: Encode multivariate information (three or more variables) into facial features so viewers get an overview of data based on facial expressions
direction: both

components:
  - element: facial-icon
    encodes: A small face image serving as the data carrier
    required: true
  - element: variable-features
    encodes: Specific facial features (eyes, ears, mouth, etc.) each mapped to a data variable
    required: true
  - element: feature-legend
    encodes: Key explaining which feature represents which variable and how
    required: true

parameters:
  number_of_variables: three | four | more
  feature_mapping: random | positive_pleasant
  display_context: standalone | matrix | map_symbols | graph_symbols

related: []

warnings:
  - "Random encoding makes decoding tedious"
  - "Interpretation relies on cultural associations with facial expressions"

extensions:
  harris_entry: "Chernoff Faces"
  alternate_names: ["faces", "cartoon faces"]
  typical_use: "comparing entities across multiple dimensions, multivariate data overview"
---

## Description

Chernoff faces provide a graphical technique for encoding multivariate information (generally three or more variables) into the facial features of small icons so that the viewer gets an overview of the data based on facial expressions.

The variables are encoded by assigning values, characteristics, etc., to variations in facial features. Both quantitative and nonquantitative information can be encoded.

## Examples

Harris describes the encoding approach (p. 72):

> "For example, the position of the eyes might be proportional to one variable (e.g., looking to the left indicates a large number, to the right a small number, and straight ahead an average number). The size of the ears might be proportional to another variable (e.g., big ears, 100,000; little ears, 1,000)."

Display contexts include:

> **Stand-alone comparison**: "The financial performance of four companies might be compared by showing four faces, one for each company. Each company's financial data would be encoded into the features of the face representing that company."

> **Graph symbols**: The example shows four Chernoff faces plotted on a graph with Market Share on the vertical axis and Profitability on the horizontal axis. Companies A, B, C, and D are positioned according to those two variables, with their faces encoding additional variables.

> **Map symbols**: "The map at the left shows another variation in which faces represent data for seven different states."

## Usage

Chernoff faces are effective when:
- Comparing multiple entities across many dimensions simultaneously
- A quick gestalt impression is more valuable than precise readings
- The audience will benefit from intuitive pattern recognition

The key insight about encoding strategy:

> "Information can be encoded into the faces randomly, in which case the decoding process can be tedious. If, however, during the encoding process, care is taken to assure that positive values are associated with the more pleasant facial features, the viewer can get a general feel for each entity based on how happy or sad the expression is." (p. 72)

Chernoff faces may be used:
- As stand-alone images
- In matrices called icon comparison displays
- In conjunction with maps or graphs as symbols

## Notes

The technique leverages humans' highly developed ability to read facial expressions. A "happy" face quickly signals good performance across variables, while a "sad" face signals problems - but only if the encoding maps positive values to pleasant features.
