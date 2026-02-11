---
source: accessibility
proposed-category: Alternative-Representation
name: Text-Alternative
---

**Definition**: Providing textual description of non-text content.

**Semantic Purpose**: The author wants audiences who cannot perceive images,
icons, or other visual content to receive equivalent information through text.

**Examples**:
- Alt text for images: "Bar chart showing sales growth from Q1 to Q4"
- Icon labels: aria-label on icon buttons
- Decorative image markers: `alt=""`
- Long descriptions for complex diagrams

**Containment**:
- Contains: Description of visual content
- Contained by: Image/media containers

**Relationship to Existing Categories**: Related to Description/Explanation
but with a specific accessibility purpose. Not adding information but
*translating* information to a different mode.

**Forms**:
- *Typographic*: Alt attribute text (invisible but programmatically available)
- *Auditory*: Screen reader announces alt text in place of image
- *Visual*: N/A (the image itself is the visual form)

---
