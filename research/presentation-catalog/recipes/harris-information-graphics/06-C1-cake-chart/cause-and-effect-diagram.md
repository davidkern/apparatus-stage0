---
name: Cause-and-Effect Diagram
slug: cause-and-effect-diagram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Cause-and-Effect (CE) Diagram, p. 69"

intent: Systematically review all factors that might contribute to a given situation by organizing potential causes in a hierarchical visual structure
direction: construction

components:
  - element: spine
    encodes: Bold horizontal arrow pointing toward the problem or objective
    required: true
  - element: major-category-arrows
    encodes: Primary cause categories leading into the spine (e.g., equipment, people, parts, processes)
    required: true
  - element: secondary-cause-arrows
    encodes: Factors contributing to each major category
    required: true
  - element: tertiary-cause-arrows
    encodes: Factors contributing to secondary causes (optional deeper analysis)
    required: false
  - element: problem-statement
    encodes: Word description of the problem or objective at the head of the spine
    required: true
  - element: clusters
    encodes: Groupings of related causes around each major category
    required: true

parameters:
  depth_levels: two | three | four
  category_organization: functional | departmental | custom
  encoding_additions: colors | symbols | enclosures | line_weights

related: []

warnings:
  - "Multiple valid layouts exist for the same problem - focus on including all factors rather than perfect structure"
  - "Basically a qualitative tool; quantitative additions are optional enhancements"

extensions:
  harris_entry: "Cause-and-Effect (CE) Diagram"
  alternate_names: ["Ishikawa Diagram", "fishbone diagram", "characteristic diagram"]
  typical_use: "quality problem analysis, cost reduction programs, root cause investigation"
---

## Description

The purpose of the cause-and-effect diagram is to provide a method for systematically reviewing all factors that might have an effect on or contribute to a given situation such as a quality problem or a cost reduction program.

This is accomplished by assigning each potential contributor to a line or arrow (sometimes referred to as branch, bone, or category line) and then arranging the lines or arrows in a hierarchical fashion in meaningful clusters.

## Examples

Harris provides a quality problem example (p. 69):

> Four major categories of causes potentially contributing to a noise specification problem: Equipment, People, Parts, and Process. Each major category arrow leads into the spine pointing toward "Cannot meet noise specification."

> Secondary causes branch off the major categories:
> - Equipment: Maintenance, Capital (with In-house and Vendors as tertiary)
> - People: New, Temps, Motivation, Depth, Training, Manuals
> - Parts: Material, Design (with Get wet, Damaged in process, Rough handling)
> - Process: Routing, Design, Testing, Documentation (with Not updated)

An alternate layout reorganizes the same factors:

> "In an alternate diagram, the major departments or functions might be the major categories and people and parts would be secondary or tertiary factors in each of the categories." (p. 69)

> Major categories become: Engineering, Fabrication, Assembly, Inspection, Testing, Documentation - with People, Parts, and other factors distributed as secondary causes within each.

## Usage

Cause-and-effect diagrams are most effective when:
- Brainstorming potential causes of a problem
- Organizing quality improvement discussions
- Documenting root cause analysis
- Training teams on systematic problem-solving

Additional information can be encoded using:
- Colors (priorities, probability of significant effect)
- Symbols (assignments, factors needing study)
- Enclosures (different shapes for different types)
- Line sizes (importance or impact)

Specification values can be assigned to branches where specifications exist, with indication of how well specifications are being met.

> "In generating cause-and-effect diagrams, it is generally more important that all of the factors are shown and considered rather than how the diagram is constructed." (p. 69)

## Notes

Cause-and-effect diagrams are almost always constructed horizontally. The fishbone name derives from the skeletal appearance when major and secondary causes branch off the central spine.

Terminology: The central horizontal arrow is the spine. Major category arrows are sometimes called bones, branches, or category lines. The groupings of related causes are called clusters. The lowest-level contributors are sometimes called root causes.
