---
source: accessibility
proposed-category: Cognitive-Support
proposed-group: Grouping and Labeling
name: Control-Group
---

**Definition**: Indicating that related form controls belong together under
a common label.

**Semantic Purpose**: The author wants the audience to understand that
multiple controls share a common context or purpose.

**Examples**:
- `<fieldset>` with `<legend>`: "Payment Method"
- Radio button groups for single selection
- Checkbox groups for multiple selection
- Address fields grouped as "Shipping Address"

**Containment**:
- Contains: Related controls (radio buttons, checkboxes, etc.)
- Contained by: Form structure

**Relationship to Existing Categories**: Related to Grouping (in Relational)
but specific to interactive controls. The group label provides context that
individual labels cannot.

**Forms**:
- *Typographic*: Visual border/box, group heading
- *Auditory*: Legend announced when entering group; provides context for each control
- *Visual*: Visual grouping, shared border/background

---
