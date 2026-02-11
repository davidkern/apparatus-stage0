---
source: accessibility
proposed-category: Announcement
name: State-Change
---

**Definition**: Announcing that an interactive element's state has changed.

**Semantic Purpose**: The author wants the audience to perceive dynamic changes
that visual users see automatically.

**Examples**:
- `aria-expanded="true/false"` for accordions, menus
- `aria-pressed="true/false"` for toggle buttons
- `aria-checked` for checkboxes
- `aria-selected` for list items
- "Expanded", "Collapsed", "Selected" announcements

**Containment**:
- Contains: (the state value)
- Contained by: Interactive components

**Relationship to Existing Categories**: Related to Status but specific to
interactive element state. Status describes system/process state;
State-Change describes UI component state.

**Forms**:
- *Typographic*: Visual indicator (chevron direction, button appearance)
- *Auditory*: State announced on activation
- *Visual*: Animation, icon change

---


Accessibility requires that content be perceivable through different sensory
channels. This category covers intents that provide equivalent information
through a different mode.
