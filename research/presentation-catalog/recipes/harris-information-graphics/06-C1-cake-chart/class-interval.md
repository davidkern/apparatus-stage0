---
name: Class Interval
slug: class-interval
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Class or Class Interval, p. 77"

intent: Systematically divide a large set of data into a limited number of groups for distribution analysis
direction: construction

components:
  - element: interval-boundaries
    encodes: Lower and upper limits defining each group
    required: true
  - element: interval-labels
    encodes: Description of range (e.g., "20 to 29", "30 to 39")
    required: true
  - element: count-or-frequency
    encodes: Number of data elements falling within each interval
    required: true

parameters:
  interval_width: equal | variable
  number_of_intervals: typically_six_to_twelve
  boundary_handling: inclusive | exclusive

related: []

warnings:
  - "Choice of interval boundaries affects the appearance and interpretation of the distribution"
  - "Class intervals for maps may be determined differently than for graphs"

extensions:
  harris_entry: "Class or Class Interval"
  alternate_names: ["bin", "group interval", "cell"]
  typical_use: "histograms, frequency distributions, statistical maps"
---

## Description

When a large set of data is systematically divided into a limited number of groups, these groups are many times called classes or class intervals. Class intervals are frequently used for analyzing the distribution of data.

## Examples

Harris provides an age distribution example (p. 77):

> "For example, one might want to make a graph of the distribution of ages in an organization with 600 people. Instead of plotting all 600 ages, class intervals could be set up, the number of people in each class interval determined, and that set of numbers plotted."

> "If the youngest person in the group was 22, the first class interval might be 20 to 29, the next 30 to 39, the next 40 to 49 and so on until a class interval that included the oldest person in the group was established. The number of people in each class interval would be counted and the data (in this example six data points) plotted."

The resulting histogram shows:
- 20 to 29: approximately 50 people
- 30 to 39: approximately 75 people
- 40 to 49: approximately 175 people
- 50 to 59: approximately 125 people
- 60 to 69: approximately 100 people
- 70 to 79: approximately 25 people

> "Such a graph is generally called a histogram."

**Map application**:

> "A similar technique is sometimes used when preparing data for statistical maps." The example shows a choropleth map with a legend showing class intervals: 350 to 400, 300 to 349, 250 to 299, etc., with different shadings for each range.

## Usage

Class intervals are essential for:
- Creating histograms from continuous data
- Building frequency distributions
- Preparing data for choropleth maps
- Summarizing large datasets into manageable groups

The number and width of intervals affects interpretation:
- Too few intervals: loss of detail in distribution shape
- Too many intervals: noise obscures patterns
- Unequal widths: may be appropriate when data is not uniformly distributed

## Notes

Harris cross-references Histogram and Frequency Polygon for discussion of cells used with graphs, and Statistical Map for use with maps. Class intervals for maps are sometimes determined differently than for graphs due to the different visual encoding requirements.
