---
source: accessibility
proposed-category: Orientation
name: Landmark
---

**Definition**: Identifying a region's role within the larger structure.

**Semantic Purpose**: The author wants the audience to understand what kind of
content a region contains and its function relative to other regions. Landmarks
enable non-sequential access to page sections.

**Examples**:
- HTML5 `<main>`, `<nav>`, `<aside>`, `<header>`, `<footer>` elements
- ARIA roles: `banner`, `navigation`, `main`, `complementary`, `contentinfo`
- "Primary navigation", "Sidebar", "Search" region labels
- Screen reader announcements: "Main landmark", "Navigation region"

**Containment**:
- Contains: Various content intents
- Contained by: Document/Page structure

**Relationship to Existing Categories**: Distinct from Hierarchy (which shows
nesting) and from Marker (which signals a boundary). Landmark identifies *what
kind* of region this is, not its position in a sequence.

**Forms**:
- *Typographic*: Visual layout (left column, header bar, footer area)
- *Auditory*: Announcement of region type on entry; navigable via screen reader shortcuts
- *Visual*: Spatial positioning, distinctive visual treatment per region type

---
