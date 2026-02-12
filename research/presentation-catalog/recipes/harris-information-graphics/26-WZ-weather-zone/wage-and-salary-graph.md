---
name: Wage and Salary Graph
slug: wage-and-salary-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Wage and Salary Graph, p. 438"

intent: Summarize wage and salary information to display pay grades, ranges, and individual employee positions relative to grade specifications
direction: both

components:
  - element: grade-boxes
    encodes: Salary range for each grade (top=maximum, bottom=minimum, middle line=midpoint)
    required: true
  - element: employee-dots
    encodes: Individual employee pay levels within or outside grade specifications
    required: true
  - element: vertical-axis
    encodes: Rate of pay (dollars per hour/week/month)
    required: true
  - element: horizontal-axis
    encodes: Wage and salary grades from lowest to highest
    required: true
  - element: benchmark-overlay
    encodes: Competitive or industry standards for comparison
    required: false

parameters:
  pay_unit: dollars-per-hour | dollars-per-week | dollars-per-month | annual-salary
  grade_count: integer

related: []  # TBD: box-plot, range-chart

warnings:
  - "Dots outside boxes indicate employees above maximum or below minimum specifications"
  - "Overlapping pay levels from grade to grade can indicate structural issues"

extensions:
  harris_entry: "Wage and Salary Graph"
  typical_use: "compensation analysis, identifying pay equity issues, benchmarking against industry"
---

## Description

A wage and salary graph summarizes compensation information in a format that graphically displays key information and relationships. The structure combines range indicators (boxes showing grade specifications) with individual data points (dots showing actual employee pay).

For each wage/salary grade, a box shows:
- **Top of box**: Maximum specified for the grade
- **Bottom of box**: Minimum specified for the grade
- **Middle line**: Midpoint of the salary scale

A dot is plotted for every employee in each grade. If the employee's pay is within specification, the dot lies within the box. If pay is above or below specification, the dot appears outside the box.

## Examples

Harris identifies typical observations that can be made from such a graph (p. 438):

> "- The grades in which there are high concentrations of employees
> - The distribution of employees along the entire spectrum of grades
> - Whether employees are clustered in particular sections within a grade
> - How many employees are above the maximum or below the minimum in each grade
> - The relationships between the midpoints of each of the grades
> - The spreads between maximum and minimum for the various grades
> - The overlapping of pay levels from grade to grade
> - Whether or not salary grades form a smooth progression"

### Benchmarking
> "By superimposing competitive or industry standards on top of such a graph, the relative position of the company against an outside benchmark is possible." (p. 438)

## Usage

Wage and salary graphs are appropriate for:
- Human resources compensation analysis
- Identifying employees outside pay specifications
- Evaluating grade structure consistency
- Comparing company pay to industry benchmarks
- Detecting clustering or distribution patterns within grades
- Assessing whether grade progressions are smooth

The vertical axis typically uses pay rate units such as:
- Dollars per hour
- Dollars per week
- Dollars per month

The horizontal axis shows wage/salary grades with the lowest grade on the left.

## Notes

This chart type is particularly effective for compensation committee presentations and HR audits because it simultaneously shows:
1. The formal pay structure (the boxes)
2. The actual pay distribution (the dots)
3. Policy compliance (dots inside vs. outside boxes)
4. Structural issues (overlap, gaps, clustering)

The overlay capability allows direct comparison against external benchmarks without creating separate charts.
