---
name: Comparing Frequency Distributions
slug: comparing-frequency-distributions
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Histogram and Frequency Polygon, p. 190"

intent: Compare two or more data sets by displaying their frequency distributions together using juxtaposed, superimposed, back-to-back, or grouped histograms
direction: both

components:
  - element: multiple-histograms-or-polygons
    encodes: Frequency distributions of different data series
    required: true
  - element: class-intervals
    encodes: Common value ranges for comparison (same scale)
    required: true
  - element: visual-differentiation
    encodes: Color, pattern, or position distinguishing each data series
    required: true

parameters:
  comparison_method: "juxtaposed | superimposed | back-to-back (pyramid) | grouped (clustered)"
  frequency_basis: "actual counts | percent (recommended when sample sizes differ)"

related: []  # TBD: histogram, frequency-polygon, pyramid-graph

warnings:
  - "When data sets have different numbers of elements, use percent comparison so vertical sizes are comparable"
  - "Superimposed histograms can be difficult to read; frequency polygons are often clearer for this purpose"

extensions:
  harris_entry: "Histogram and Frequency Polygon"
  typical_use: "comparing distribution patterns between groups or time periods"
---

## Description

Multiple frequency distributions can be compared using several layout methods. Each method has advantages depending on the number of series, the similarity of distributions, and the specific comparison questions being asked.

Harris presents five primary methods for comparing frequency distributions.

## Examples

Harris describes the comparison methods (p. 190):

> "Multiple data sets can be compared using histograms or polygons. The comparisons can be based on actual frequencies or on percents. When there are differences in the number of data elements in the data sets being compared, the percent comparison is generally recommended so the vertical sizes of the columns are more comparable."

**Juxtaposed histograms**: Place separate histograms for each series side by side with the same scale, allowing comparison of overall shapes.

**Superimposed histograms**: Overlay histograms on the same axes, using different colors or transparency. Harris notes this can be difficult to read.

**Superimposed frequency polygons**: A cleaner alternative to superimposed histograms; line-based comparison is easier to follow.

**Juxtaposed frequency polygons**: Separate polygon charts placed side by side.

**Back-to-back (two-way) histograms**: Also called pyramid graphs. Two histograms share a common vertical axis with bars extending in opposite directions. Useful for comparing two complementary groups (e.g., male/female age distributions).

**Grouped (clustered) histograms**: Multiple narrow columns grouped within each class interval, similar to grouped bar graphs.

Harris notes (p. 190):
> "Pyramid graphs (not shown here), use histograms to compare two sets of data. They are sometimes referred to as two-way histograms. See Pyramid Graph."

## Usage

Select comparison method based on:
- **Two series**: Back-to-back or superimposed polygons work well
- **Multiple series**: Juxtaposed or grouped histograms; superimposed polygons if series do not cross frequently
- **Different sample sizes**: Always use percent rather than count

## Notes

The percent-based comparison is particularly important in demographic analysis, quality control comparisons across different production volumes, or any situation where the raw counts would make comparisons misleading due to different base sizes.
