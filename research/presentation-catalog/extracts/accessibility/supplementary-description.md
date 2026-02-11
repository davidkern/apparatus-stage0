---
source: accessibility
proposed-category: Cognitive-Support
proposed-group: Grouping and Labeling
name: Supplementary-Description
---

**Definition**: Providing additional descriptive text associated with an element.

**Semantic Purpose**: The author wants to offer extra context or explanation
that supplements but doesn't replace the primary label.

**Examples**:
- `aria-describedby` pointing to help text
- Tooltip content for additional explanation
- "More info" expansions
- Instructions associated with form fields

**Containment**:
- Contains: Explanatory text
- Contained by: Element with primary label

**Relationship to Existing Categories**: Related to Aside and Elaboration but
programmatically associated with a specific element. The association is the key.

**Forms**:
- *Typographic*: Muted text near element, tooltip on hover
- *Auditory*: Announced after accessible name
- *Visual*: Secondary text styling, info icon with tooltip

---
