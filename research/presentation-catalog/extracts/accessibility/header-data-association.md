---
source: accessibility
proposed-category: Cognitive-Support
name: Header-Data-Association
---

**Definition**: Expressing the relationship between a data cell and its
header(s).

**Semantic Purpose**: The author wants the audience to understand what
a data value means by knowing its column/row headers.

**Examples**:
- Table `<th scope="col">` and `<th scope="row">`
- `headers` and `id` attributes for complex tables
- Screen reader: "Price: $500, Weight: 12 lbs"
- Implicit row/column headers in simple tables

**Containment**:
- Contains: The association (not the data itself)
- Contained by: Table structure

**Relationship to Existing Categories**: Related to Relational/Dependency
but specific to tabular data. The framework discusses tables as structure;
this intent is about *within-table* relationships.

**Forms**:
- *Typographic*: Visual alignment in rows/columns
- *Auditory*: Headers announced with each cell
- *Visual*: Highlighting header row/column

---
