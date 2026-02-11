# Intent Consolidation

Continuing the intent discovery work from yesterday. Goal: reduce ~140 discovered
intents and ~30 proposed categories to a coherent taxonomy.

## Research space note

Added `labtools/` — a Rust project in the research repo. The git-hooks inherited
from apparatus were complaining about missing Cargo.toml, so this provides a place
for any research-space-specific utilities we might need. No immediate plans for it.

## Consolidation approach

Yesterday's discovery pass produced intents from 6 source traditions:

| Source | Intents | Proposed Categories |
|--------|---------|---------------------|
| Aristotle's Rhetoric | 17 | 4 |
| Instructional Design | 26 | 7 |
| Accessibility | 18 | 5 |
| Scientific Writing | 25+ | 7 |
| Narrative | 30+ | 8 sub-groups |
| Conversation Analysis | 25+ | 6 |

The work today is synthesis: finding the structure that organizes these discoveries.

---

## Artifacts

| # | Type | File | Summary |
|---|------|------|---------|
| 001 | Validation | [validation-001-initial-discovery.md](2026-02-10-intent-consolidation/validation-001-initial-discovery.md) | Holdback validation of initial 6-source discovery pass |
| 002 | Prompts | [discovery-prompts.md](2026-02-10-intent-consolidation/discovery-prompts.md) | Recorded prompts for discovery passes |
| 003 | Discovery | [legal-language.md](/work/apparatus/catalog/intents/discovery/legal-language.md) | Legal language: formalized general-purpose intents |
| 004 | Validation | [validation-002-legal-language.md](2026-02-10-intent-consolidation/validation-002-legal-language.md) | Holdback validation after legal language discovery |
| 005 | Analysis | [tufte-structural-analysis.md](2026-02-10-intent-consolidation/tufte-structural-analysis.md) | Tufte VDQI structure analysis for extraction strategy |
| 006 | Note | [modality-comparison-note.md](2026-02-10-intent-consolidation/modality-comparison-note.md) | Methodological note on multimodal vs text-only comparison |
| 007 | Discovery | [tufte-discovery-multimodal.md](2026-02-10-intent-consolidation/tufte-discovery-multimodal.md) | Tufte Ch.1 intents via multimodal PDF |
| 008 | Discovery | [tufte-discovery-text-only.md](2026-02-10-intent-consolidation/tufte-discovery-text-only.md) | Tufte Ch.1 intents via text extraction |
| 009 | Analysis | [modality-comparison-results.md](2026-02-10-intent-consolidation/modality-comparison-results.md) | Controlled comparison of modality approaches |
| 010 | Discovery | [tufte-late-multimodal.md](2026-02-10-intent-consolidation/tufte-late-multimodal.md) | Tufte late section (11pp) via multimodal |
| 011 | Discovery | [tufte-late-text-only.md](2026-02-10-intent-consolidation/tufte-late-text-only.md) | Tufte late section (11pp) via text |
| 012 | Analysis | [modality-comparison-focused.md](2026-02-10-intent-consolidation/modality-comparison-focused.md) | Focused section comparison (11pp vs 40pp) |
| 013 | Analysis | [intent-quality-assessment.md](2026-02-10-intent-consolidation/intent-quality-assessment.md) | Quality assessment across four extraction methods |
| 014 | Methodology | [/work/apparatus-research/methodology/multimodal-chunked-extraction.md](/work/apparatus-research/methodology/multimodal-chunked-extraction.md) | Reusable multimodal extraction methodology |
| 015 | Extraction | [/work/apparatus-research/research/intent-extraction/tufte/](/work/apparatus-research/research/intent-extraction/tufte/) | Full Tufte extraction (24 files, 7.5k lines) |

---

## Validation 001: Initial Discovery Pass

Validated the discovery against two holdback sets:
- 24 Auditory Forms (Research 012)
- ~40 Presently Intents (presently design)

**Key finding**: The discovery is biased toward human-to-human communication.

| Domain | Coverage |
|--------|----------|
| Evidential | Good |
| Instructional | Good |
| Social/interpersonal | Good |
| Narrative | Good |
| Persuasive | Good |
| **Data presentation** | **Poor** |
| **System output** | **Poor** |
| **Basic speech acts** | **Missing** |

The gap makes sense: source traditions (rhetoric, instruction, storytelling,
conversation) are about humans communicating with humans. Apparatus communicates
about machine state and data — the presently intents for Temporal, Distributional,
Comparative, and Aggregative categories don't appear in human communication literature.

**Next step**: Run additional discovery against data visualization literature before
attempting taxonomy consolidation.

---

## Discovery 007: Legal Language

Hypothesis: Legal language has formalized general communicative purposes that exist
informally but unnamed in everyday communication.

**Result**: Strongly confirmed. Legal language surfaced several important structures:

| Category | Key Intents | Contribution |
|----------|-------------|--------------|
| **Deontic** | Obligation, Permission, Prohibition, Entitlement | The shall/may/must distinction formalizes normative modality |
| **Conditionality** | Condition-Precedent, Condition-Subsequent, Exception, Override | Temporal-normative hybrids |
| **Commitment** | Representation, Warranty, Covenant | Types of promises by temporal reference and accountability |
| **Scope** | Limitation, Definition, Enumeration | Boundary and list semantics (exhaustive vs. illustrative) |
| **Effort-Level** | Best-Efforts, Reasonable-Efforts, Good-Faith | Gradations of performance standard |
| **Liability** | Indemnification, Disclaimer, Exclusion | Risk allocation |

**Key insight**: Several of these may be *dimensions* rather than categories:
- Deontic modality (obligation/permission/prohibition) could qualify any instruction
- Effort-level could modify any obligation
- Enumeration semantics (exhaustive/illustrative) could apply to any list

**Cross-validation with RFC 2119**: Technical specifications already use legal-style
deontic modality (MUST/SHOULD/MAY). This suggests the formal vocabulary addresses
a real need.

### Validation Results

| Metric | Before Legal | After Legal | Delta |
|--------|--------------|-------------|-------|
| Auditory forms (direct) | 2 | 4 | +2 |
| Auditory forms (related) | 13 | 14 | +1 |
| Presently intents (direct) | 9 | 11 | +2 |
| Presently intents (related) | 11 | 15 | +4 |

Legal language filled *normative* gaps (what's required, permitted, promised) but
not *data presentation* gaps (Distributional, Aggregative still at zero coverage).

**Remaining gaps**: Distributional (100% uncovered), Aggregative (100% uncovered),
Temporal data (Sequence, Timeline, Trend), Comparative (Diff), System state (Health,
Inventory, Configuration).

---

## Methodology: Multimodal Chunked Extraction

Experimentation with Tufte extraction revealed systematic differences between multimodal
and text-only processing. Key findings:

| Finding | Implication |
|---------|-------------|
| Multimodal yield drops ~3x on large documents | Chunk into 10-15 pages |
| Text-only finds no unique high-quality items | Multimodal essential for visual sources |
| Focused sections find items full-pass misses | Multiple passes > single pass |
| ~60% of items need quality filtering | Apply domain-specific filter |

Codified as reusable methodology: `/work/apparatus-research/methodology/multimodal-chunked-extraction.md`

---

## Tufte Full Extraction

Applied the multimodal chunked methodology to extract intents from the complete
Tufte "Visual Display of Quantitative Information" (191 pages).

**Structure**: 12 chunks (~15pp each) × 2 modalities = 24 agent tasks

**Results**:
- 7,556 lines of extraction output in `/work/apparatus-research/research/intent-extraction/tufte/chunks/`
- ~170 multimodal intents, ~130 text-only intents (significant overlap expected)
- All 6 phases complete

**Next**: Consolidation pass to merge, deduplicate, filter, then write to catalog.

See `/work/apparatus-research/research/intent-extraction/tufte/extraction-plan.md` for details and prompts.

### Notes for consolidation

**Watch for during merge:**
- Many intents will have different names for the same concept across chunks (e.g., "Data Revelation" vs "Show the Data" vs "Pattern Discovery"). The multimodal extractions tend to use more specific names grounded in examples; text-only uses Tufte's exact prose phrases. Prefer the more specific/actionable name.

- Several agents flagged that Tufte's "principles" are often meta-qualities (Efficiency, Clarity, Precision) rather than intents. The quality assessment recommended filtering these out. Apply the test: "What specific design choice does this guide?"

- The later chapters (7-9) produced more novel technique-level intents (Graphical Derivation, Small Multiples, Multifunctioning Elements) that the earlier chapters' broader principles didn't capture. These are valuable additions to the catalog.

- Multiple agents suggested new framework categories: Integrity/Fidelity (cross-cutting concern), Mnemonic/Retention, Iconic/Mimetic Representation. Worth considering whether these are categories or dimensions.

**Interesting observation:**
The visual-only discoveries clustered around *techniques* rather than *purposes* — things like "trajectory tracking," "reference baseline comparison," "dual-scale integration." These might be better cataloged as implementation patterns that *achieve* intents rather than as intents themselves. Or they might reveal a granularity distinction: high-level intents (Compare, Show Distribution) vs. technique-level intents (Small Multiple Comparison, Range-Frame Display).

**Open question:**
How does Tufte's work complement vs. overlap with the existing 6-source discovery? The legal language pass filled normative gaps (obligation, permission). Tufte should fill data presentation gaps (Distributional, Aggregative, Comparative). Validate this expectation during consolidation by checking coverage against the holdback sets.

---

## Tufte Consolidation

Ran consolidation pass on the 24 extraction files. Results:

| Metric | Value |
|--------|-------|
| Input entries | 312 |
| After dedup | 47 |
| After quality filter | 31 |
| Filtered out | 16 |

**Consolidation file**: `/work/apparatus-research/research/intent-extraction/tufte/consolidation.md`

### Validation Results

Validated against presently intents holdback. **Hypothesis confirmed**: Tufte fills data presentation gaps.

| Category | Before (post-legal) | After (post-Tufte) | Delta |
|----------|---------------------|-------------------|-------|
| Distributional | 0 direct | 5 direct | **+5** |
| Temporal | 1 direct | 5 direct | **+4** |
| Comparative | 0 direct | 3 direct | **+3** |
| Total direct hits | 11 | 25 | **+14** |

Distributional went from **0% to 100%** coverage.

### Remaining Gaps

| Gap | Reason | Source Needed |
|-----|--------|---------------|
| Network/Path | Tufte covers statistical graphics, not networks | Graph drawing literature |
| Health/Inventory/Configuration | Tufte is analytical, not operational | Dashboard/monitoring guides |
| Overlap (temporal) | Partial via Small Multiples | Possibly Gantt/timeline literature |

### Technique-Level Intents

Tufte produced several *technique-level* intents more specific than category-level:
- Small Multiples
- Range-Frame
- Show Marginal Distributions
- Sequential Variable Tracking

This suggests the catalog may have multiple granularity levels (purpose → technique).

---

## Next Steps

1. **Write consolidated Tufte intents to catalog** — The 31 intents are ready for `/work/apparatus/catalog/intents/`
2. **Address remaining gaps** if desired (Network, System output) with targeted sources
3. **Consider granularity structure** for catalog (parent-child intent relationships)

---

