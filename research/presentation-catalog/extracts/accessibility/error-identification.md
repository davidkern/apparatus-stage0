---
source: accessibility
proposed-category: Guidance
name: Error-Identification
---

**Definition**: Identifying which input has a problem and what is wrong.

**Semantic Purpose**: The author wants the audience to locate and understand
errors so they can correct them.

**Examples**:
- `aria-invalid="true"` on erroneous fields
- "Email is required" - specific to field
- Error summary at top of form with links to fields
- Red border + error message near field
- "Please enter a valid email in the format name@domain.com"

**Containment**:
- Contains: Field identification + Error description
- Contained by: Form validation

**Relationship to Existing Categories**: Related to Error (which is more
general) but specific to input validation. Error says something is wrong;
Error-Identification says *which field* and *how to fix it*.

**Forms**:
- *Typographic*: Inline error near field, summary list at top
- *Auditory*: Error announced, focus moved to first error
- *Visual*: Red/warning styling, error icon

---
