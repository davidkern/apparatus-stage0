---
source: accessibility
proposed-category: Announcement
name: Assertive-Update
---

**Definition**: Notifying the audience of critical information that requires
immediate attention, interrupting if necessary.

**Semantic Purpose**: The author wants to ensure the audience knows about
something urgent, even at the cost of interrupting their current focus.

**Examples**:
- `aria-live="assertive"` for critical errors
- `role="alert"` for immediate announcements
- Session timeout warnings
- Connection lost notifications
- Security warnings

**Containment**:
- Contains: Warning, Error
- Contained by: Application regions

**Relationship to Existing Categories**: Related to Warning and Error but
focused on delivery urgency. A Warning describes danger; Assertive-Update
ensures the warning is perceived immediately.

**Forms**:
- *Typographic*: Modal or prominent inline alert
- *Auditory*: Interrupts current announcement; "Alert:" prefix
- *Visual*: Attention-grabbing animation, focus trap

---
