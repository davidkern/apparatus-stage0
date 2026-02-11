# Intent Extraction: Tufte Chapter 7b (pp. 150-160)

Source: "The Visual Display of Quantitative Information," Chapter 7 "Multifunctioning Graphical Elements"
Pages: 150-160 (text extraction only)
Extraction method: Text-only OCR, no visual access

## Extracted Communicative Intents

### 1. Avoid Puzzle Graphics

**Name:** Cognitive Transparency

**Definition:** Graphics should communicate visually rather than requiring verbal decoding. The communicative purpose is immediate comprehension without conscious interpretation effort.

**Tufte's Articulation:**
> "A sure sign of a puzzle is that the graphic must be interpreted through a verbal rather than a visual process."

> "Over and over, the viewers must run little phrases through their minds, trying to maintain the right pattern of words to make sense out of the visual montage"

> "By contrast, in a non-puzzle graphic, the translation of visual to verbal is quickly learned, automatic, and implicit—so that the visual image flows right through the verbal decoder initially necessary to understand the graphic."

Cites Paul Valéry: "Seeing is forgetting the name of the thing one sees."

**Examples Referenced:**
- 16-shade color map of 3,056 counties (negative example—creates verbal decoding burden)
- Vauthier's "mountain-to-the-sea" color method (negative example—requires mnemonic phrases)
- Gray-shaded galaxies map (positive example—natural visual hierarchy)

**Framework Category:** Emphasis / Explanation
This intent maps to making the **State** or **Distributional** intents transparent—the graphic should convey its meaning without requiring the viewer to consciously process translation rules.

**Source Type:** Explicit prose

---

### 2. Establish Visual Hierarchy Through Natural Ordering

**Name:** Visual Hierarchy via Natural Order

**Definition:** Use visual encodings that have inherent perceptual ordering, allowing viewers to intuit quantity relationships without learning arbitrary mappings.

**Tufte's Articulation:**
> "Because they do have a natural visual hierarchy, varying shades of gray show varying quantities better than color."

> "The shades of gray provide an easily comprehended order to the data measures. This is the key."

**Examples Referenced:**
- Gray-shaded galaxies map (positive)
- Color-coded county maps (negative—colors lack natural ordering except possibly "red = hot/high")

**Framework Category:** Distributional / Comparative
Maps to expressing **magnitude** or **ranking** through perceptually natural channels.

**Source Type:** Explicit prose

---

### 3. Organize Information Flow Hierarchically

**Name:** Hierarchical Information Architecture

**Definition:** Structure graphics to guide the eye through layered information in an ordered, sequential manner—from macro to micro, from overview to detail.

**Tufte's Articulation:**
> "Central to maintaining clarity in the face of the complex are graphical methods that organize and order the flow of graphical information presented to the eye."

> "How can graphical architecture promote the ordered, sequenced, hierarchical flow of information from the graphic to the mind's eye? How can the data-information be arranged so that the viewer is able to peel back layer after layer of data from a graphic?"

**Examples Referenced:**
- Population density map of the United States (implicit reference—"a glory of modern cartography")
- Ayres' display of American divisions in France (explicit reference)

**Framework Category:** Relational / State
Maps to **Hierarchy** intent—communicating nested or layered structure.

**Source Type:** Explicit prose

---

### 4. Support Multiple Viewing Depths

**Name:** Multi-depth Viewing

**Definition:** Design graphics that reveal different information at different viewing distances—aggregate structure from afar, fine detail up close, and implied/contextual information underlying the graphic.

**Tufte's Articulation:**
> "Graphics can be designed to have at least three viewing depths: (1) what is seen from a distance, an overall structure usually aggregated from an underlying microstructure; (2) what is seen up close and in detail, the fine structure of the data; and (3) what is seen implicitly, underlying the graphic—that which is behind the graphic."

**Examples Referenced:**
- U.S. population density dot map showing:
  - Corridors connecting urban complexes (distance view)
  - Effects of landforms on population distribution (medium view)
  - Small towns along highways "linked like a string of pearls" (close view)
  - ~400,000 points on implicit grid (underlying structure)

**Framework Category:** Aggregative / Distributional
Maps to **Summary** at distance, **Detail** up close—the intent is to serve multiple levels of inquiry.

**Source Type:** Explicit prose

---

### 5. Separate Visual Angles for Different Data Aspects

**Name:** Angular Separation of Data Dimensions

**Definition:** Assign different visual angles (horizontal, vertical, diagonal) to different data dimensions so each can be read independently without confusion.

**Tufte's Articulation:**
> "Different visual angles for different aspects of the data also organize graphical information. Each separate line of sight should remain unchanging (preferably horizontal or vertical) as the eye watches for data variation off the flat of the line of sight."

> "Thus while every drop of ink serves three different data display functions, each of the three comes to the eye with its own independence and integrity."

**Examples Referenced:**
- Ayres' display of American divisions in France:
  - Profile of horizon for upward-moving time-series (one angle)
  - Vertical for composition of the bar (second angle)
  - Horizontal for each division's stay (third angle)

**Framework Category:** Comparative / Temporal
Maps to encoding multiple **Comparative** or **Temporal** dimensions with independent visual channels.

**Source Type:** Explicit prose

---

### 6. Integrate and Separate Information Simultaneously

**Name:** Integrated Separation

**Definition:** Present information that is connected through content but separated through viewing paths—viewers can follow multiple uncluttered paths through unified data.

**Tufte's Articulation:**
> "The information shown is both integrated and separated: integrated through its connected content, separated in that the eye follows several different and uncluttered paths in looking over the data"

**Examples Referenced:**
- Table-graphic showing government tax collections (15 countries, 1970 vs 1979):
  - Vertical reading: ranks countries by tax percentage
  - Horizontal reading: paired comparisons across years
  - Slope reading: rate of change across countries

**Framework Category:** Comparative / Temporal / Aggregative
Maps to presenting **Ranking**, **Before/After**, and **Deviation** in a unified form.

**Source Type:** Explicit prose

---

### 7. Maximize Data Density

**Name:** Data Density Maximization

**Definition:** Pack the maximum amount of data into the available graphical space, leveraging the eye's high resolution capacity rather than wasting space.

**Tufte's Articulation:**
> "Our eyes can make a remarkable number of distinctions within a small area."

> "The resolving power of the eye enables it to differentiate to 0.1 mm where provoked to do so. Clearly, therefore, conciseness is of the essence and high resolution graphics are a common denominator of cartography."

Introduces formal measure: `data density = number of entries in data matrix / area of data graphic`

**Examples Referenced:**
- U.S. Statistical Abstract typography: 185-276 characters per square inch
- Cartographic scales: 254 distinctions per inch at 0.1mm resolution
- Grid example: 80x80 grid = 25,281 distinct positions per square inch
- New York weather history: 181 numbers per square inch (positive)
- Five-color participation graphic: 0.15 numbers per square inch (negative—"thin indeed")
- JASA style sheet exemplar: 3.8 numbers per square inch (negative—"lightweight")

**Framework Category:** Aggregative / State
Maps to conveying maximum **information density** in minimum space.

**Source Type:** Explicit prose with quantitative definition

---

### 8. Condensation of Sensations

**Name:** Aesthetic Condensation

**Definition:** Achieve pictorial unity through compression—the graphic should function as a complete picture, not a collection of elements.

**Tufte's Articulation:**
Cites Matisse: "I want to reach that state of condensation of sensations which constitutes a picture."

This appears as an epigraph introducing the data density section, suggesting density serves both information and aesthetic purposes.

**Examples Referenced:**
- Implied in all high-density examples

**Framework Category:** Meta-intent (about graphic quality rather than specific content)
This is a design principle rather than a data intent—it concerns how intents are realized rather than what is communicated.

**Source Type:** Inferred from epigraph context

---

## Intents by Source Type

### Explicit (stated directly in prose):
1. Cognitive Transparency (avoid puzzles)
2. Visual Hierarchy via Natural Order
3. Hierarchical Information Architecture
4. Multi-depth Viewing
5. Angular Separation of Data Dimensions
6. Integrated Separation
7. Data Density Maximization

### Inferred (from context, examples, or implication):
8. Aesthetic Condensation (from Matisse epigraph)

---

## Framework Category Mapping Summary

| Intent | Primary Category | Secondary Categories |
|--------|------------------|---------------------|
| Cognitive Transparency | Emphasis | Explanation |
| Visual Hierarchy via Natural Order | Distributional | Comparative |
| Hierarchical Information Architecture | Relational | State |
| Multi-depth Viewing | Aggregative | Distributional |
| Angular Separation | Comparative | Temporal |
| Integrated Separation | Comparative | Temporal, Aggregative |
| Data Density Maximization | Aggregative | State |
| Aesthetic Condensation | (meta-intent) | — |

---

## Limitations from Text-Only Access

### Missing Visual Information

1. **Specific figure layouts**: Cannot verify how described principles manifest in actual graphics
2. **Color examples**: The 16-shade county map, five-color participation chart—cannot assess visual impact
3. **Gray shading comparisons**: Cannot compare galaxy map treatment to alternatives
4. **Table-graphic details**: The government tax collection graphic's exact visual form
5. **Ayres' American divisions display**: Referenced but not describable in detail
6. **Population density dot map**: Cannot see the corridors, landform effects, or "string of pearls" pattern
7. **Grid/resolution examples**: Visual demonstrations of density capacity

### OCR Artifacts

The text contains clear OCR errors:
- "thc name" (likely "the name")
- Various number/letter confusions in data tables
- Fragmented references and citations

### Interpretive Cautions

Without visual access:
- Cannot confirm whether described intents are successfully realized in examples
- Cannot assess whether negative examples (puzzles) are truly as problematic as described
- May miss intents communicated primarily through visual example rather than prose

### Missing Context

Pages 150-160 are mid-chapter; earlier discussion of "multifunctioning graphical elements" would provide additional context for these intents.

---

## Relationship to Framework Categories

Tufte's intents in this section primarily serve **meta-communicative** purposes—they are about how to communicate data rather than specific data types. They map most strongly to:

- **Distributional**: hierarchy, ranking, density
- **Comparative**: before/after, deviation, multi-angle viewing
- **Aggregative**: summary, density, multi-level
- **Relational**: hierarchy, connection

Less represented:
- **Instruction**: no procedural content
- **Temporal**: implicit in before/after comparisons
- **Evidential**: not addressed
- **State**: implicit in all data display

This suggests Tufte's concerns are primarily about **visual encoding quality** rather than specific semantic intents—he is articulating principles for *how* any intent should be realized visually, not *what* intents exist.
