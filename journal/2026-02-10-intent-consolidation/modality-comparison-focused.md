# Focused Section Comparison: Multimodal vs Text-Only (11 pages)

**Date**: 2026-02-10

## Experiment Design

Following the full-chapter comparison (40 pages), we ran a focused experiment on pages 30-40 of the extract (original pp. 39-49) — the late section of Chapter 1 containing complex examples that may have received less attention under context pressure.

| Parameter | Full Chapter | Focused Section |
|-----------|--------------|-----------------|
| Pages | 40 | 11 |
| Text lines | 3,682 | 559 |
| Ratio | 1.0x | 0.27x |

---

## Quantitative Results

| Metric | Multimodal | Text-Only |
|--------|------------|-----------|
| Named intents | 15 | 10 |
| From visual examples | 6 | — |
| Visual-only discovered | 5 | — |
| **Total** | **20** | **10** |

### Yield Per Page

| Condition | Full Chapter | Focused Section | Change |
|-----------|--------------|-----------------|--------|
| Multimodal | 0.53/page (21/40) | **1.82/page** (20/11) | **+244%** |
| Text-only | 0.65/page (26/40) | 0.91/page (10/11) | +40% |

**Key finding**: Multimodal yield increased dramatically (+244%) with smaller page count.
Text-only yield increased modestly (+40%).

---

## Interpretation

### Hypothesis confirmed: Context pressure affected multimodal more

The full chapter consumed ~97k tokens for multimodal vs ~50k for text-only.
With 11 pages instead of 40, multimodal could allocate more context to analysis.

The dramatic yield improvement for multimodal (1.82 vs 0.53 intents/page) suggests:
1. Image encoding consumes significant context
2. With fewer images to encode, more capacity remains for extraction
3. The late section's complex examples benefit from sustained attention

### Text-only improvement was modest

Text-only went from 0.65 to 0.91 intents/page — a 40% improvement.
This suggests text processing is less sensitive to document length,
but still benefits somewhat from focused attention.

### Multimodal found 2x the intents on same material

On the same 11 pages, multimodal discovered 20 intents vs text-only's 10.
This ratio (2:1) is much stronger than the full chapter ratio (21:26 or 0.8:1).

---

## Qualitative Comparison

### Intents Found by Both

| Multimodal | Text-Only |
|------------|-----------|
| Small Multiple Comparison | Small Multiple Pattern Recognition |
| Causal Implication | Causal Relationship Assessment |
| Abstract Variable Relationship | Relational Abstraction |
| Multivariate Encoding | Multivariate Comparison |
| Theory Testing | Theory-Evidence Confrontation |
| Meta-Analysis Display | Cross-Study Synthesis |
| Efficiency Maximization | High-Density Information Efficiency |
| Space-Time Integration | Multi-Dimensional Temporal-Spatial Narrative |
| Glyphic Data Display | Data-as-Mark Representation |

Core intents overlap — both extracted Tufte's explicit principles.

### Unique to Multimodal (11 intents)

1. **Design Constancy** — holding visual encoding constant
2. **Cognitive Economy** — learned structure reduces effort
3. **Graphical Derivation / Visual Calculus** — graphics as analytical tools
4. **Clarity** — immediate comprehensibility
5. **Precision** — accurate representation
6. **Multivariate Display** — multiple variables together
7. **Trajectory Tracking** — connected points showing paths
8. **Literature Disagreement Display** — spread showing uncertainty
9. **Reference Curve Comparison** — data vs. recommended values
10. **Proportional Comparison** — quantities in expected proportion
11. **Phenomenological Demonstration** — making phenomena visible

### Unique to Text-Only (1 intent)

1. **Physical-to-Abstract Transition Justification** — explaining why space represents quantity

---

## Visual-Only Discoveries (Multimodal)

These 5 intents emerged only from examining graphics:

| Intent | What the visual revealed |
|--------|-------------------------|
| **Trajectory Tracking** | Phillips curve year-labels trace paths through inflation-unemployment space |
| **Literature Disagreement Display** | Copper conductivity spread shows scientific uncertainty visually |
| **Reference Curve Comparison** | "Recommended" line provides baseline for comparison |
| **Proportional Comparison** | Playfair's slope direction shows tax burden relative to population |
| **Phenomenological Demonstration** | Dog faces and seedlings make phenomena visible, not just measured |

The text-only agent noted limitations in exactly these areas:
> "The Lorenz dog faces and pine seedling photographs would demonstrate a radically
> different approach to marks--the emotional and evidential impact requires visual inspection."

---

## Implications

### For extraction strategy

1. **Smaller chunks improve multimodal yield** — 11 pages may be near optimal
2. **Multimodal excels when given adequate context** — the 2:1 intent ratio on focused material is substantial
3. **Text-only is more robust to document size** — consistent ~0.7-0.9 intents/page regardless of length
4. **Chunking strategy**: For visual sources, extract 10-15 page sections and process separately

### For the modality tradeoff

| Scenario | Recommended Approach |
|----------|---------------------|
| Large document, need efficiency | Text extraction, single pass |
| Dense visual content, quality matters | Multimodal on 10-15 page chunks |
| Validation of text-extracted intents | Multimodal spot-check |
| Technique-level discovery | Multimodal required |

### For Tufte specifically

The late section (pp. 39-49) is particularly rich because it contains:
- Small multiples theory and examples
- The scatterplot as "greatest of all graphical designs"
- Lambert's graphical calculus
- Glyphic displays (dog faces, seedlings)
- The meta-analysis compilation technique

Processing this section with multimodal attention revealed intents the full-chapter pass missed.

---

## Recommendations for Future Discovery

1. **Segment visual sources into ~10-15 page chunks**
2. **Run multimodal on each chunk independently**
3. **Use text extraction for comprehensive prose coverage**
4. **Merge results, noting which intents came from which modality**
5. **Token budget**: ~20-30k per chunk is likely sustainable for quality multimodal extraction

---

## Artifacts

| Source | Output File |
|--------|-------------|
| Focused multimodal | `tufte-late-multimodal.md` |
| Focused text-only | `tufte-late-text-only.md` |
| Comparison | This document |
