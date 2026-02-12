---
name: Multiple Graph Analysis
slug: multiple-graph-analysis
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Graph, The use of multiple graphs for analyzing and presenting the same data, pp. 174-175"

intent: Generate multiple different graph types from the same data set to reveal different aspects and support comprehensive understanding
direction: both

components:
  - element: source-data
    encodes: The common data set used across all graphs
  - element: graph-variety
    encodes: Different graph types revealing different aspects
  - element: consistent-labeling
    encodes: Common terminology and identification across graphs

parameters:
  graph_types: "line | column | bar | area | 3D | index | difference | stacked"
  aspect_focus: "trends | comparisons | composition | distribution"

related: []  # TBD: index-comparison-graph, difference-graph, stacked-area-graph

warnings:
  - "Not all graph types suit all data sets"
  - "Inconsistent presentation can confuse rather than clarify"
  - "Some graphs may reveal the same insight; select for complementary views"

extensions:
  harris_entry: "Graph"
  typical_use: "comprehensive data analysis, presentation to diverse audiences"
---

## Description

When analyzing data, it is many times advantageous to generate a variety of graphs using the same data. This is true whether there is little or lots of data. Harris identifies five key reasons:

1. Frequently, all aspects of a group of data cannot be displayed on a single graph
2. Multiple graphs generally result in a more in-depth understanding of the information
3. Different aspects of the same data often become apparent
4. Some types of graphs cause certain features of the data to stand out better
5. Some people relate better to one type of graph than another

## Examples

Harris demonstrates this principle extensively using a single data set: "Elected Officials in Some County" showing male and female counts by age group (under 40 vs. over 40) for 1980 and 1990 (pp. 174-175).

**Line graph insight:**
> "This line graph indicates that three of the four subgroups increased roughly the same amount from 1980 to 1990 while the group of males over 40 went down significantly."

**Grouped column graph insight:**
> "In this grouped column graph the changes in age groups are not as apparent, but the comparisons between the males and females in each age bracket tend to stand out clearer than in the line graph above."

**Grouped bar graph insight:**
> "Some people prefer to have similar data lined up as it is here instead of having to search out the columns that represent comparable data."

**Index comparison graph insight:**
> "This index comparison graph makes it easy to compare the percent changes in the overall number of officials as well as all of the subgroups."

**Difference graph insight:**
> "If one is primarily interested in the differences between males and females, a difference graph can be generated... From these two graphs we can see that a major change occurred in the over-40 age group."

**Stacked area graph insight:**
> "In these stacked area graphs each of the subgroups is plotted against the whole... we can see that the younger group increased in numbers while the older group, as a whole, remained about the same."

## Usage

Graph type selection by analytical goal:
- **Line graph**: Show trends over time
- **Grouped column/bar**: Compare categories within groups
- **Index comparison**: Show percent change from baseline
- **Difference graph**: Highlight gaps between two series
- **Stacked area**: Show part-to-whole relationships over time
- **3D graphs**: Show relative relationships (though imprecise)

Audience considerations:
- Different viewers prefer different formats
- Technical audiences may prefer index or difference graphs
- General audiences often prefer simple bar/column graphs

Design strategy:
- Start with multiple views during analysis
- Select complementary views for presentation
- Ensure consistency in data labeling across graphs

## Notes

This technique reflects a fundamental principle: no single visualization can show all aspects of multidimensional data. Systematic exploration with multiple graph types is both an analysis method (discovering patterns) and a communication strategy (presenting findings to different audiences).
