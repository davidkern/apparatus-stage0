---
source: accessibility
proposed-category: Guidance
name: Input-Hint
---

**Definition**: Providing guidance on expected format or constraints for input.

**Semantic Purpose**: The author wants to prevent errors by clarifying
expectations before the user makes a mistake.

**Examples**:
- "Password must be at least 8 characters"
- "Format: MM/DD/YYYY"
- `aria-describedby` linking input to hint text
- Persistent helper text below form fields

**Containment**:
- Contains: Format specification, constraints
- Contained by: Form structure

**Relationship to Existing Categories**: Related to Instruction/Step but
preventive rather than directive. Not "do X" but "X should be like Y."

**Forms**:
- *Typographic*: Small text near input, distinct from label
- *Auditory*: Announced after field label when field receives focus
- *Visual*: Muted text, positioned near input

---
