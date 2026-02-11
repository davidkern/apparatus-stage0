# Intent Quality Assessment: Four Extraction Methods Compared

**Date**: 2026-02-10
**Sources**: Tufte's "Graphical Excellence" (Chapter 1) processed via four methods
**Purpose**: Evaluate extraction quality to inform catalog strategy

---

## Assessment Criteria

Quality is evaluated along five dimensions:

1. **Specificity**: Is the intent well-defined with clear boundaries, or vague/overlapping?
2. **Groundedness**: Is it supported by concrete evidence/examples, or abstract assertion?
3. **Actionability**: Could a practitioner use this intent to guide presentation design?
4. **Framework fit**: Does it map cleanly to existing categories or extend them coherently?
5. **Distinctiveness**: Is it genuinely different from other intents, or redundant?

---

## Source 1: Full Chapter, Multimodal

**File**: `tufte-discovery-multimodal.md`
**Scope**: Complete Chapter 1 (pp. 1-51)
**Method**: Analysis with access to both prose and visual examples

### Overall Quality Assessment: HIGH

This source produces the most well-grounded intents due to the combination of Tufte's explicit prose statements and visible demonstration through graphics. The multimodal access allows verification that claimed effects actually occur.

### Characteristic Strengths

- **Strong groundedness**: Each intent is supported by specific visual examples (Anscombe's quartet, Minard's Napoleon graphic, cancer mortality maps) that demonstrate the principle in action
- **Rich detail**: Visual access reveals subtleties that text descriptions miss (e.g., the "texture" of clustered galaxies, the "thinning of the tan band" in Napoleon graphic)
- **Discovery of unnamed intents**: Examining graphics reveals communicative purposes Tufte doesn't explicitly name (Flow Visualization, Reference Baseline Comparison, Progressive Disclosure of Mechanism)

### Characteristic Weaknesses

- **Meta-principle inflation**: Some "intents" are actually quality criteria (Efficiency, Memory Persistence, Purpose Clarity) rather than communicative purposes
- **Occasional vagueness**: "Coherence Making" is harder to operationalize than more specific intents
- **Redundancy potential**: Data Revelation / Pattern Discovery / Anomaly Detection have significant overlap

### High-Quality Intent Examples

**Data Revelation** (Excellent)
- Specificity: HIGH - "making visible what is hidden in raw numbers"
- Groundedness: HIGH - Anscombe's quartet provides irrefutable demonstration
- Actionability: HIGH - Clear criterion: does the visualization show something statistics miss?
- Framework fit: HIGH - Maps to Distributional/Comparative
- Distinctiveness: MEDIUM - Overlaps with Pattern Discovery but is more fundamental

**Causal Relationship Display** (Excellent)
- Specificity: HIGH - "presenting variables to invite assessment of cause-and-effect"
- Groundedness: HIGH - Lung cancer/smoking scatterplot, Snow's cholera map
- Actionability: HIGH - Design question: does the layout invite causal inference?
- Framework fit: HIGH - Maps cleanly to Relational
- Distinctiveness: HIGH - Distinct from mere correlation display

### Low-Quality Intent Examples

**Memory Persistence** (Problematic)
- Specificity: LOW - How would one measure "persistence" at design time?
- Groundedness: MEDIUM - Only Playfair quote, no experimental evidence
- Actionability: LOW - What design choices increase memorability?
- Framework fit: LOW - Functions as meta-principle, not categorical intent
- Distinctiveness: LOW - Overlaps with Clarity, Coherence

**Purpose Clarity** (Problematic)
- Specificity: LOW - Tautological (a clear purpose is clear)
- Groundedness: LOW - No demonstration, just assertion
- Actionability: LOW - Too abstract to guide decisions
- Framework fit: LOW - Meta-principle, not intent
- Distinctiveness: LOW - Subsumed by other intents

### Best Intents for Catalog (3)

1. **Causal Relationship Display** - Strong definition, excellent grounding, maps to Relational
2. **Multi-level Detail** - Specific (overview + fine structure), demonstrated by cancer maps, actionable
3. **Anomaly/Outlier Detection** - Concrete (make exceptional cases prominent), Anscombe demonstration, maps to Distributional/Emphasis

### Intents to Discard or Merge

- **Memory Persistence** - Discard as meta-quality, not intent
- **Purpose Clarity** - Discard as tautological
- **Efficiency** - Discard as meta-principle applying to all intents
- **Data Revelation** - Consider as parent category containing Pattern Discovery, Anomaly Detection
- **Coherence Making** - Merge with Aggregative category concept

---

## Source 2: Full Chapter, Text-Only

**File**: `tufte-discovery-text-only.md`
**Scope**: Complete Chapter 1 (pp. 1-51)
**Method**: Analysis from OCR text without visual access

### Overall Quality Assessment: MEDIUM-HIGH

This source captures all explicitly articulated intents but loses verification through visual examples. The analysis is aware of its limitations, producing careful hedging about intents "inferred from descriptions of invisible graphics."

### Characteristic Strengths

- **Prose fidelity**: Captures Tufte's exact language for normative statements
- **Explicit methodology**: Distinguishes intents from prose vs. inferred from descriptions
- **Self-aware limitations**: Documents what cannot be verified
- **Anti-pattern identification**: Captures Tufte's counter-examples (Distortion Avoidance, Geographic Debiasing)

### Characteristic Weaknesses

- **Granularity explosion**: 21 primary intents + 5 anti-patterns is likely over-differentiated
- **Abstract assertions**: Some intents lack concrete grounding (Abstraction, Quantitative Testimony)
- **Inference uncertainty**: Pattern Communication, Shape Communication are "inferred from descriptions" without visual verification
- **Redundancy**: Clarity, Precision, Efficiency appear as separate intents but are really qualities

### High-Quality Intent Examples

**Comparison Encouragement** (Good)
- Specificity: HIGH - "facilitating visual comparison of different pieces of data"
- Groundedness: HIGH - Direct Tufte quote: "encourage the eye to compare different pieces of data"
- Actionability: HIGH - Clear design question: do elements invite comparison?
- Framework fit: HIGH - Maps to Comparative
- Distinctiveness: HIGH - Core intent

**Causal Inquiry** (Good)
- Specificity: HIGH - "enabling assessment of potential causal relationships"
- Groundedness: HIGH - Extended Tufte discussion of relational graphics
- Actionability: HIGH - Does the design invite causal assessment?
- Framework fit: HIGH - Maps to Relational
- Distinctiveness: HIGH - Distinct from mere relationship display

### Low-Quality Intent Examples

**Abstraction (Coordinate Liberation)** (Problematic)
- Specificity: LOW - Historical concept rather than communicative intent
- Groundedness: MEDIUM - Describes historical breakthrough, not ongoing purpose
- Actionability: LOW - Not a design choice, a given of modern graphics
- Framework fit: LOW - Meta-capability, not category
- Distinctiveness: LOW - Background assumption, not active intent

**Quantitative Testimony** (Problematic)
- Specificity: LOW - "evidence that speaks to facts" is vague
- Groundedness: LOW - Only "brutal eloquence" phrase
- Actionability: LOW - How would one design for "testimony"?
- Framework fit: LOW - Overlaps with Evidential category entirely
- Distinctiveness: LOW - Redundant with Data Integrity, Causal Inquiry

**Shape Communication** (Uncertain)
- Specificity: MEDIUM - "conveying overall form or contour of data"
- Groundedness: LOW - Inferred from Playfair quote about "shape given to quantities"
- Actionability: MEDIUM - Could guide time-series design
- Framework fit: MEDIUM - Relates to Distributional
- Distinctiveness: LOW - Overlaps with Data Revelation, Pattern Communication

### Best Intents for Catalog (3)

1. **Comparison Encouragement** - Well-grounded, actionable, maps to Comparative
2. **Multivariate Integration** - Explicit Tufte principle, demonstrated across many examples
3. **Anomaly Detection (Outlier Revelation)** - Specific, grounded in scatterplot examples, actionable

### Intents to Discard or Merge

- **Abstraction** - Discard as historical context, not active intent
- **Quantitative Testimony** - Merge into Evidential category
- **Clarity/Precision/Efficiency** - Discard as meta-qualities, not intents
- **Shape Communication** - Merge into Pattern Communication
- **Purpose Declaration** - Discard as meta-principle

---

## Source 3: Focused Section, Multimodal

**File**: `tufte-late-multimodal.md`
**Scope**: Pages 39-51 only (small multiples, relational graphics, summary principles)
**Method**: Analysis with access to both prose and visual examples

### Overall Quality Assessment: HIGH

The focused scope produces more refined intents with less redundancy. The late section of the chapter contains Tufte's most sophisticated examples (Phillips curve small multiples, Lambert's graphical calculus, glyphic displays), yielding intents not found in broader analyses.

### Characteristic Strengths

- **Novel intents**: Discovers intents absent from full-chapter analysis (Graphical Derivation, Glyphic Data Display, Theory Testing/Falsification)
- **Technical precision**: Intents like "Small Multiple Comparison" have clear operational definitions
- **Visual verification**: Each intent is grounded in specific visual examples
- **Medium-specificity awareness**: Notes intents that are "inherently visual and resist verbalization"

### Characteristic Weaknesses

- **Design Constancy confusion**: May be a technique enabling comparison rather than a separate intent
- **Narrow scope**: Misses earlier intents (Data Revelation, Spatial Distribution) from pages 1-38
- **Some meta-principles**: Cognitive Economy, Efficiency Maximization function as qualities not intents

### High-Quality Intent Examples

**Small Multiple Comparison** (Excellent)
- Specificity: HIGH - "holding design constant and varying only the data"
- Groundedness: HIGH - Air pollution display (12 panels), Phillips curve (9 countries)
- Actionability: HIGH - Clear design recipe: repeat structure, change only data
- Framework fit: HIGH - Maps to Comparative
- Distinctiveness: HIGH - Specific mechanism for comparison

**Graphical Derivation / Visual Calculus** (Excellent)
- Specificity: HIGH - "using graphics to perform mathematical operations visually"
- Groundedness: HIGH - Lambert's evaporation derivation shows tangent-taking and re-plotting
- Actionability: HIGH - Use one graphic's output as another's input
- Framework fit: HIGH - Maps to Explanation
- Distinctiveness: HIGH - Novel intent not found elsewhere

**Theory Testing / Falsification Display** (Excellent)
- Specificity: HIGH - "presenting data that allows evaluation of theoretical predictions"
- Groundedness: HIGH - Phillips curve showing "collapse of what was once thought to be an inverse relationship"
- Actionability: HIGH - Design question: can viewer assess theory-evidence match?
- Framework fit: HIGH - Maps to Evidential
- Distinctiveness: HIGH - Distinct from mere relationship display

### Low-Quality Intent Examples

**Design Constancy** (Problematic)
- Specificity: MEDIUM - "maintaining identical visual encoding across displays"
- Groundedness: HIGH - Demonstrated in small multiples
- Actionability: HIGH - Keep design constant
- Framework fit: LOW - Technique, not intent
- Distinctiveness: LOW - Enabler of Small Multiple Comparison, not separate

**Cognitive Economy** (Problematic)
- Specificity: LOW - "reducing mental effort required to extract meaning"
- Groundedness: MEDIUM - Claimed benefit of small multiples
- Actionability: LOW - Too abstract to guide specific choices
- Framework fit: LOW - Meta-quality
- Distinctiveness: LOW - Consequence of good design, not intent

### Best Intents for Catalog (3)

1. **Small Multiple Comparison** - Precise definition, strong visual grounding, high actionability
2. **Graphical Derivation** - Novel intent, specific mechanism, maps to Explanation
3. **Meta-Analysis Display / Literature Synthesis** - Important for scientific communication, maps to Evidential/Aggregative

### Intents to Discard or Merge

- **Design Constancy** - Merge as technique into Small Multiple Comparison
- **Cognitive Economy** - Discard as meta-quality
- **Efficiency Maximization** - Discard as meta-principle
- **Clarity/Precision** - Discard as meta-qualities
- **Glyphic Data Display** - Consider as technique rather than intent, or subsume under Relational

---

## Source 4: Focused Section, Text-Only

**File**: `tufte-late-text-only.md`
**Scope**: Pages 39-49 only
**Method**: Analysis from OCR text without visual access

### Overall Quality Assessment: MEDIUM

The narrower scope reduces redundancy compared to full-chapter text-only, but visual absence is particularly costly for this section because the late examples (Lambert's calculus, dog faces, pine seedlings) are the most visually sophisticated.

### Characteristic Strengths

- **Focused extraction**: 10 intents vs. 21 from full-chapter text-only
- **Self-aware limitations**: Explicitly documents "What Could Not Be Extracted"
- **Explicit principles captured**: Tufte's five summary principles fully preserved
- **Causal intent well-articulated**: Direct quotes about "imploring the viewer to assess causal relationship"

### Characteristic Weaknesses

- **Visual complexity unassessable**: Cannot evaluate whether air pollution display achieves claimed 28,800-reading legibility
- **Novel forms underspecified**: Data-as-Mark, Graphical Derivation lack visual verification
- **Some intents vague**: "Multi-Dimensional Temporal-Spatial Narrative" is long and unclear
- **Historical content over-extracted**: "Physical-to-Abstract Transition Justification" is context, not intent

### High-Quality Intent Examples

**Causal Relationship Assessment** (Good)
- Specificity: HIGH - "inviting viewer to assess whether one variable causes another"
- Groundedness: HIGH - Extended Tufte quote about relational graphics
- Actionability: HIGH - Design question: does layout invite causal assessment?
- Framework fit: HIGH - Maps to Relational
- Distinctiveness: HIGH - Core intent

**Cross-Study Synthesis** (Good)
- Specificity: HIGH - "organizing findings from multiple independent studies"
- Groundedness: HIGH - Thermal conductivity compilation described in detail
- Actionability: HIGH - Show multiple studies on single display, identify sources
- Framework fit: HIGH - Maps to Aggregative/Evidential
- Distinctiveness: HIGH - Important for scientific communication

### Low-Quality Intent Examples

**Physical-to-Abstract Transition Justification** (Problematic)
- Specificity: LOW - Historical argument about representation validity
- Groundedness: MEDIUM - Playfair quotes preserved but not demonstrative
- Actionability: LOW - Not a design choice
- Framework fit: LOW - Historical context, not category
- Distinctiveness: LOW - Background assumption

**Multi-Dimensional Temporal-Spatial Narrative** (Problematic)
- Specificity: LOW - Name too complex, boundaries unclear
- Groundedness: LOW - Relies on unseen air pollution display
- Actionability: MEDIUM - Could guide complex displays
- Framework fit: MEDIUM - Extends Temporal
- Distinctiveness: MEDIUM - May overlap with Space-Time Integration

### Best Intents for Catalog (2)

1. **Causal Relationship Assessment** - Well-articulated from Tufte's prose
2. **Cross-Study Synthesis** - Specific, important for scientific communication

### Intents to Discard or Merge

- **Physical-to-Abstract Transition Justification** - Discard as historical context
- **High-Density Information Efficiency** - Discard as meta-principle
- **Multi-Dimensional Temporal-Spatial Narrative** - Merge with Space-Time Integration or Temporal Narrative

---

## Comparative Analysis

### Quality Rankings by Dimension

| Dimension | Best Source | Reason |
|-----------|-------------|--------|
| Specificity | Focused-Multimodal | Narrower scope produces sharper definitions |
| Groundedness | Full-Multimodal | More examples, visual verification |
| Actionability | Focused-Multimodal | Technical precision enables implementation |
| Framework fit | Full-Multimodal | Broader coverage maps more categories |
| Distinctiveness | Focused-Multimodal | Less redundancy due to focused scope |

### Intent Yield by Source

| Source | Total Intents | High Quality | Medium | Low/Discard |
|--------|---------------|--------------|--------|-------------|
| Full-Multimodal | 15 primary + 6 discovered | 8 | 4 | 3 |
| Full-Text-Only | 21 primary + 5 anti-patterns | 6 | 8 | 7 |
| Focused-Multimodal | 15 (9 prose + 6 visual) | 9 | 3 | 3 |
| Focused-Text-Only | 10 primary | 4 | 3 | 3 |

### Unique High-Quality Intents by Source

**Full-Multimodal only**:
- Flow Visualization (from Minard wine export)
- Reference Baseline Comparison (from NYC weather)
- Uncertainty Communication (from cancer map legends)

**Focused-Multimodal only**:
- Graphical Derivation / Visual Calculus
- Theory Testing / Falsification Display
- Meta-Analysis Display / Literature Synthesis
- Glyphic Data Display / Phenomenological Demonstration

**Text-Only sources**: No unique high-quality intents; text-only captures subset of multimodal

---

## Recommendations for Extraction Strategy

### Finding 1: Multimodal Extraction is Essential

Text-only extraction captures Tufte's explicit prose statements but misses:
- Intents demonstrated visually but not named verbally
- Verification that claimed effects actually occur
- Subtle variants visible only through examples
- Medium-specific intents that "resist verbalization"

**Recommendation**: Always prefer multimodal extraction for visual sources. Text-only extraction should be used only when visual access is impossible, with explicit documentation of limitations.

### Finding 2: Focused Scope Reduces Redundancy

Full-chapter extraction produces more intents but also more:
- Redundancy (Data Revelation / Pattern Discovery / Anomaly Detection overlap)
- Meta-principles misidentified as intents (Efficiency, Memory Persistence)
- Vague intents without clear boundaries (Coherence Making)

Focused extraction produces:
- Sharper definitions with clearer boundaries
- Novel intents from sophisticated examples
- Better distinctiveness between intents

**Recommendation**: Prefer focused extraction on specific sections/examples, then consolidate across sections. This is preferable to single-pass full-document extraction.

### Finding 3: Meta-Principles Must Be Filtered

All sources extract meta-qualities as if they were intents:
- Clarity, Precision, Efficiency (qualities of good execution)
- Memory Persistence, Cognitive Economy (desired effects)
- Purpose Clarity (tautological)

**Recommendation**: Establish filtering criteria: an intent must be a *communicative purpose* that guides design choices, not a quality that results from good design. Questions to ask:
- What specific design choice does this intent guide?
- Can a visualization succeed at one intent while failing at this?
- Is this something the visualization *does* or something it *is*?

### Finding 4: Consolidation Requires Intent Hierarchy

Some intents are genuinely distinct:
- Causal Relationship Display vs. Comparison Facilitation
- Small Multiple Comparison vs. Multivariate Integration

Others are hierarchical:
- Data Revelation contains Anomaly Detection, Pattern Discovery
- Comparison Facilitation contains Before/After, Cross-category

**Recommendation**: Develop explicit containment relationships during consolidation. The framework supports this ("Procedure contains Step"), and discovered intents should use it.

### Finding 5: Novel Intents Come from Close Visual Reading

The most valuable discoveries came from examining graphics closely:
- Graphical Derivation (Lambert's calculus)
- Glyphic Data Display (dog faces, pine seedlings)
- Theory Testing (Phillips curve trajectories)
- Flow Visualization (Minard wine export)

These were not named by Tufte but are clearly present in his examples.

**Recommendation**: Explicitly allocate time for "visual discovery" separate from prose extraction. Ask: "What is this graphic achieving that Tufte doesn't explicitly discuss?"

---

## Consolidated Intent Recommendations for Catalog

Based on this assessment, the following intents are recommended for catalog inclusion:

### Tier 1: High Confidence (strong groundedness, clear actionability)

1. **Causal Relationship Display** - Relational category
2. **Small Multiple Comparison** - Comparative category
3. **Multi-level Detail** - Distributional/State category
4. **Anomaly/Outlier Detection** - Distributional/Emphasis category
5. **Comparison Facilitation** - Comparative category
6. **Multivariate Integration** - Relational category

### Tier 2: High Value, Needs Refinement

7. **Graphical Derivation / Visual Calculus** - Explanation category (novel, needs definition work)
8. **Meta-Analysis Display** - Evidential/Aggregative category (important for scientific communication)
9. **Theory Testing / Falsification Display** - Evidential category (may be special case of Causal)
10. **Space-Time Integration** - Temporal category (extends basic time-series)

### Tier 3: Consider Merging

11. **Data Revelation** - Consider as parent category, not separate intent
12. **Flow Visualization** - May be technique under Distributional or Relational
13. **Glyphic Data Display** - May be technique under Relational

### Do Not Include

- Memory Persistence (meta-quality)
- Efficiency (meta-principle)
- Clarity/Precision (meta-qualities)
- Purpose Clarity (tautological)
- Abstraction/Coordinate Liberation (historical context)
- Physical-to-Abstract Justification (historical context)
- Cognitive Economy (desired effect, not intent)

---

## Methodology Implications

This assessment suggests a refined extraction methodology:

1. **Section-by-section multimodal extraction** rather than single-pass
2. **Explicit prose/visual separation** during extraction
3. **Intent vs. meta-quality filtering** applied during extraction
4. **Visual discovery phase** for unnamed intents
5. **Consolidation phase** with hierarchical relationship identification
6. **Framework mapping verification** before catalog addition

The optimal process appears to be:
```
Source Material
    |
    v
Section-by-Section Multimodal Extraction
    |
    v
Prose Intent Extraction + Visual Intent Discovery (parallel)
    |
    v
Meta-quality Filtering
    |
    v
Cross-section Consolidation (identify redundancy, hierarchy)
    |
    v
Framework Mapping + Gap Identification
    |
    v
Catalog Addition
```

This is more labor-intensive than single-pass extraction but produces higher-quality, more actionable intents with less redundancy.
