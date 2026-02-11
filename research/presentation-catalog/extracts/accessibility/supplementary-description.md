---
source: accessibility
proposed-category: Cognitive-Support
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

## Summary: Proposed New Categories

Based on accessibility standards and inclusive design, the following new
categories may be warranted:

| Category | What it communicates | Distinct from existing? |
|----------|---------------------|------------------------|
| **Orientation** | Where user is, how to navigate | Yes—distinct from Transition/State |
| **Announcement** | When/how to notify of changes | Yes—about delivery timing |
| **Alternative-Representation** | Same content, different mode | Yes—cross-sensory translation |
| **Guidance** | Help avoiding/fixing errors | Partially overlaps Instruction |
| **Cognitive-Support** | Reduced complexity, manageable chunks | Yes—about processing load |
