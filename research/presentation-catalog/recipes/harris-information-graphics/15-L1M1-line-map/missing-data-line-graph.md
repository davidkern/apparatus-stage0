---
name: Missing Data Handling in Line Graphs
slug: missing-data-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, Missing or irregular data, p. 218"

intent: Indicate gaps in data series while maintaining continuous time scales and avoiding misleading interpolation
direction: construction

components:
  - element: continuous-time-scale
    encodes: Uniform time progression without breaks
    required: true
  - element: gap-indicator
    encodes: Visual signal that data is missing
    required: true
  - element: available-data-segments
    encodes: Portions of the series where data exists
    required: true

parameters:
  gap_style: "blank space | dashed line bridge | stubs | data symbols only"

related: []  # TBD

warnings:
  - "Breaks in the time scale can distort patterns or trends"
  - "Even when data is irregular or missing, the time scale should generally remain continuous and uniform"
  - "Viewers may mistake an unmarked gap for an oversight or misprint"

extensions:
  harris_entry: "Line Graph"
  alternate_names: []
  typical_use: "time series with incomplete data, irregular sampling"
---

## Description

Line graphs frequently display sequential data, particularly time series. When data is missing or irregular, it is generally recommended to maintain a continuous, uniform time scale while clearly indicating where data is absent. Breaking the time scale can distort perceived patterns or trends.

Harris presents several techniques for calling missing data to the viewer's attention.

## Examples

**Gap indication methods** (p. 218):

1. **Blank space**: "In some cases the area where the data is missing is left blank." Simple but risks appearing like an error.

2. **Stubs extending from data points**: "Stubs sometimes extend from the nearest data point in the direction of the missing data." This shows the last known value while indicating the data series continues but lacks values.

3. **Stubs as markers**: "Stubs are sometimes used to assure the viewer that the gap is not an oversight or misprint." Small marks at the expected data positions indicate intentional omission.

4. **Data symbols only**: "The presence of data symbols indicates where actual data was used." By showing symbols only at actual data points, viewers can distinguish measured values from interpolated connections.

5. **Dashed line bridges**: "Dashed lines sometimes bridge gaps where data is missing." This maintains visual continuity while signaling uncertainty about the interpolated section.

6. **Vertical line graph with gaps**: For vertically-oriented line graphs, gaps appear as breaks in the vertical extent of the bars/lines.

## Usage

Choose a gap indication method based on:
- How important it is that viewers notice the missing data
- Whether any interpolation is meaningful for the missing period
- The visual style of the overall graph
- How many gaps exist in the data

Guidelines:
- Always maintain continuous time scales even when data is irregular
- Make gaps visually obvious to prevent misinterpretation
- Use data symbols to distinguish actual measurements from interpolated lines
- Consider dashed lines when interpolation across the gap is reasonable but uncertain

## Notes

The key principle is transparency: viewers should be able to clearly distinguish between actual measured data and gaps or interpolated sections. The specific technique matters less than ensuring the distinction is clear.
