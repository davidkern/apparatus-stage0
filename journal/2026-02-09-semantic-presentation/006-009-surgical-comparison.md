# Surgical Comparison: 006 vs 009

Section-by-section, statement-by-statement comparison to identify concept replacements while preserving rhetorical structure.

---

## Title

| 006 | 009 |
|-----|-----|
| Hierarchy of Representational Forms | Hierarchy of Compositional Forms |

**Concept replacement:** "Representational" → "Compositional"
- 006: How data becomes visible (representation)
- 009: How visual elements create comprehensible structure (composition)

---

## Problem Statement, Paragraph 1

### 006:
> Scientists publish research in a variety of forms to promote understanding.
> No single medium supports all forms of conveying meaning, but there is
> commonality within clusters of capability. There is also a hierarchy in
> the complexity of forms.

### 009:
> Technical documents use visual organization to make structure apprehensible.
> No single medium supports all forms of visual organization, but there is
> commonality within clusters of capability. There is also a hierarchy in
> how simple visual mechanisms compose into recognizable conventions.

**Concept replacements:**
| 006 | 009 | Purpose |
|-----|-----|---------|
| Scientists publish research | Technical documents use visual organization | Actor and activity |
| forms to promote understanding | make structure apprehensible | Goal |
| conveying meaning | visual organization | What varies across media |
| complexity of forms | simple visual mechanisms compose into recognizable conventions | Nature of hierarchy |

**Preserved:** "No single medium... commonality within clusters... also a hierarchy"

---

## Problem Statement, Paragraph 2 (Examples)

### 006:
> For example:
> - Text may be aligned in such a way that it is referred to as a "table"
>   and conveys relationships between data.
> - Dots on a page arranged in a certain way also convey relationships
>   between data, similarly to a table, but also differently.
> - Dots and text are simple forms which almost all media support.
> - But scientists don't arrange dots and text to publish their data —
>   they think in terms of tables and charts.

### 009:
> For example:
> - Open a physics textbook and the page reveals its structure instantly:
>   here is a definition, here a figure referenced from the prose, here a
>   warning, here exercises.
> - That instant recognition comes from compositional conventions: boxed
>   regions for definitions, floating figures with numbered captions,
>   highlighted callouts for warnings, margin notes for asides.
> - Those conventions are built from simpler visual mechanisms: size contrast,
>   weight contrast, spatial separation, borders, indentation.
> - But authors don't specify "18pt bold in a 1px gray border" — they think
>   in terms of definitions, figures, and callouts.

**Rhetorical structure preserved:**
1. Concrete example opening ("For example")
2. High-level form (table/definition)
3. How it's built from lower forms (dots/mechanisms)
4. Simple forms are universal
5. But practitioners think in high-level vocabulary

**Concept replacements:**
| 006 | 009 | Purpose |
|-----|-----|---------|
| Text aligned → "table" | Physics textbook → structure instantly | Entry point example |
| Dots arranged | Boxed regions, floating figures | Lower-level building blocks |
| Dots and text are simple | Size contrast, weight contrast, borders | Universal primitives |
| Scientists don't arrange dots | Authors don't specify "18pt bold" | Practitioner vocabulary |
| tables and charts | definitions, figures, callouts | Named high-level forms |

---

## Problem Statement, Core Question

### 006:
> The question is: **what is the hierarchy of these representational forms,
> and what is the common set of forms at each layer of complexity from which
> other forms are built?**

### 009:
> The question is: **what is the hierarchy of these compositional forms,
> and what principles govern how visual mechanisms combine into the
> conventions that make document structure apprehensible?**

**Concept replacements:**
| 006 | 009 |
|-----|-----|
| representational forms | compositional forms |
| common set of forms at each layer | principles govern how visual mechanisms combine |
| from which other forms are built | into conventions that make structure apprehensible |

**Rhetorical structure preserved:** Bold core question with hierarchy framing.

---

## Problem Statement, Final Paragraph

### 006:
> We want to support as many forms as a medium might support, both at low
> levels of complexity where meaning is conveyed at lower density, and at
> higher levels where information density is higher. But we cannot directly
> implement all forms for all media, so we need to find a set that maximizes
> expressivity while minimizing effort for both the researcher publishing
> data and the programmer implementing the presentation system.

### 009:
> We want to support the compositional conventions that documents use, both
> at low levels where individual visual mechanisms operate, and at higher
> levels where those mechanisms combine into recognizable forms like definitions
> and captioned figures. But we cannot directly implement all conventions for
> all media, so we need to find the principles that underlie them — enabling
> appropriate expression across media with different capabilities.

**Concept replacements:**
| 006 | 009 |
|-----|-----|
| as many forms as a medium might support | compositional conventions that documents use |
| meaning conveyed at lower density | individual visual mechanisms operate |
| information density is higher | mechanisms combine into recognizable forms |
| find a set that maximizes expressivity | find the principles that underlie them |
| researcher publishing data | (implicit: authors) |
| programmer implementing | (implicit: system implementer) |

---

## "This Is Not a..." Section

### 006 Title:
> This Is Not a Reduction Problem

### 009 Title:
> This Is Not a Catalog of Page Elements

**Rhetorical purpose:** Set negative framing to prevent wrong approach.

### 006:
> Prior research (004, 005) framed this as finding "irreducible primitives" —
> the minimal set from which everything else composes. This framing led to
> unsatisfying results because:
>
> 1. It sought a single layer of abstraction when multiple layers exist
> 2. It conflated "what can be built from" with "what scientists think in"
> 3. It produced a flat vocabulary when the actual structure is hierarchical
> 4. It didn't address how higher forms degrade to lower forms across media

### 009:
> Prior research (007, 008) approached this as cataloging: what document
> elements exist, what typographic treatments are available, what CSS
> properties can be applied. This framing led to unsatisfying results because:
>
> 1. It started from digital implementations (CSS, HTML) rather than the
>    principles that those implementations inherited from print
> 2. It produced inventories without explaining why conventions exist or
>    how they achieve comprehension
> 3. It conflated visual mechanisms (size, weight, borders) with the
>    compositional forms those mechanisms create (headings, callouts, asides)
> 4. It didn't address how forms at different levels of complexity relate

**Concept replacements:**
| 006 | 009 |
|-----|-----|
| finding "irreducible primitives" | cataloging: what elements exist |
| single layer when multiple exist | started from digital not print principles |
| "what can be built from" vs "what scientists think in" | visual mechanisms vs compositional forms |
| flat vocabulary vs hierarchical | inventories without explaining why |
| higher forms degrade to lower | forms at different levels relate |

**Rhetorical structure preserved:**
- Reference to prior failed research
- "This framing led to unsatisfying results because:"
- Four numbered failure modes
- Each failure mode ~ one sentence

---

## "The correct framing" paragraph

### 006:
> The correct framing is **hierarchicalization and categorization**:
> - What layers of representational complexity exist?
> - What is the vocabulary at each layer?
> - How do forms at higher layers degrade to lower layers?
> - Where do different media capabilities cluster?

### 009:
> The correct framing is **hierarchicalization from principles**:
> - What layers of compositional complexity exist?
> - What is the vocabulary at each layer?
> - How do higher forms compose from simpler mechanisms?
> - What principles from the print tradition explain why these forms work?

**Concept replacements:**
| 006 | 009 |
|-----|-----|
| hierarchicalization and categorization | hierarchicalization from principles |
| representational complexity | compositional complexity |
| (same) | (same: vocabulary at each layer) |
| degrade to lower layers | compose from simpler mechanisms |
| media capabilities cluster | print tradition explain why forms work |

---

## Research Questions Structure

Both have identical section structure:
- Layer Structure (questions 1-3)
- Vocabulary at Each Layer (questions 4-6)
- Degradation and Interception (questions 7-8)
- Practical Constraints (questions 9-10)

**This structure is the key rhetorical constraint.** It forces:
1. First understand layers
2. Then understand vocabulary
3. Then understand cross-media behavior
4. Then ground in practical domain

---

## Research Questions, Layer Structure

### Question 1

**006:**
> **What layers of representational complexity exist in scientific
> communication?** Examine how scientists actually publish: papers,
> notebooks, presentations, data repositories. What forms do they use?
> How do these forms relate to each other in terms of expressiveness
> and information density?

**009:**
> **What layers of compositional complexity exist in technical documents?**
> Examine how technical content is actually organized: textbooks, papers,
> reference manuals, technical reports. What compositional forms do they
> use? How do these forms relate to each other in terms of structural
> complexity and reader comprehension?

| 006 | 009 |
|-----|-----|
| scientific communication | technical documents |
| scientists actually publish | technical content is actually organized |
| papers, notebooks, presentations, data repositories | textbooks, papers, reference manuals, technical reports |
| expressiveness and information density | structural complexity and reader comprehension |

### Question 2

**006:**
> **How do representational forms decompose into simpler forms?** A
> scatter plot can be described as "dots positioned by data values on
> a coordinate plane." A table can be described as "text aligned in
> rows and columns." What is the decomposition graph? Are there natural
> layers where many forms share a common substrate?

**009:**
> **How do compositional forms decompose into simpler mechanisms?** A
> definition box can be described as "bordered region with bold term and
> explanatory text." A captioned figure can be described as "image with
> numbered label and descriptive paragraph positioned together." What is
> the decomposition graph? Are there natural layers where many forms share
> common visual mechanisms?

| 006 | 009 |
|-----|-----|
| representational forms | compositional forms |
| scatter plot = dots positioned by data values | definition box = bordered region + bold term |
| table = text aligned in rows and columns | captioned figure = image + label + paragraph |
| common substrate | common visual mechanisms |

### Question 3

**006:**
> **Where do media capabilities cluster?** Some media can render dots
> at arbitrary positions (graphical). Some can only position text in
> a grid (terminal). Some can only stream text (plain text). What are
> the natural capability tiers, and what vocabulary is native to each?

**009:**
> **Where do media capabilities cluster?** Some media can position elements
> arbitrarily (print, PDF). Some can only flow content linearly with inline
> styling (terminal). Some can only structure text hierarchically (plain
> markdown). What are the natural capability tiers, and what compositional
> vocabulary is native to each?

| 006 | 009 |
|-----|-----|
| render dots at arbitrary positions | position elements arbitrarily |
| position text in a grid (terminal) | flow content linearly with inline styling |
| stream text (plain text) | structure text hierarchically (plain markdown) |

---

## Research Questions, Vocabulary at Each Layer

### Question 4

**006:**
> **What forms do scientists actually use?** Not what primitives exist,
> but what vocabulary do researchers employ when communicating results?
> Tables, figures, equations, diagrams, charts, lists, prose. What is
> the full inventory?

**009:**
> **What compositional forms do technical documents actually use?** Not
> what CSS properties exist, but what vocabulary do writers and designers
> employ when organizing content? Definitions, examples, warnings, figures,
> exercises, margin notes, cross-references. What is the full inventory?

| 006 | 009 |
|-----|-----|
| scientists | writers and designers |
| communicating results | organizing content |
| Tables, figures, equations, diagrams, charts | Definitions, examples, warnings, figures, exercises |
| primitives | CSS properties |

### Question 5

**006:**
> **What forms do visualization systems provide?** Grammar of Graphics,
> Vega-Lite, matplotlib, ggplot2, D3 — what vocabulary do these systems
> expose to users? How do they organize that vocabulary into layers or
> categories?

**009:**
> **What forms do typographic and layout systems provide?** The print
> tradition developed compositional conventions over centuries. What
> vocabulary do book designers, typographers, and layout systems use?
> How do they organize that vocabulary into levels or categories?

| 006 | 009 |
|-----|-----|
| visualization systems | typographic and layout systems |
| Grammar of Graphics, Vega-Lite, matplotlib, ggplot2, D3 | print tradition over centuries |
| these systems | book designers, typographers, layout systems |

### Question 6

**006:**
> **What forms do document systems provide?** LaTeX, HTML, Markdown,
> Jupyter notebooks, scientific publishing standards — what structures
> do they define? How do they distinguish content structure from
> presentation?

**009:**
> **What do the foundational sources reveal?** Bringhurst, Tschichold,
> Müller-Brockmann, Hochuli, and other foundational typographers — what
> principles do they articulate? How do they explain why compositional
> conventions achieve comprehension?

| 006 | 009 |
|-----|-----|
| document systems | foundational sources |
| LaTeX, HTML, Markdown, Jupyter | Bringhurst, Tschichold, Müller-Brockmann, Hochuli |
| what structures do they define | what principles do they articulate |
| content structure from presentation | why conventions achieve comprehension |

---

## Phase 1: Gather Evidence

**006 categories:**
- Scientific communication
- Visualization systems
- Document systems
- Data representation

**009 categories:**
- Foundational typography
- Book and document design
- The transition to digital
- Academic perspectives

**Concept replacements:**
| 006 | 009 |
|-----|-----|
| Scientific communication | Book and document design |
| Visualization systems | Foundational typography |
| Document systems | The transition to digital |
| Data representation | Academic perspectives |

**Key difference in framing:**
- 006: "Explore literature and systems"
- 009: "Begin with print typography and book design. Understand what problems the print tradition solved and how, before examining how digital systems adapted"

009 explicitly prioritizes historical/print sources over digital/system sources. This is a deliberate methodological choice that affected the research outcome.

---

## Success Criteria

Both have identical structure:
1. A hierarchy diagram
2. A vocabulary inventory
3. A media capability mapping
4. Degradation rules
5. Domain coverage analysis

**And both include:**
> The research may also succeed by clearly articulating why the hierarchy
> framing is wrong and proposing a better alternative.

This escape clause preserves scientific integrity while maintaining structural expectations.

---

## Non-Goals

**006:**
- Producing implementation code
- Defining exact syntax or schema
- Resolving all ambiguities
- Achieving a minimal primitive count (this is not a reduction problem)

**009:**
- Producing implementation code
- Defining exact syntax or schema
- Resolving all ambiguities
- Cataloging every page element (this is not an inventory problem)
- Re-investigating data visualization forms (covered in 006)

**Key addition in 009:** "Cataloging every page element (this is not an inventory problem)" — reinforces the "not a catalog" framing from earlier.

---

## Summary: Rhetorical Techniques Preserved

1. **Problem statement structure:**
   - General claim about domain
   - "No single medium..." universality claim
   - Concrete examples (4 bullets showing decomposition)
   - Bold core question
   - Practical motivation paragraph

2. **Negative framing section:**
   - "This is not a [wrong framing]"
   - Reference to prior failed research
   - Four numbered failure modes
   - "The correct framing is..."

3. **Research questions:**
   - Four categories (Layer Structure, Vocabulary, Degradation, Practical)
   - 10 total questions
   - Same numbering and grouping

4. **Phase structure:**
   - Phase 1: Gather Evidence (with domain-specific categories)
   - Phase 2: Map the Hierarchy
   - Phase 3: Test Against Domain
   - Phase 4: Synthesize

5. **Success criteria:**
   - Five specific deliverables
   - Escape clause for alternative framing

6. **Non-goals:**
   - Prevents scope creep
   - Reinforces "not a [wrong thing]"

---

## Transformation Rules for 010

To create 010 from 006's structure:

1. Replace **domain actor** (scientists → speakers/listeners)
2. Replace **domain activity** (publishing research → explaining/narrating)
3. Replace **domain artifacts** (papers, charts → lectures, explanations)
4. Replace **primitive mechanisms** (dots, text alignment → pitch, pace, pause)
5. Replace **high-level forms** (tables, scatter plots → definitions, warnings, enumerations)
6. Replace **systems to examine** (Vega-Lite, ggplot2 → rhetoric, prosody, TTS)
7. Replace **foundational sources** (Bertin, Wilkinson → Aristotle, prosody research)
8. Replace **media gradient** (graphical → terminal → text) → (full speech → screen reader → silence)
9. Replace **decomposition examples** (scatter plot = dots + coordinates → warning = pitch shift + slower pace + verbal marker)
10. Maintain **identical structure** for research questions, phases, success criteria
