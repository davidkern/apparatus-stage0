---
name: Jittering
slug: jittering
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Jittering, p. 201"

intent: Reveal overlapping data points by randomly shifting symbols a slight amount so no symbol obscures another
direction: construction

components:
  - element: data-symbols
    encodes: Individual data points that may overlap
    required: true
  - element: random-offset
    encodes: Small displacement applied perpendicular to quantitative scale(s)
    required: true
  - element: quantitative-scale
    encodes: The axis along which accurate positioning matters
    required: true

parameters:
  axes_with_quantitative_scale: "one | two"
  shift_direction: "perpendicular to quantitative scale | along one or both axes"
  shift_amount: "visual determination | mathematical formula"

related: []  # TBD: see also point-graph, scatter-graph

warnings:
  - "Jittering causes a slight degradation in accuracy on graphs with two quantitative scales"
  - "The viewer should normally be alerted that jittering has been employed"
  - "No indication is typically given as to how much the symbols have been shifted"
  - "Some slight overlapping may still occur even after jittering"

extensions:
  harris_entry: "Jittering"
  typical_use: "revealing true density of data points when many overlap at same position"
---

## Description

Jittering addresses the problem of overlapping data symbols on graphs. When multiple data points share the same or similar positions, their symbols can overlap and obscure each other, making it impossible for viewers to know how many data points actually exist at a given location. With jittering, data points are randomly shifted a slight amount so no symbol completely obscures another.

The technique applies differently depending on the number of quantitative scales:
- **One quantitative scale**: Symbols are shifted perpendicular to the quantitative scale, so accuracy on the measured dimension is not reduced
- **Two quantitative scales**: Symbols might be shifted along one or both axes, causing a slight degradation in accuracy

## Examples

Harris demonstrates jittering with a one-axis point graph:

> "Because of symbols overlapping, it is impossible to know actually how many data points there are in this one-axis point graph." (p. 201, before jittering)

> "This graph shows the same data as above except all data points are shifted a short distances in the vertical direction. Total and partial overlaps are basically eliminated." (p. 201, after jittering)

The before-and-after comparison shows data points along a horizontal scale (0-10). Before jittering, symbols at similar values stack directly on top of each other. After jittering, vertical displacement reveals the true count of points at each position.

## Usage

Jittering is appropriate when:
- Multiple data points share the same or nearly the same position
- Showing the density or count of overlapping points matters
- A slight loss of positional precision is acceptable
- The quantitative relationship being shown allows for perpendicular displacement without misleading

The amount of shift should be:
- Just enough to make all data symbols visible
- Small enough that some slight overlapping may remain
- Determined visually or by mathematical formula

When jittering is used, the viewer should typically be notified, though standard practice does not require disclosing the exact amount of shift applied.

## Notes

Jittering is particularly valuable in exploratory data analysis where understanding the distribution and density of points matters more than precise positioning. It transforms what would appear as a single point into a visible cluster, revealing information that would otherwise be hidden.
