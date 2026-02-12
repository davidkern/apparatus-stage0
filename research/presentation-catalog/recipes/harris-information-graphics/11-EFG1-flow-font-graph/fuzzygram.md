---
name: Fuzzygram
slug: fuzzygram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Fuzzygram, p. 162"

intent: Display histogram with visual uncertainty indicators showing probability confidence based on sample size
direction: both

components:
  - element: horizontal-axis
    encodes: Values or class intervals
    required: true
  - element: vertical-axis
    encodes: Percent frequency
    required: true
  - element: vertical-line
    encodes: Point where histogram column top would be (central estimate)
    required: true
  - element: fuzzy-area
    encodes: Range of probability for actual value location (horizontal lines)
    required: true

parameters:
  sample_size: "integer (determines fuzz width)"

related:
  - slug: frequency-distribution-graph
    relationship: variant-of

warnings:
  - "The degree of fuzziness is inversely proportional to sample size - smaller samples produce larger fuzzy areas"
  - "There are mathematical methods for determining the number and spacing of lines used to generate the fuzz"

extensions:
  harris_entry: "Fuzzygram"
  typical_use: "showing frequency distributions while communicating statistical uncertainty"
  encodes_uncertainty: true
---

## Description

Fuzzygrams result from a technique occasionally used with histograms in which the tops of the columns are replaced by blurred or fuzzy areas to indicate the probability of the values plotted. The degree of fuzziness is inversely proportional to the sample size: the smaller the sample size, the larger the fuzzy area.

There are mathematical methods for determining the number and spacing of the lines used to generate the fuzz.

## Visual Encoding

- **Vertical line at column center**: Indicates where the top of the column would be on a conventional histogram for the same data
- **Horizontal lines (fuzz)**: The range of horizontal lines is inversely proportional to the probability of the actual data point being located at the end of the vertical line

This encoding visually communicates that histogram bars represent estimates from samples, not exact population values.

## Examples

Harris shows a comparison of two fuzzygrams and a standard histogram for the same data (p. 162):

> "The data for the two fuzzygrams were chosen so that percentage wise, both would have the same standard histogram, even though one represents a data set size of 50 and the other 200."

The illustration shows:
- A standard histogram for reference
- A fuzzygram for a data set of 50 (wider fuzzy areas)
- A fuzzygram for a data set of 200 (narrower fuzzy areas)

Both fuzzygrams have the same central values (vertical line positions match the histogram tops), but the larger sample size produces much narrower confidence ranges.

## Usage

Fuzzygrams are appropriate when:
- Communicating uncertainty in frequency estimates is important
- Comparing distributions from different sample sizes
- The audience should understand that histogram values are estimates, not exact
- Statistical rigor about confidence intervals should be visually apparent

Fuzzygrams help prevent over-interpretation of histograms based on small samples, where apparent patterns may be due to sampling variation rather than real differences in the underlying distribution.

## Notes

The fuzzygram is an example of encoding uncertainty directly into the visualization rather than relegating it to footnotes or separate confidence interval displays. This makes the uncertainty impossible to ignore when interpreting the chart.
