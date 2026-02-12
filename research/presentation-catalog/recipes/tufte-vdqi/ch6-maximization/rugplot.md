---
name: Rugplot
slug: rugplot
source:
  work: The Visual Display of Quantitative Information
  author: Edward R. Tufte
  location: "Chapter 6, p. 135"

intent: Connect multiple bivariate scatterplots using shared marginal distribution fringes to show how variables transform through a sequence
direction: construction

components:
  - element: scatter-panels
    encodes: Multiple bivariate relationships in sequence
    required: true
  - element: marginal-fringes
    encodes: Distributions shared between adjacent panels
    required: true
  - element: data-points
    encodes: Individual observations within each scatter panel
    required: true

parameters:
  layout: linear | branching
  shared_variable: row | column | both

related: []  # TBD: see also dot-dash-plot

warnings:
  - "Complex layout requires careful alignment"
  - "Works best when variables have natural sequential relationship"
  - "Can become visually overwhelming with many panels"

extensions:
  tufte_principle: "Maximize the data-ink ratio"
  data_ink_effect: "increases"
  redesign_type: "restructuring"
  figure_reference: "p. 135"
  original_form: "separate scatterplots or scatterplot matrix"
---

## Description

The rugplot extends the dot-dash-plot concept to connect a series of bivariate scatterplots. Where a dot-dash-plot frames a single scatter with marginal distributions, a rugplot uses those marginal fringes to link adjacent scatters together. The fringe of dashes on one scatter becomes the fringe on an adjacent scatter, showing how the same set of observations transforms as it passes through multiple variable relationships.

The name comes from the visual appearance: "since it resembles a set of fringed rugs—and covers the statistical ground" (p. 135).

## Examples

Tufte introduces the rugplot as an extension:

> "The fringe of dashes in the dot-dash-plot can connect a series of bivariate scatters in a rugplot." (p. 135)

The visual shows multiple scatterplot panels arranged so that they share marginal distribution fringes. Where two panels are adjacent, the dash fringe serves both: it is the right-side marginal of one panel and the left-side marginal of the next.

On the interpretive function:

> "Reflecting the one-dimensional projections from each scatter, the dashes encourage the eye to notice how each plot filters and translates the data through the scatter from one adjacent plot to the next." (p. 135)

Tufte describes the conceptual model:

> "Sometimes it is useful to think of each bivariate scatter as the imperfect empirical representation of an underlying curve that transforms one variable into another. In the rugplot, the sequence of variables can wander off as appropriate." (p. 135)

On tracing individual observations:

> "The quantitative history of a single observation can be traced through a series of one- and two-dimensional contexts." (p. 135)

## Usage

The rugplot is appropriate when:
- Multiple variables form a natural sequence or pathway
- Understanding how distributions transform through relationships matters
- The analyst wants to track how individual observations move through variable space

The design is particularly powerful for:
- Causal chains: X -> Y -> Z
- Data pipelines: raw -> processed -> outcome
- Temporal sequences: time 1 -> time 2 -> time 3

Construction steps:
1. Arrange scatterplots so adjacent panels share a variable
2. Replace the shared axis with a marginal distribution fringe (dashes)
3. Each dash represents one observation's position on the shared variable
4. The same dash appears in both adjacent panels, linking them

The layout need not be strictly linear:

> "In the rugplot, the sequence of variables can wander off as appropriate." (p. 135)

This allows for branching structures where one variable relates to multiple others.

## Notes

The rugplot represents one of the more complex redesigns in Tufte's chapter, going beyond single-graphic modifications to a multi-panel integration strategy. It answers the question: once we have dot-dash-plots, how do we compose them?

The technique anticipates modern linked visualization systems while maintaining a static, printable form. The shared marginal fringes serve a similar function to brushing in interactive graphics—they connect the same observations across multiple views.

Tufte's summary of Chapter 6's new designs includes the rugplot among designs that "may appear odd, but this is probably because we have not seen them before" (p. 136). The conventional scatterplot matrix shows the same information but without the explicit visual linking that the rugplot's shared fringes provide.
