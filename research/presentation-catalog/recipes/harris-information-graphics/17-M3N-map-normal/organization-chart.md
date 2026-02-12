---
name: Organization Chart
slug: organization-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Organization Chart, pp. 260-264"

intent: Show how people, operations, functions, equipment, or activities are organized, arranged, structured, and interrelated
direction: both

components:
  - element: enclosures
    encodes: Text contained in geometric shapes (boxes, symbols); represent entities
    required: true
  - element: connecting-lines
    encodes: Relationships between entities (reporting, communication, coordination)
    required: false
  - element: text-content
    encodes: Names, titles, functions, or descriptions within enclosures
    required: true
  - element: line-style
    encodes: Type of relationship (solid=direct, dashed=indirect/advisory)
    required: false

parameters:
  layout: tree-vertical | tree-horizontal | circular | matrix | without-lines
  content_type: organizational-units | functions | titles | names | activities | equipment
  line_style: solid | dashed | arrows | mixed

related:
  - slug: flow-chart
    relationship: variant-of
  - slug: pert-chart
    relationship: contrasts

warnings:
  - "Matrix management structures require special handling to show multiple reporting relationships"
  - "Large organizations may require multiple charts at different levels of detail"

extensions:
  harris_entry: "Organization Chart"
  alternate_names:
    - "org chart"
    - "family tree"
    - "descendant chart"
    - "pedigree chart"
  typical_use: "showing organizational structure and reporting relationships"
  content_types:
    organizational_units: "divisions, departments, business units"
    functions: "what parts of organization are responsible for"
    titles: "president, manager, supervisor, etc."
    names: "individual people"
    activities: "how activities are organized"
    equipment: "network diagrams, schematics"
  layout_types:
    tree_pyramid: "most widely used; hierarchical top-to-bottom"
    horizontal: "left-to-right hierarchy"
    circular_radial: "deemphasizes hierarchy"
    matrix: "shows multiple reporting relationships"
    without_lines: "shows grouping without formal ties"
---

## Description

Organization charts are diagrams that show how people, operations, functions, equipment, activities, etc., are organized, arranged, structured, and/or interrelated. They are applicable with any size of organization.

A typical organization chart consists of text enclosed in geometric shapes (sometimes referred to as boxes, enclosures, box enclosures, or symbols) that are connected with lines (sometimes referred to as links) or arrows. Charts of this type generally progress from top to bottom or left to right.

Organization charts are sometimes considered a variation of flow chart or flow diagram.

## Examples

Harris illustrates extensive variations (pp. 260-264):

**Types of information included:**
- Information on major organizational units (Corporate Headquarters > Business Units > Divisions)
- Information on functions performed (Administrative > Manufacturing, Marketing, Finance)
- Information by title (President > VP Production, VP Marketing, Controller)
- Information by name (Sally Brown > Frank Noble, June Gary, Charles Green)
- Information by activity (Handling of rejects > Vendor rejects, Production rejects, Field returns)
- Special symbolic representation (analyzing supervisory vs. non-supervisory ratios)

**Variations of organization charts:**
- **Matrix type**: Shows multiple reporting relationships (engineers reporting to both engineering manager and product managers)
- **Temporary assignments**: Shading indicates temporary project assignments while leaving direct reporting intact
- **Distribution of responsibilities**: Functional and administrative managers sharing oversight
- **Nonsubordinate relationships**: Lines showing coordination rather than reporting
- **Without connecting lines**: Franchise model where units are autonomous
- **Equipment networks**: Network diagrams showing how equipment is interconnected

**Layout variations (pp. 263):**
- Traditional tree or pyramid chart (vertical)
- Stylized pyramid
- Horizontal chart
- Circular/radial chart
- Highest ranking position at bottom (inverted)
- Charts without connecting lines (vertical and horizontal)

**Construction options (p. 264):**
- Enclosure types: rectangles, other shapes, no enclosure, dashed enclosures, shadows, 3D
- Multiple entries: ways to show multiple entities without individual boxes
- Multiple individuals/functions: job sharing, dual responsibilities
- Fill options: colored, unfilled, partially filled (to encode information)
- Text content: function, title, name, picture, detailed information
- Connecting lines: solid, dashed, arrows, stepped, slanted, curved

## Usage

**Functions of organization charts:**
- Define lines of authority and responsibility
- Show who reports to whom
- Show how people, departments, organizations, or equipment interrelate
- Make it known where to go to resolve problems or concerns
- Orient people to a system or organization
- Obtain insight into organizations (degree of specialization, structure type, centralization)
- Improve understanding of complex organizations, systems, or relationships
- Assist in the analysis and administration of large organizations
- Provide a tool for use in the planning process
- Provide a tool for comparing the structure of various organizations

**Line conventions:**
- Solid lines: formal or semiformal relationships (reporting, communication, shared responsibility)
- Dashed/dotted lines: indirect, temporary, limited, or advisory relationships
- Arrows: emphasize directional nature (communications, progression, advice)

**Special situations:**
- **Direct and indirect reporting**: Solid line for direct, dashed for indirect
- **Staff vs. line positions**: Cluster staff positions separately; use different lines/colors
- **Partial organization charts**: Show only chain of command for specific area
- **Recording information**: Track formal and informal communication channels

## Notes

Because of the size and complexity of large organizations, multiple charts are generally required. Genealogical charts are a form of organization chart, normally drawn in tree format (vertical or horizontal), sometimes referred to as family trees, descendant charts, or pedigree charts.
