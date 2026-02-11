# Modality Comparison: Multimodal vs Text-Only Discovery

**Date**: 2026-02-10

## Experiment Design

Two independent agents ran equivalent intent discovery prompts against:
- **Multimodal**: `ch1-graphical-excellence.pdf` (40-page PDF with visible graphics)
- **Text-only**: `ch1-graphical-excellence.txt` (pdftotext extraction of same pages)

Both agents read the framework document first, then extracted communicative intents.

---

## Quantitative Results

| Metric | Multimodal | Text-Only |
|--------|------------|-----------|
| Named intents | 15 | 21 |
| Discovered from examples | 6 | — |
| Anti-patterns identified | — | 5 |
| **Total** | **21** | **26** |
| **Token usage** | **~97k** | **~50k** |

**Unexpected finding**: Text-only produced more named intents than multimodal.

**Explanation**: Token usage was nearly 2x for multimodal. Image encoding consumed
context that text-only could use for extraction and analysis.

---

## Intents Found in Both

| Intent | Multimodal Name | Text-Only Name |
|--------|-----------------|----------------|
| Data Revelation | ✓ | ✓ |
| Comparison | Comparison Facilitation | Comparison Encouragement |
| Density | Data Density | Density |
| Coherence | Coherence Making | Coherence |
| Multi-level Detail | ✓ | ✓ (Scale Navigation) |
| Substance Focus | ✓ | ✓ (Attention Direction) |
| Truth-telling | Truth-telling | Data Integrity |
| Efficiency | ✓ | ✓ |
| Multivariate | Multivariate Integration | ✓ |
| Narrative | Temporal Narrative | Narrative (Space-Time Story) |
| Anomaly Detection | ✓ | Anomaly Detection (Outlier Revelation) |
| Causal | Causal Relationship Display | Causal Inquiry |
| Memory Persistence | ✓ | ✓ |
| Purpose | Purpose Clarity | Purpose Declaration |

Core intents overlap substantially — both extracted Tufte's explicit principles.

---

## Intents Unique to Multimodal

These emerged from examining graphics the text-only agent could not see:

| Intent | Description | Why Visual Required |
|--------|-------------|---------------------|
| **Spatial Distribution** | Quantities across geographic space | Demonstrated by maps, not theorized |
| **Flow Visualization** | Quantities moving through space | Minard wine exports — line thickness encodes volume |
| **Uncertainty Communication** | Statistical significance encoding | Cancer map legend distinguishes sig vs non-sig |
| **Reference Baseline Comparison** | Deviation from normal | NYC weather graphic plots against "normal" bands |
| **Dual-scale Integration** | Multiple readings from same position | Train schedules, Voyager data |
| **Progressive Disclosure of Mechanism** | Graphical calculus, output→input | Lambert evaporation derivation |
| **State Transition** | Before/after displays | Bridge collapse diagram |

**Key observation**: These are *technique-level* intents — specific visual moves that achieve
broader purposes. The text-only agent could not discover them because they are demonstrated
rather than articulated.

---

## Intents Unique to Text-Only

| Intent | Description | Why Text Found It |
|--------|-------------|-------------------|
| **Integration** | Connect graphics with verbal descriptions | Explicit prose principle |
| **Precision** | Quantitative accuracy | Part of "clarity, precision, efficiency" triad |
| **Clarity** | Unambiguous communication | Part of same triad |
| **Shape Communication** | Giving form to quantities | From Playfair discussion |
| **Abstraction** | Liberation from geographic coordinates | Historical discussion |
| **Quantitative Testimony** | Graphics as evidence | "Testifies about the data" |
| **Pattern Communication** | Making regularities visible | Inferred from descriptions |

Plus 5 anti-patterns:
- Distortion Avoidance
- Geographic Debiasing
- Data Quality Acknowledgment
- Model Validity
- Design Constancy

**Key observation**: Text-only agent extracted more fine-grained concepts from prose,
possibly because processing capacity wasn't consumed by images.

---

## Qualitative Differences

### Multimodal descriptions are grounded

> "The Anscombe quartet graphics show four dramatically different data patterns
> (linear trend, parabolic curve, perfect line with outlier, vertical stack with
> outlier) that share identical means, variances, correlations, and regression lines."

> "The thinning of the tan band and the plunging black line communicate catastrophe
> more powerfully than any verbal description."

### Text-only descriptions are abstract

> "The Anscombe's quartet example: 'all four of these data sets are described by
> exactly the same linear model... And yet how they differ, as the graphical display
> of the data makes vividly clear'"

> "Minard's graphic has 'brutal eloquence'" (quoting text, no description of visual)

### Text-only explicitly acknowledges limitations

> "Visual examples inaccessible: Tufte's argument relies heavily on showing graphics
> to demonstrate principles... I could extract the *purpose* Tufte attributes to
> these graphics but could not verify whether the graphics achieve those purposes."

> "Potential Additional Intents (glimpsed but uncertain): Temporal Progression,
> Spatial Distribution, Proportional Representation, Directional Flow, Periodicity,
> Trend Revelation"

Note: Several of these "uncertain" intents were confirmed by multimodal analysis.

---

## Hypothesis Assessment

**Original hypothesis**: Multimodal reading will discover demonstrated-but-not-articulated
intents that text-only cannot find.

**Result**: **Partially confirmed, with unexpected nuance.**

### Confirmed aspects

1. Multimodal discovered technique-level intents (Flow Visualization, Dual-scale
   Integration, etc.) that text-only did not find
2. Multimodal descriptions are grounded in specific visual examples
3. Text-only explicitly flagged gaps where visual access would help
4. Some intents text-only marked as "uncertain" were confirmed by multimodal

### Unexpected aspects

1. **Text-only found more total intents** — processing capacity for text extraction
   may have increased when not processing images
2. **Text-only found intents multimodal missed** — Integration, Abstraction,
   Quantitative Testimony were extracted from prose but not from multimodal
3. **Different granularity choices** — text-only separated Clarity/Precision/Efficiency;
   multimodal collapsed them

### Interpretation

The modalities are **complementary** rather than one being strictly superior:

- **Text-only** excels at: Extracting explicit prose articulations, fine-grained
  concept discrimination, comprehensive coverage of stated principles. **Efficiency**:
  ~50k tokens for 26 intents = ~1.9k tokens/intent.

- **Multimodal** excels at: Discovering implicit/demonstrated techniques, grounding
  abstract concepts in specific examples, validating that principles are actually
  achieved. **Cost**: ~97k tokens for 21 intents = ~4.6k tokens/intent (2.4x text-only).

The token cost/benefit suggests **using multimodal selectively** — for validation
and technique-level discovery rather than primary taxonomy extraction.

For intent discovery specifically:
- Use **text extraction** to catalog articulated intents efficiently
- Use **multimodal** to validate, ground, and extend with demonstrated techniques
- The **combination** captures more than either alone

---

## Implications for Tufte Extraction

1. **Text-based extraction is viable** for cataloging Tufte's core principles —
   he articulates his purposes explicitly in prose

2. **Multimodal adds value** for technique-level intents and grounded examples,
   but is not strictly necessary for basic taxonomy work

3. **The visual-textual inversion** (needing to "read aloud" visual content) is
   real but less damaging than feared — Tufte's explicitness compensates

4. **For other visual sources** (Bertin, Few) that may be less self-articulating,
   multimodal access may be more critical

---

## Artifacts

| Source | Output File |
|--------|-------------|
| Multimodal | `tufte-discovery-multimodal.md` |
| Text-only | `tufte-discovery-text-only.md` |
| Comparison | This document |
