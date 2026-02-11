# Intent Extraction: Tufte Chapters 5-6a

**Source**: Edward Tufte, *The Visual Display of Quantitative Information*, Chapter 5 "Chartjunk" and Chapter 6 "Data-Ink Maximization and Graphical Design" (pages 107-122)

**Extraction method**: Text-only OCR. Visual examples referenced but not directly accessible.

**Framework reference**: `/work/apparatus/catalog/framework.md`

---

## Extracted Communicative Intents

### 1. Show Data Clearly

**Name**: Data Clarity

**Definition**: The primary purpose of a data graphic is to communicate quantitative information with minimal interference, allowing the viewer to perceive the data itself rather than decorative or structural elements.

**How Tufte articulates it**:
- "The overwhelming fact of data graphics is that they stand or fall on their content, gracefully displayed"
- "Graphics do not become attractive and interesting through the addition of ornamental hatching and false perspective to a few bars"
- Dark grid lines "carry no information, clutter up the graphic, and generate graphic activity unrelated to data information"
- The grid "should usually be muted or completely suppressed so that its presence is only implicit—lest it compete with the data"

**Examples referenced**:
- Age-sex pyramid of France population (1967): original with heavy grid vs. revision with quieted grid
- Marey train schedule: progression from heavy grid to thinned lines to gray grid
- JASA style sheet example: "131 line-strokes and 15 digits to communicate its simple information"

**Framework category mapping**:
- **Category**: State / Distributional
- **Critical interface**: Visual L2/L3 (semiotic boundary) - where encoding choices either support or interfere with data perception
- **Degradation consideration**: Even at lower layers, ink/treatment should serve data, not decoration

**Source type**: Explicit (stated directly as core principle)

---

### 2. Enable Accurate Data Reconstruction

**Name**: Reconstruction Fidelity

**Definition**: Graphics should allow viewers to accurately read and interpolate specific data values when needed.

**How Tufte articulates it**:
- "When a graphic serves as a look-up table, then a grid may help in reading and interpolating"
- "A gray grid works well and, with a delicate line, may promote more accurate data reconstruction than a dark grid"

**Examples referenced**:
- Marey train schedule as functional look-up table
- Gray grid versions promoting accuracy

**Framework category mapping**:
- **Category**: State (current values) / Temporal (sequences)
- **Related intent**: Data Clarity - these work together; fidelity requires clarity

**Source type**: Explicit (stated as legitimate use case for grids)

---

### 3. Reveal Narrative and Causation

**Name**: Narrative Discovery

**Definition**: The best graphics draw viewers into discovering patterns, stories, and causal relationships within the data.

**How Tufte articulates it**:
- "The best designs...are intriguing and curiosity-provoking, drawing the viewer into the wonder of the data"
- "sometimes by narrative power, sometimes by immense detail, and sometimes by elegant presentation of simple but interesting data"
- Best graphics generate "information...sense of discovery...wonder...substance"

**Examples referenced**:
- Minard on Napoleon in Russia (narrative power)
- Marey's graphical train schedule
- Cancer maps
- Times weather history of New York City
- Chronicle of the annual adventures of the Japanese beetle
- "The new view of the galaxies"
- Age-sex pyramid annotations: "(a) Military losses in World War I", "(b) Deficit of births during World War I", etc.

**Framework category mapping**:
- **Category**: Relational (Causation, Connection) / Temporal (Timeline, Sequence)
- **Contains**: Pattern recognition, historical context, causal inference
- **Critical interface**: Composition layers (L6-L9) where narrative structure emerges

**Source type**: Explicit (stated as defining quality of best designs)

---

### 4. Annotate for Context

**Name**: Contextual Annotation

**Definition**: Annotations explain significant features of the data, providing historical, causal, or interpretive context that helps viewers understand what they see.

**How Tufte articulates it**:
- The France population pyramid includes labeled annotations explaining demographic events
- "Specific areas on a graphic should be labeled with words rather than encoded with hatching"

**Examples referenced**:
- Population pyramid annotations:
  - "(a) Military losses in World War I"
  - "(b) Deficit of births during World War I"
  - "(c) Military losses in World War II"
  - "(d) Deficit of births during World War II"
  - "(e) Rise of births due to demobilization after World War II"

**Framework category mapping**:
- **Category**: Explanation (Definition, Context)
- **Related intents**: Narrative Discovery - annotations support narrative understanding
- **Form**: Visual annotation layer; in typographic terms similar to L5 (Semantic Forms)

**Source type**: Inferred from example (the annotations are present in the visual, described in OCR)

---

### 5. Compare Across Categories or Time

**Name**: Comparative Display

**Definition**: Graphics enable comparison between different categories, time periods, or conditions to reveal differences and patterns.

**How Tufte articulates it**:
- Multi-window plot shows "X₁, X₂ scatterplots for the indicated levels of X₃ and X₄"
- Age-sex pyramid shows "Males" vs "Females" by age/year
- Tables comparing journals by percentage of graphics with moire vibration

**Examples referenced**:
- Multi-window particle physics momentum plot (X₁, X₂ conditioned on X₃, X₄)
- Population pyramid (male vs female by age)
- Tables comparing scientific journals' chartjunk frequency
- Tables comparing graphics textbooks over time

**Framework category mapping**:
- **Category**: Comparative (Difference, Before/After, Deviation)
- **Structural realization**: Side-by-side, small multiples, conditioning plots
- **Critical interface**: Visual L6-L7 (Visualization/Display composition)

**Source type**: Inferred from examples and structure

---

### 6. Show Distribution Shape

**Name**: Distributional Display

**Definition**: Graphics reveal the shape, spread, and key features of data distributions (quartiles, median, range, outliers).

**How Tufte articulates it**:
- Discussion of box plot and quartile plot designs
- "Perhaps special emphasis should be given to the middle half of the distribution"
- Box plot shows: maximum, upper quartile, median, lower quartile, minimum

**Examples referenced**:
- Mary Eleanor Spear's "range bar"
- John Tukey's "box plot"
- Redesigned "quartile plot" variations

**Framework category mapping**:
- **Category**: Distributional (Histogram, Quartiles, Ranking)
- **Structural elements**: minimum, quartiles, median, maximum, range
- **Critical interface**: Visual L3-L5 (encoding distribution through marks and scales)

**Source type**: Explicit (Chapter 6 detailed discussion of box plot redesign)

---

### 7. Efficient Information Encoding

**Name**: Data-Ink Efficiency

**Definition**: Maximize the proportion of ink devoted to data; every ink mark should carry non-redundant information.

**How Tufte articulates it**:
- "The principles of maximizing data-ink and erasing"
- Box plot "can be mostly erased without loss of information"
- "The space occupied by the doubled grid lines consumes 18 percent of the area"
- The quartile plot "uses the ink effectively and looks good"

**Examples referenced**:
- Box plot to quartile plot progression
- Multi-window plot grid reduction
- Grid line thinning in Marey schedule

**Framework category mapping**:
- **Category**: Meta-intent (applies across all other intents)
- **Principle**: Every visual element should serve the communicative purpose
- **Degradation**: Removing non-data ink should not reduce information

**Source type**: Explicit (core theoretical principle)

---

### 8. Support Working Analysis vs. Publication

**Name**: Context-Appropriate Design

**Definition**: Different design treatments are appropriate for working analysis (home/office) versus published presentation.

**How Tufte articulates it**:
- "Grids are mostly for the initial plotting of data at home or office rather than for putting into print"
- "Most ready-made graph paper comes with a darkly printed grid. The reverse (unprinted) side should be used"

**Examples referenced**:
- Graph paper usage guidance

**Framework category mapping**:
- **Category**: State (workflow context determines appropriate form)
- **Related concept**: Framework's media interception points - different media call for different treatments
- **Degradation path**: Publication requires more refinement than working plots

**Source type**: Explicit (stated design guidance)

---

## Anti-Intents (What Graphics Should NOT Do)

Tufte dedicates significant attention to failed communicative purposes. These can be understood as anti-intents or corrupted intents.

### A1. Self-Promotion ("The Duck")

**Definition**: When a graphic promotes its own design or production technology rather than communicating data.

**How Tufte articulates it**:
- "When a graphic is taken over by decorative forms or computer debris, when the data measures and structures become Design Elements, when the overall design purveys Graphical Style rather than quantitative information"
- "Occasionally designers seem to seek credit merely for possessing a new technology, rather than using it to make better designs"
- Response evoked: "Isn't it remarkable that the computer can be programmed to draw like that?" instead of "My, what interesting data"

**Examples referenced**:
- Big Duck building (architectural source of metaphor)
- American Education magazine 3D displays
- California Water Atlas irrigation visualization
- Computer-generated cross-hatched bar charts

**Corrupts intent**: Data Clarity, Narrative Discovery

---

### A2. Visual Noise (Moire Vibration)

**Definition**: Optical patterns that create visual interference, drawing attention to the graphic surface rather than the data.

**How Tufte articulates it**:
- "Moiré vibration is an undisciplined ambiguity, with an illusive, eye-straining quality that contaminates the entire graphic"
- "Vibrating lines are poorly drawn, unevenly spaced"
- Computer graphics "multiplying it more than ever"

**Examples referenced**:
- Cross-hatching patterns in various journals (table of frequencies)
- Graphics textbooks over time showing increasing moire
- SAS/GRAPH and Tell-A-Graf examples

**Corrupts intent**: Data Clarity, Reconstruction Fidelity

---

### A3. False Dimensionality

**Definition**: Adding fake perspective or 3D effects that distort data relationships and obscure accurate reading.

**How Tufte articulates it**:
- "The addition of a fake perspective to the data structure clutters many graphics"
- "at high fashion in the world of Boutique Data Graphics"
- Age structure pyramid: "five colors report, almost by happenstance, only five pieces of data"

**Examples referenced**:
- American Education 3D displays ("may well be the worst graphic ever to find its way into print")
- Pyramids with unlabeled stacked depth variable, Necker Illusion

**Corrupts intent**: Comparative Display, Reconstruction Fidelity

---

## Synthesis: Intent Categories from Tufte

| Tufte Concept | Framework Category | Intent Type |
|---------------|-------------------|-------------|
| Data clarity | State, Distributional | Primary |
| Reconstruction fidelity | State | Primary |
| Narrative discovery | Relational, Temporal | Primary |
| Contextual annotation | Explanation | Supporting |
| Comparative display | Comparative | Primary |
| Distributional display | Distributional | Primary |
| Data-ink efficiency | (Meta-principle) | Structural |
| Context-appropriate design | State | Contextual |
| Self-promotion (duck) | - | Anti-intent |
| Visual noise (moire) | - | Anti-intent |
| False dimensionality | - | Anti-intent |

---

## Limitations of Text-Only Extraction

1. **Visual examples inaccessible**: The most powerful arguments in Tufte rely on showing contrasts (before/after redesigns, good vs bad examples). The OCR captures descriptions but not the visual evidence.

2. **Diagram corruption**: The Marey train schedule sections are largely unreadable in OCR - the fine lines and dense scheduling information become character noise. The visual structure is entirely lost.

3. **Specific measurements unavailable**: References to "18 percent of the area" and visual proportions cannot be verified.

4. **Aesthetic judgment unsupportable**: Tufte's claims about what "looks good" require visual access to evaluate.

5. **Annotation content partially captured**: The France population pyramid annotations are readable in the OCR, but their spatial relationship to the data is not.

6. **Color and treatment invisible**: References to gray grids, tint screens, and shading cannot be assessed.

---

## Notes on Extraction Method

**Explicit intents** were extracted from Tufte's direct prose statements about the purpose and principles of data graphics.

**Inferred intents** were derived from:
- The structure of examples he chooses to discuss
- The types of comparisons he makes
- The redesign progressions he documents
- The annotations present in described graphics

The text extraction quality varies significantly:
- Prose sections: High fidelity
- Tables: Partially readable
- Complex diagrams (Marey schedule): Nearly unreadable
- Figure captions: Generally readable

This extraction would benefit from visual access to the source pages for:
- Verifying specific design details
- Capturing spatial relationships
- Understanding the full force of before/after contrasts
