---
name: Difference Bar Graph
slug: difference-bar-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bar Graph, Difference bar graph, pp. 44-45"

intent: Emphasize the differences between two data series or between values and a reference by plotting only the difference values
direction: both

components:
  - element: difference-bars
    encodes: Magnitude of difference between compared values
    required: true
  - element: quantitative-scale
    encodes: Value axis (horizontal); may show difference values
    required: true
  - element: category-scale
    encodes: Category labels on vertical axis
    required: true
  - element: direction-indicator
    encodes: Which value is higher or direction of change (arrows, fill, labels)
    required: false
  - element: zero-axis
    encodes: Reference line for deviation graphs; zero difference point
    required: false

parameters:
  type: simple-difference | change | deviation
  direction_encoding: none | labels | fill-pattern | arrows
  favorability_encoding: none | color | text-annotation
  values_shown: difference-only | actual-and-difference

related:
  - slug: simple-bar-graph
    relationship: variant-of
  - slug: paired-bar-graph
    relationship: contrasts
  - slug: deviation-bar-graph
    relationship: contains

warnings:
  - "Simple difference graphs may not indicate which series has the larger value unless explicitly encoded"
  - "Change graphs require clear indication of direction and optionally favorability"
  - "Deviation graphs hide absolute values, showing only differences from reference"

extensions:
  harris_entry: "Bar Graph"
  alternate_names:
    - "comparison bar graph"
  typical_use: "highlighting differences between two data series or deviation from a reference"
  subtypes:
    simple_difference: "compares two data series; shows where differences exist"
    change: "compares values at two points in time; shows direction of change"
    deviation: "shows differences from a reference value; plotted against zero axis"
---

## Description

Difference bar graphs compare two data series or values against a reference, with focus on the differences rather than absolute values. Harris identifies three major types: simple difference, change, and deviation. All use a quantitative horizontal scale and typically a category vertical scale.

## Simple Difference Bar Graph

Compares two data series by plotting actual values and connecting them with a bar. Generally only the portions where differences exist are shown.

**Encoding options:**
1. No indication of which series is larger (uniform fill)
2. Series names labeled at bar ends (e.g., "F" and "M" for female/male)
3. Data graphics coded to indicate which series value is largest

**Typical applications:**
- Average scores for two groups on a battery of tests
- Male and female median incomes for different professions
- Frequency of diseases in two countries

Harris shows three variations (p. 44):
- Bars with numeric difference values only (20, 28, 18, 22)
- Bars with series labels at ends (F, M showing which is higher)
- Bars with fill coding (dark = M greater, light = F greater)

## Change Bar Graph

Compares values at two points in time or under two conditions. Direction of change is important and encoded through arrows, fill, or both.

**Direction encoding:**
- Arrow heads indicate direction (tip = value after change)
- Color/shading indicates direction (e.g., increase vs. decrease)

**Favorability encoding:**
Since neither direction is inherently good or bad, additional coding may indicate:
- Favorable (desirable) changes
- Unfavorable (undesirable) changes

**Typical applications:**
- Athlete's performance before and after training
- Response times before and after drug ingestion
- Stock prices at opening vs. closing

Harris shows three variations (p. 44):
- Arrows showing direction with numeric values
- Fill coding for favorable/unfavorable + direction arrows
- Fill coding for direction + text labels for favorability

## Deviation Bar Graph

Focuses entirely on differences from a reference. Actual values may not be plotted; instead, deviation values are plotted against a zero axis.

**Two scenarios:**

*Deviation from reference:*
- Compare data series against a control/reference value
- Positive deviation = exceeds reference
- Negative deviation = below reference
- Zero = matches reference

Example: Plant growth with various fertilizers compared to no fertilizer. Only the difference in growth (positive or negative) is plotted.

*Gross vs. Net deviation:*
- Gross deviation: Shows both positive and negative values from two opposing series (e.g., percent stocks up vs. percent stocks down)
- Net deviation: Shows only the algebraic sum (net difference)
- Combined: Shows both gross values and net result on same graph

Harris shows examples (p. 45):
- Standard bar graph with reference line (for comparison)
- Deviation graph showing only differences from reference
- Gross deviation graph (both directions shown)
- Net deviation graph (algebraic sum only)
- Combined gross and net deviation graph

## Usage

**Simple difference — when to use:**
- Comparing two data series across categories
- When the magnitude of difference matters more than absolute values
- When showing where one series exceeds the other

**Change — when to use:**
- Before/after comparisons
- Showing direction and optionally favorability of changes
- Time-based comparisons for the same entities

**Deviation — when to use:**
- Comparing performance against a target/benchmark
- Showing how values differ from a control condition
- Financial contexts (net gain/loss, relative performance)

## Examples

Harris provides application examples for each subtype:

> "Average scores for two different groups of students on a battery of tests" (p. 44, simple difference)

> "Male and female median incomes for different professions" (p. 44, simple difference)

> "An athlete's performance on several tests before and after training" (p. 44, change)

> "A person's response time to different types of stimuli before and after ingesting drugs" (p. 44, change)

> "If plant growths with various fertilizers are being compared, only the difference in growth with and without fertilizer might be plotted." (p. 45, deviation)

The deviation graph example continues: if growth with fertilizer exceeds growth without, the difference is positive; if less, the difference is negative; if equal, zero is shown.

## Notes

Deviation graphs are also called split bar graphs (for gross deviation) or net deviation graphs. The ability to show both gross and net information on the same graph is powerful for financial and performance analysis.
