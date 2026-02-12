---
name: Variable Classification Systems
slug: variable-classification
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Variable, pp. 428-431"

intent: Categorize data variables according to their nature to determine appropriate visualization methods
direction: both

components:
  - element: variable-type-assessment
    encodes: Determination of whether data is quantitative, categorical, or sequential
    required: true
  - element: scale-selection
    encodes: Choice of appropriate scale type based on variable classification
    required: true
  - element: encoding-method
    encodes: Selection of visual encoding appropriate to the variable type
    required: true

parameters:
  primary_classification: "quantitative or category or sequence"
  measurement_type: "interval or ratio or ordinal or nominal"
  continuity: "continuous or discrete"
  dependency: "independent or dependent"

related: []

warnings:
  - "Category and sequence variables are almost always independent variables"
  - "Reordering categorical data may affect readability but does not degrade data integrity"
  - "The same variable may be displayed differently depending on analytical goals"

extensions:
  harris_entry: "Variable"
  typical_use: "determining how to appropriately display data in charts, graphs, and tables"
---

## Description

A variable is something that changes or has the ability to change. Variables are classified in several different ways, and understanding these classifications is essential for choosing appropriate visualization methods. Harris presents multiple overlapping classification systems that together help determine how a variable should be displayed.

The primary classification system distinguishes three fundamental types:

**Quantitative variables** (also called value, numeric, or interval variables) are made up of entities with specific numeric values such as heights, weights, ages. They can be plotted on graduated, numbered scales and can be ranked and mathematically manipulated.

**Category variables** (also called nominal, nonquantitative, or qualitative variables) are made up of word descriptions of entities such as people, places, things, events. When numbers are used, they serve only for identification with no quantitative significance. Elements can be ordered (alphabetized, sorted) but not ranked or mathematically manipulated.

**Sequence variables** include time series, order of occurrence, and ordinal variables. They have an ordered, chronological, or nonquantitative numeric progression. Numbers are used only for identification and ordering, not for mathematical manipulation.

## Examples

Harris illustrates how variable classification affects display choices (pp. 428-429):

> "A variable is something that changes or has the ability to change. For example, the outside temperature is a variable because it can, and generally does, change from hour to hour. The heights of students in a classroom is a variable because height differs from individual to individual. When reporting election results, the names of the states are variables." (p. 428)

The same data displayed three different ways (p. 429):
- One-way table: territory names and sales values listed vertically
- Bar graph: territories on vertical axis, sales on horizontal axis
- Shaded map: territories as geographic regions, sales as color intensity

> "The purpose of these two illustrations is to show examples of what might be considered as variables, to demonstrate that the same variable can be displayed in different ways, and to illustrate that the way a variable is displayed can have a significant effect on the types of observations that might easily be made about the variable or groups of variables." (p. 429)

Examples of scale types for each variable classification (p. 429):
- Quantitative scales: Linear (0-5), Logarithmic (1-1000), Probability (01-99.9)
- Category scales: Vegetables (Corn, Beets, Peas), Part numbers (783, 297, 326), Drivers (Jane, Tom, Mary)
- Sequence scales: Years ('95-'99), Order of occurrence (Sample #1-#4), Ordinal ranking (First-Fourth place)

## Usage

Variable classification guides visualization decisions:

**For quantitative variables**:
- Use graduated numeric scales
- Plot on value axes with meaningful intervals
- Mathematical operations (averaging, differences) are valid
- Line graphs, scatter plots, and histograms are often appropriate

**For category variables**:
- Use discrete labels rather than numeric scales
- Can be reordered without degrading data integrity
- Bar charts and categorical displays are often appropriate
- Numbers used as identifiers should not be treated mathematically

**For sequence variables**:
- Maintain the inherent order (chronological, ranked)
- Time series: use consistent time intervals
- Ordinal: preserve rank relationships
- Order should not be arbitrarily changed

Classification process:
1. Identify what the variable represents
2. Determine if values can be mathematically manipulated (quantitative) or only sorted (category/sequence)
3. Assess if there is inherent order (sequence) or not (category)
4. Select visualization method appropriate to the classification

## Notes

Harris notes that the same variable can often be displayed in multiple ways, with different displays facilitating different types of observations. The classification of a variable guides but does not completely determine the appropriate visualization method.

Variables are also characterized as independent or dependent (see separate recipe), as continuous or discrete, and by measurement type (interval, ratio, ordinal, nominal). These overlapping classification systems together inform visualization choices.
