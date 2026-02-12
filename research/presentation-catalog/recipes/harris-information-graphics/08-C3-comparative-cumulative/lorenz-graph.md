---
name: Lorenz Graph
slug: lorenz-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Cumulative Frequency Graph, p. 118"

intent: Compare two cumulative distributions by plotting cumulative percent on both axes, revealing inequality or deviation from equal distribution
direction: both

components:
  - element: x-axis-cumulative-percent
    encodes: Cumulative percentage of one variable (e.g., percent of population)
    required: true
  - element: y-axis-cumulative-percent
    encodes: Cumulative percentage of another variable (e.g., percent of income)
    required: true
  - element: data-curve
    encodes: The relationship between the two cumulative distributions
    required: true
  - element: line-of-equal-distribution
    encodes: Diagonal reference line showing where curve would fall if distributions were equal
    required: true

parameters:
  comparison_type: income-vs-population | any-two-cumulative-distributions

related: []

warnings:
  - "The diagonal represents equal distribution; deviation from diagonal shows inequality"
  - "Both axes must use cumulative percent scales"
  - "The curve will always start at (0,0) and end at (100,100)"

extensions:
  harris_entry: "Cumulative Frequency Graph"
  typical_use: "Showing income inequality, comparing distribution patterns"
  related_concepts:
    - Gini coefficient
    - income distribution
    - wealth inequality
---

## Description

A Lorenz graph is a special type of cumulative frequency graph that displays cumulative percent frequency scales on both axes. This arrangement is particularly effective for comparing two related distributions and revealing inequality or deviation from proportional distribution.

The key feature is the diagonal "line of equal distribution." If the two distributions were identical (e.g., if 50% of employees earned exactly 50% of total income), the data points would fall along this diagonal. The extent to which the curve deviates from the diagonal indicates the degree of inequality.

## Examples

Harris illustrates the Lorenz graph on page 118:

> The traditional graph displays the cumulative percent frequency curves for total income and total numbers of employees for a hypothetical company. The cumulative number of employees rises faster than the cumulative income.

> The graph in the upper right-hand corner is an example of a cumulative frequency graph with cumulative percents on both axes. Such a graph is sometimes called a Lorenz graph.

**Reading the Lorenz graph:**

> It can be noted in the combined graph that the lower 50% of the employees earned about 24% of the total income, while the upper 10% of the employees earned about 30% of the total income.

> If the two distributions had been the same, the data points would have clustered around the diagonal line, sometimes referred to as the line of equal distribution.

The supporting graphs show:
- Cumulative percent of employees making less annually than amounts shown on horizontal axis
- Cumulative percent of total payroll earned by employees making less annually than amounts shown
- These two curves are then combined into the Lorenz format

## Usage

The Lorenz graph is most effective when:
- Comparing two related distributions (e.g., population vs. wealth)
- Visualizing inequality or concentration
- The relationship between two cumulative distributions is of interest

**Construction:**
1. Calculate cumulative percentages for both variables
2. Plot one cumulative percentage on each axis
3. Draw the diagonal line of equal distribution for reference
4. The curve shows the actual relationship

**Interpretation:**
- If the curve follows the diagonal: distributions are equal
- If the curve bows below the diagonal: the variable on the Y-axis is concentrated among those with higher values on the X-axis
- The greater the bow, the greater the inequality

**Example insights (from Harris):**
- At the point where cumulative employees = 50%, cumulative income = ~24%
- This means the lower-earning half of employees earn only about a quarter of total payroll
- The top 10% of employees (from 90% to 100% on X-axis) earn about 30% of total income

## Notes

The Lorenz graph is foundational to the Gini coefficient, a numerical measure of inequality. The area between the curve and the diagonal, relative to the total area below the diagonal, gives the Gini coefficient. This graph makes inequality immediately visible in a way that tabular data cannot.
