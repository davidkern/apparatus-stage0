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

## Research Material Reorganization

Realized the discovery files in `apparatus/catalog/intents/discovery/` were research
material polluting the apparatus repo's git history. Reorganized into a proper
research structure.

### New Structure

```
research/presentation-catalog/
├── README.md                    # Conventions documentation
├── extracts/                    # Fixed-point source extractions
│   ├── <source>/                # One per source (8 total)
│   │   ├── _meta.md             # Source metadata
│   │   ├── _original/           # Backup of originals
│   │   ├── _stash/              # Doesn't-fit-yet files
│   │   └── <item>.md            # Leaf values with frontmatter
│   └── tufte/                   # Special structure for chunked extraction
│       ├── ch1a-multimodal/
│       ├── ch1a-text-only/
│       └── ...
├── _dimension/                  # Symlink-based organization (to be built)
└── _stash/                      # Process scripts
```

### Key Design Decisions

1. **Underscore prefix = system namespace** — `_meta.md`, `_original/`, `_stash/`,
   `_dimension/` are metadata/organization. Everything else is content.

2. **Leaf files are fixed points** — Each extracted item is its own file with
   frontmatter tracking provenance. These don't move.

3. **Organization via symlinks** — `_dimension/<dim>/<category>/` contains symlinks
   to leaf files. Multiple organizations can coexist. Reorganization is non-destructive.

4. **Self-similar structure** — Each source can have its own local `_dimension/`
   for internal organization before cross-source consolidation.

### Inventory

| Source | Items |
|--------|-------|
| accessibility | 21 |
| aristotle-rhetoric | 19 |
| conversation-analysis | 26 |
| instructional-design | 25 |
| legal-language | 24 |
| narrative | 35 |
| scientific-writing | 25 |
| tufte (24 chunks) | ~400 |
| **Total** | **~575** |

### Next: Local Organization

Work at source level first — build `_dimension/intent/<category>/` within each
source to reveal its natural structure before attempting cross-source consolidation.

---

## Data Quality Assessment

Attempted to build local `_dimension/` organization for aristotle-rhetoric. This
revealed structural issues that led to a broader assessment.

### Structural Inconsistency

Each extraction agent invented its own output structure:

- Some used `## New Intent Category: X` consistently
- Some used `## X Intents: Y` as sub-groups
- Some mixed both in semantically confusing ways (e.g., "Argumentative" as sub-group of "Emotional")

Automated parsing cannot reliably extract consistent structure across sources.

### Depth Assessment

| Source | Items | Words | Source Type |
|--------|-------|-------|-------------|
| accessibility | 21 | 3,395 | Web summaries |
| aristotle-rhetoric | 19 | 2,260 | Web summaries |
| conversation-analysis | 26 | 3,950 | Web summaries |
| instructional-design | 25 | 3,603 | Web summaries |
| legal-language | 24 | 5,703 | Web summaries |
| narrative | 35 | 4,218 | Web summaries |
| scientific-writing | 25 | 4,576 | Web summaries |
| **tufte** | **303** | **56,499** | **Primary text** |

Tufte (from actual book pages) has 2x the words of all other sources combined.
The web summary extractions are shallow skims of secondary sources.

### What the Research Actually Showed

The original research questioned whether presentation hierarchies exist within
different modalities. They do, and a working hierarchy was created that demonstrated
an Intent dimension exists.

Survey-level investigation showed that different domains have Intent vocabulary,
and overlaps between domains provided evidence the framing is correct.

**This was survey work to validate the framework exists — not comprehensive
extraction to build the category system from.**

### The Mismatch

We attempted to build a comprehensive categorization framework on top of survey
data. Survey data validates "there's something here" but doesn't provide the
depth needed for "here's the complete taxonomy."

### Options Going Forward

1. **Accept survey-level scope** — Use extracts to validate framework direction,
   not as source of truth for categories. Build categories from first principles,
   use extracts as sanity checks.

2. **Deep extraction from primary sources** — Do Tufte-quality extraction on
   key sources (actual Aristotle text, actual Mayer/Gagné papers, etc.). This is
   significant work.

3. **Hybrid** — Use Tufte as the deep foundation (it's already done), supplement
   with targeted deep dives on specific gaps.

---

## Reframe: Recipes Over Taxonomy

### The Insight

Examined what the Tufte data actually contains. The raw extractions have
technique-level detail:

```
Specific examples:
- Erased box plots: vertical lines encode range, dots encode median (p. 125)
- Quartile plot: "ten extra numbers (min, max, quartiles, median)"
```

The consolidation kept the "why" (intent categories) but lost the "what"
(specific techniques with their components). For presently, we need the "what."

### Taxonomy vs Recipe Book

**Taxonomy:** "What are all the categories of intent?"
- Comprehensive, abstract, needs to be complete
- Requires full attention to huge problem space

**Recipe Book:** "How do you render this specific thing?"
- Practical, concrete, can grow incrementally
- Directly actionable for presently

A recipe specifies:
- Intent (what to communicate)
- Technique (how to achieve it)
- Components (what elements, what they encode)
- Parameters (what varies)
- Forms (visual, typographic, auditory renderings)

### Decision

Build recipe book instead of taxonomy. Extract recipes from foundational
primary sources:

1. **Tufte's three books** — core data presentation vocabulary
2. **Classical Rhetoric** (actual texts) — argument and oral presentation
3. **One other** — TBD (typography, instructional design, or speech acts)

Implementation-driven: pick recipes apparatus needs, extract, implement, repeat.
Taxonomy emerges later from recipe collection if needed.

See `research/presentation-catalog/recipes/README.md` for full writeup.

---

---

## Aristotle Rhetoric Extraction

Downloaded Kennedy's translation of Aristotle's *On Rhetoric* (Oxford, 2007) — 352 pages
with scholarly commentary. Split into 12 chunks aligned with logical content boundaries.

### Chunk Inventory

| File | Pages | Content |
|------|-------|---------|
| b1-01-definition | 19 | Book 1, Ch 1-3: Definition, pisteis, species |
| b1-02-deliberative | 29 | Book 1, Ch 4-8: Political/ethical topics |
| b1-03-epideictic | 18 | Book 1, Ch 9-12: Praise/blame, virtue |
| b1-04-judicial | 18 | Book 1, Ch 13-15: Justice, evidence |
| b2-01-emotions-intro | 20 | Book 2, Ch 1-6: Ethos, anger, fear |
| b2-02-emotions-fear | 15 | Book 2, Ch 7-9: Shame, kindliness, pity |
| b2-03-emotions-envy | 12 | Book 2, Ch 10-11: Indignation, envy, emulation |
| b2-04-character | 14 | Book 2, Ch 12-17: Youth, age, wealth, power |
| b2-05-argument | 21 | Book 2, Ch 18-26: 28 topics, fallacies |
| b3-01-style-intro | 23 | Book 3, Ch 1-6: Delivery, clarity |
| b3-02-style-metaphor | 20 | Book 3, Ch 7-12: Metaphor, rhythm, wit |
| b3-03-arrangement | 15 | Book 3, Ch 13-19: Speech structure |

PDF chunks and text extractions in `/work/apparatus-research/reference/aristotle/chunks/`.

### Extraction Results

Ran parallel extraction across all 12 chunks. **252 recipes** extracted, ~12,000 lines.

| File | Recipes | Key Categories |
|------|---------|----------------|
| aristotle-b1-definition.md | 16 | Pisteis, enthymeme/example, three species |
| aristotle-b1-deliberative.md | 45 | Political topics, goods, degree comparisons |
| aristotle-b1-epideictic.md | 25 | Virtue catalog, praise techniques, amplification |
| aristotle-b1-judicial.md | 12 | Justice framework, non-artistic proofs |
| aristotle-b2-emotions-intro.md | 15 | Anger/calmness, fear/confidence, friendship |
| aristotle-b2-emotions-fear.md | 14 | Shame, kindliness, pity, indignation |
| aristotle-b2-emotions-envy.md | 8 | Envy, emulation, contempt |
| aristotle-b2-character.md | 6 | Character types by age/fortune |
| aristotle-b2-argument.md | 42 | 28 enthymeme topics, 9 fallacies, refutation |
| aristotle-b3-style-intro.md | 11 | Delivery, clarity, basic metaphor |
| aristotle-b3-style-metaphor.md | 15 | Periodic style, visualization, verbal wit |
| aristotle-b3-arrangement.md | 43 | Prooemion through epilogue |

Recipe files in `/work/apparatus-research/research/presentation-catalog/recipes/`.

### Schema Validation

The recipe schema from the README worked across all content types:
- Logical patterns (enthymeme topics)
- Emotional mechanisms (anger, fear, pity)
- Character adaptation (audience types)
- Stylistic devices (metaphor, antithesis)
- Speech structure (arrangement)

Each recipe has: name, Greek term, intent, components (with encodes), parameters,
forms, examples. Bidirectional — usable for production and recognition.

### Observations to Review

Each extraction noted observations that may suggest schema modifications:

1. **Bidirectionality** — Many recipes work for both construction and recognition.
   Should this be explicit in the schema?

2. **Anti-patterns** — Fallacious topics (Ch. 24) are valuable for recognition.
   Should there be a `type: fallacious` field?

3. **Warnings/Limitations** — Aristotle notes when topics can mislead.
   Should recipes have a `warnings` field?

4. **Emotional triads** — Emotions follow a consistent structure (state of mind,
   target, causes). This might warrant a specialized emotion-recipe schema.

5. **Character types** — These are audience profiles, not techniques. Different
   structure than argument patterns.

6. **Hierarchical relationships** — Some recipes contain others (e.g., amplification
   uses multiple sub-techniques). Should recipes have `contains` or `uses` links?

7. **Cross-references** — Many topics reference each other or external works
   (Topics, Poetics, Politics). Should there be a `references` field?

8. **Chunk content mismatch** — One extraction noted the PDF chunk contained
   different chapters than expected. Verify chunk boundaries.

### Next Steps

1. Review observations above — decide on schema modifications
2. Consolidate across files — identify duplicates, hierarchies
3. Consider Tufte extraction — apply same methodology to data visualization pole
4. Begin implementation — pick recipes apparatus needs, implement in presently

---

