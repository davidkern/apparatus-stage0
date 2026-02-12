---
name: Lorenz Curve
slug: lorenz-curve
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Lorenz Curve, p. 225"

intent: Compare distributions to assess equality or inequality by plotting cumulative percentages against each other
direction: both

components:
  - element: diagonal-reference-line
    encodes: Line of perfect equality (what the curve would look like if distributions were identical)
    required: true
  - element: actual-distribution-curve
    encodes: The observed cumulative distribution
    required: true
  - element: cumulative-percent-axes
    encodes: Both axes showing 0-100% cumulative frequency
    required: true
  - element: deviation-area
    encodes: Area between diagonal and curve showing degree of inequality
    required: false

parameters:
  square_format: "typically square with both axes 0-100%"
  comparison_type: "single distribution | multiple distributions | multiple populations | time comparison"

related: []  # TBD

warnings:
  - "The curve only shows relative distribution, not absolute values"
  - "Interpretation requires understanding that the diagonal represents perfect equality"

extensions:
  harris_entry: "Lorenz Curve"
  alternate_names: ["Lorenz graph"]
  typical_use: "income inequality analysis, wealth distribution, comparing distributions across populations or time"
---

## Description

A Lorenz graph plots cumulative frequency percents on both the vertical and horizontal axes, primarily used for comparing two or more variables to see if their distributions are similar. The technique is used extensively to compare income distribution versus population distribution.

The graph is normally square with scales ranging from 0 to 100% on both axes, with zero at the lower left corner. A diagonal line from lower left to upper right represents perfect equality - the curve that would result if both distributions were exactly the same. This diagonal is called the "line of perfect equality," "absolute equality," "curve of complete equality," or "line of equal distribution."

## Examples

**Income distribution** (p. 225):
> "The graph at the left is an example of a Lorenz curve with cumulative percent of total income plotted on the vertical axis and cumulative percent of the population on the horizontal axis. The shaded area indicates the difference or deviation from the diagonal."

Reading the example: "40% of the population earned about 22% of the total income. At the other end of the curve the reference lines indicate that the upper 10% of the population earned about 21% of the total income."

**Comparative applications** (p. 225):
Four application examples are shown:
1. **Before and after taxes**: Comparing income distribution curves before and after taxation
2. **Income vs. wealth**: Comparing cumulative percent of income against cumulative percent of families with wealth distribution
3. **Country comparison**: Multiple curves for Countries A, B, C, D showing different inequality levels
4. **Profession comparison**: Comparing income distributions across Professions A, B, C

## Usage

Use Lorenz curves when:
- Analyzing how evenly something is distributed across a population
- Comparing distributions over time (e.g., before/after policy changes)
- Comparing distributions across different populations or groups
- Assessing economic inequality

The further the curve bows away from the diagonal, the greater the inequality. A curve that hugs the diagonal indicates relatively equal distribution; a curve that bows far toward the lower right indicates high inequality (small percentage of population holds large percentage of the variable).

## Notes

The Lorenz curve is a fundamental tool in economics and social science for visualizing inequality. The area between the curve and the diagonal (sometimes shown shaded) is related to the Gini coefficient, a common numerical measure of inequality.
