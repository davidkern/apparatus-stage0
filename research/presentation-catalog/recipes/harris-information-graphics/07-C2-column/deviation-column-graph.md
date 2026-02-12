---
name: Deviation Column Graph
slug: deviation-column-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Column Graph, Deviation column graph, p. 88"

intent: Show how values differ from a reference or baseline by plotting only the deviation amounts
direction: both

components:
  - element: deviation-columns
    encodes: Amount above or below reference (positive upward, negative downward)
    required: true
  - element: zero-axis
    encodes: Reference point representing no deviation
    required: true
  - element: reference-line
    encodes: The standard, budget, or expected value (may be constant or vary by period)
    required: false
  - element: quantitative-scale
    encodes: Deviation amounts on vertical axis
    required: true
  - element: sequence-scale
    encodes: Time periods on horizontal axis (typically)
    required: true

parameters:
  reference_type: "constant | variable by period"
  cumulative: "period only | with cumulative overlay | separate cumulative graph"
  gross_net: "net only | gross only | combined gross and net"

related:
  - slug: difference-column-graph
    relationship: contained-by
  - slug: simple-column-graph
    relationship: variant-of

warnings:
  - "Actual values are not shown, only deviations from reference"
  - "Viewer must understand the reference to interpret the graph correctly"
  - "Cumulative deviations may matter more than period deviations for some decisions"

extensions:
  harris_entry: "Column Graph"
  alternate_names: ["over-under graph", "variance graph", "year-to-date deviation graph"]
  typical_use: "budget vs. actual performance, cash flow analysis, target tracking"
  scale_types:
    vertical: "quantitative (deviation units)"
    horizontal: "sequence (time series)"
---

## Description

A deviation column graph focuses on the differences between a data series and a reference. Instead of plotting actual values, the difference or deviation values are plotted against a zero axis with columns connecting the deviation values and the zero axis.

For example, if profit is being compared to budget, only the differences between actual profit and budgeted profit are shown. If actual profit exceeds budget, it appears as a positive number. If below budget, it shows as negative. If actual equals budget, it shows as zero since there is no deviation.

## Examples

> "One type of deviation graph focuses on the differences between a data series and a reference. Frequently the actual values of the data series are not plotted. Instead, the difference or deviation values are plotted against a zero axis with columns connecting the deviation values and the zero axis." (p. 88)

Harris shows three related graphs using the same data:
1. Actual profit with budget reference line superimposed
2. Deviation graph showing how actual profit differs from budget each month
3. Cumulative deviation graph showing year-to-date profits vs. budget

### Gross and Net Deviation Graphs

> "Sometimes the actual data consists of two data series, such as cash received versus cash dispersed. When both data series are plotted, the resulting graph is sometimes referred to as a gross deviation or over-under graph." (p. 88)

- **Gross deviation**: Both data series plotted, columns extending up and down from zero
- **Net deviation**: Only the differences between the two data series plotted
- **Combined**: Shows gross and net deviation information on one graph

### Cumulative Deviation

> "In many situations the deviation over a longer period of time is more important than the deviation in any particular period." (p. 88)

If the goal is year-end performance, individual period misses may not concern stakeholders as long as cumulative figures stay on track.

## Usage

Reference line options:
- **Constant reference**: Same value for all periods (e.g., constant monthly budget)
- **Variable reference**: Different value each period (e.g., seasonal budget expectations)

The reference can be displayed as:
- A straight horizontal line (constant budget)
- A stepped line (varying budget)
- Implicit at zero (when only deviations are plotted)

Cumulative deviation graphs show year-to-date performance, useful for:
- Tracking against annual targets
- Understanding whether short-term variations matter
- Cash flow management (cumulative cash received vs. dispersed)

## Notes

Deviation graphs are particularly powerful when paired with the actual data or when the reference is well understood by the audience. Consider showing both the actual data with reference line AND the deviation graph for complete context.
