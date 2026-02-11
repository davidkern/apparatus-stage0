---
source: accessibility
proposed-category: Announcement
name: Polite-Update
---

**Definition**: Notifying the audience of new information without interrupting
their current task.

**Semantic Purpose**: The author wants the audience to learn about a change
when convenient, respecting their attention and workflow.

**Examples**:
- `aria-live="polite"` regions for status updates
- Toast notifications that don't steal focus
- "3 new messages" badges
- Loading complete indicators
- Search result count updates

**Containment**:
- Contains: Status, Progress
- Contained by: Application regions

**Relationship to Existing Categories**: Related to Status and Acknowledgement
but focused on *timing and interruption level* rather than content type.

**Forms**:
- *Typographic*: Badge, subtle notification area
- *Auditory*: Announced when user pauses; queued after current reading
- *Visual*: Non-modal indicator, status bar update

---
