---
name: Dot-Dash-Plot
slug: dot-dash-plot
source:
  work: The Visual Display of Quantitative Information
  author: Edward R. Tufte
  location: "Chapter 6, pp. 133-134"

intent: Frame a scatterplot with the marginal distribution of each variable shown as dashes along the axes
direction: construction

components:
  - element: scatter-field
    encodes: Bivariate relationship between X and Y
    required: true
  - element: x-marginal-dashes
    encodes: Distribution of X variable (one dash per observation)
    required: true
  - element: y-marginal-dashes
    encodes: Distribution of Y variable (one dash per observation)
    required: true
  - element: data-points
    encodes: Individual (x,y) pairs in the scatter field
    required: true

parameters:
  dash_length: short | medium
  dash_orientation: perpendicular-to-axis | along-axis

related: []  # TBD: see also range-frame, quartile-plot, rugplot

warnings:
  - "With many observations, dashes may overlap and obscure distribution shape"
  - "More complex to interpret than range-frame for naive viewers"

extensions:
  tufte_principle: "Maximize the data-ink ratio"
  data_ink_effect: "increases"
  redesign_type: "restructuring"
  figure_reference: "p. 133"
  original_form: "standard scatterplot"
  historical_note: "Name follows tradition; scatterplots were once called 'dot diagrams'"
---

## Description

The dot-dash-plot transforms the entire frame of a scatterplot into data by replacing the axis lines with the marginal distribution of each variable. Instead of solid axis lines or even range-frames, each axis becomes a series of small dashes, with one dash for each observation positioned at its value on that variable.

The design unifies two fundamental statistical graphics: the univariate frequency distribution and the bivariate scatter. The viewer sees simultaneously how each variable is distributed marginally and how the two variables relate jointly.

## Examples

Tufte introduces the technique:

> "Finally, the entire frame can be turned into data by framing the bivariate scatter with the marginal distribution of each variable. The dot-dash-plot results." (p. 133)

The visual shows a scatterplot where the traditional X axis is replaced by a row of short vertical dashes (one per observation, positioned at each x-value) and the Y axis is replaced by a column of short horizontal dashes (one per observation, positioned at each y-value).

On the name's origin:

> "The terminology follows tradition, for scatterplots were once called 'dot diagrams'—for example, in R. A. Fisher's Statistical Methods for Research Workers (Edinburgh, 1925)." (p. 133, footnote)

Tufte explains the conceptual integration:

> "The dot-dash-plot combines the two fundamental graphical designs used in statistical analysis, the marginal frequency distribution and the bivariate distribution. Dot-dash-plots make routine what good data analysts do already—plotting marginal and joint distributions together." (p. 133)

The technique appears in scientific graphics. Tufte shows a pulsar signal analysis graphic:

> "Similarly, this data-rich graphic of signals from pulsars shows both marginal distributions." (p. 134)

This example demonstrates marginal distributions along both axes of a central data display, showing the technique's applicability beyond simple scatterplots.

## Usage

The dot-dash-plot is appropriate when:
- Understanding marginal distributions matters as much as the relationship
- Data density is moderate (not so high that dashes overlap completely)
- The audience has some statistical sophistication

On audience comprehension:

> "The dot-dash-plot is more difficult [than the range-frame], although it still shows all the standard information found in the scatterplot. Nothing is lost to those puzzled by the frame of dashes, and something is gained by those who do understand." (p. 136)

Construction steps:
1. Plot data points in a scatter field (no frame)
2. For each observation, draw a short dash on the X axis at its x-value
3. For each observation, draw a short dash on the Y axis at its y-value
4. Dashes are perpendicular to their axis (vertical on X axis, horizontal on Y axis)

The technique extends to non-rectangular contexts. An example shows an empirical cumulative distribution with:

> "all 60 points plotted in the marginal distribution" (p. 133)

## Notes

The dot-dash-plot represents the logical endpoint of the progression from conventional frame through range-frame and quartile plot. At each step, more of the frame becomes data-carrying:

- Conventional frame: 0% data
- Range-frame: endpoints encode min/max
- Quartile plot: adds quartile marks
- Dot-dash-plot: entire frame is data (marginal distributions)

Tufte notes that while the design "may appear odd" (p. 136), this is largely due to unfamiliarity. The conventional scatterplot frame has been viewed thousands of times; the dot-dash-plot is new. "With use, the new designs will come to look just as reasonable as the old." (p. 136)
