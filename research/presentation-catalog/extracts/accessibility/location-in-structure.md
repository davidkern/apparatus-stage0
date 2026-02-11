---
source: accessibility
proposed-category: Orientation
name: Location-in-Structure
---

**Definition**: Indicating where the current focus/position exists within a hierarchy.

**Semantic Purpose**: The author wants the audience to understand their current
position relative to the whole. Prevents disorientation in complex structures.

**Examples**:
- Breadcrumbs: "Home > Products > Electronics > Phones"
- `aria-current="page"` or `aria-current="location"` on navigation items
- Pagination: "Page 3 of 12"
- Document outline showing current section highlighted
- Screen reader announcement: "Heading level 2, 'Installation'"

**Containment**:
- Contains: Hierarchy (implied), Sequence (implied)
- Contained by: Navigation regions

**Relationship to Existing Categories**: Related to Hierarchy and Sequence but
distinct. Those describe the *structure*; Location-in-Structure describes
*where you are* within it.

**Forms**:
- *Typographic*: Breadcrumb trail, highlighted TOC entry, page numbers
- *Auditory*: "You are here" announcements, heading level announcements
- *Visual*: Highlighted path in tree, position marker in timeline

---
