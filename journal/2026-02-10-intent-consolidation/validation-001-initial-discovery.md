# Validation 001: Initial Discovery Pass

**Date**: 2026-02-10
**Discovery sources**: 6 (Aristotle, Instructional Design, Accessibility, Scientific Writing, Narrative, Conversation Analysis)
**Discovered intents**: ~140
**Proposed categories**: ~30

## Holdback Sets

Two holdback sets were reserved before the discovery pass:

1. **24 Auditory Forms** (from Research 012, Layer 3)
2. **~40 Presently Intents** (from presently design document)

These represent intents we already knew about through apparatus-specific work. If
the discovery covered them, the discovery was thorough. Gaps indicate either:
- Missing source traditions
- Apparatus-specific intents that don't generalize (acceptable)

## Auditory Forms Coverage

| Form | Discovered? | Notes |
|------|-------------|-------|
| Statement/Assertion | ❌ | Basic, not explicitly named |
| Question | ❌ | Basic, not explicitly named |
| Command/Imperative | ❌ | Basic, not explicitly named |
| Warning (4 levels) | ~ | Dissuasion overlaps; no severity levels |
| Definition | ❌ | Basic, not explicitly named |
| Example/Illustration | ~ | Concept-Exemplification, Worked-Example related |
| Step | ❌ | Basic, not explicitly named |
| Acknowledgement | ~ | Backchannel related |
| Confirmation Request | ~ | Pre-Sequence related |
| Apology | ✓ | Conversation Analysis |
| Suggestion | ~ | Hint, Prompt, Error-Suggestion |
| Transition Marker | ~ | Topic-Shift/Closure related |
| Formula | ~ | Formulaic Opening/Closing |
| Exhortation | ✓ | Aristotle |
| Consolation | ~ | Reassurance related |
| Greeting | ❌ | Basic transition |
| Farewell/Ending | ~ | Formulaic Closing |
| Progress | ~ | Progress-Feedback |
| List Item | ❌ | Not found |
| Status Report | ~ | State-Change, Declaration |
| Ambient Update | ~ | Polite-Update |

**Summary**: 2 direct hits, 13 related, 9 missing

## Presently Intents Coverage

| Category | Intent | Discovered? | Notes |
|----------|--------|-------------|-------|
| Temporal | Sequence | ❌ | Rising Action is narrative version |
| | Timeline | ❌ | |
| | Duration | ❌ | Timeliness related |
| | Overlap | ❌ | |
| | Trend | ❌ | |
| | Recurrence | ❌ | Repetition-with-Variation is narrative |
| Distributional | Histogram | ❌ | |
| | Density | ❌ | |
| | Quartiles | ❌ | |
| | Ranking | ❌ | |
| | Proportion | ❌ | |
| Comparative | Diff | ❌ | |
| | Before/After | ~ | Character Arc |
| | Alternative | ~ | Concession |
| | Deviation | ❌ | |
| Relational | Dependency | ❌ | |
| | Causation | ~ | Flashback, Justification |
| | Hierarchy | ~ | Heading-Outline |
| | Network | ❌ | |
| | Grouping | ~ | Control-Group |
| | Path | ❌ | |
| Evidential | Claim+Evidence | ✓ | Multiple sources |
| | Confidence | ✓ | Hedge/Boost, CI |
| | Provenance | ✓ | Citation, Attribution |
| | Reasoning chain | ❌ | |
| | Uncertainty range | ✓ | Measurement-with-Uncertainty |
| State | Status | ✓ | State-Change, Declaration |
| | Progress | ✓ | Progress-Feedback |
| | Health | ❌ | |
| | Inventory | ❌ | |
| | Configuration | ❌ | |
| Aggregative | Count | ~ | Sample-Size |
| | Statistics | ~ | Effect-Size |
| | Grouping summary | ❌ | |
| | Top-N | ❌ | |
| Instructional | Action required | ~ | Urgency |
| | Suggestion | ✓ | Multiple |
| | Warning | ✓ | Multiple |
| | Error | ✓ | Error-Identification |

**Summary**: 9 direct hits, 11 related, 20 missing

## Coverage by Category

| Category | Hits | Related | Missing | Coverage |
|----------|------|---------|---------|----------|
| Temporal | 0 | 2 | 4 | Poor |
| Distributional | 0 | 0 | 5 | None |
| Comparative | 0 | 2 | 2 | Poor |
| Relational | 0 | 3 | 3 | Poor |
| Evidential | 4 | 0 | 1 | Good |
| State | 2 | 0 | 3 | Partial |
| Aggregative | 0 | 2 | 2 | Poor |
| Instructional | 3 | 1 | 0 | Good |

## Gap Analysis

The discovery has a clear **bias toward human-to-human communication**.

### Well-covered domains

- Evidential intents (scientific writing, rhetoric)
- Social/interpersonal intents (conversation analysis)
- Narrative intents (storytelling)
- Instructional intents (instructional design)
- Persuasive intents (rhetoric)

### Poorly covered domains

- **Data presentation** (Temporal, Distributional, Comparative, Aggregative)
- **System output** (List Item, Ambient Update, Health, Inventory)
- **Basic speech acts** (Statement, Question, Command, Definition)

### Explanation

The sources were human communication traditions (rhetoric, instruction, storytelling,
conversation). Apparatus is a hybrid — it communicates to humans but often about
machine state and data. The presently intents for data presentation are
apparatus-specific and don't appear in human communication literature.

## Recommendations

1. **Run additional discovery** against data visualization and dashboard literature
   to fill the Temporal, Distributional, Comparative, Aggregative gaps.

2. **Add basic speech acts explicitly** — Statement, Question, Command, Definition,
   Step are so fundamental they need to be in the taxonomy even if not "discovered."

3. **The discovery adds to rather than replaces** the existing taxonomy. The presently
   intents fill gaps the discovery didn't cover.

## Source Traditions Tried

| Source | Intents Found | Categories Proposed | Gap Coverage |
|--------|---------------|---------------------|--------------|
| Aristotle's Rhetoric | 17 | 4 | Persuasive, Emotional |
| Instructional Design | 26 | 7 | Guidance, Feedback, Activation |
| Accessibility | 18 | 5 | Orientation, Announcement |
| Scientific Writing | 25+ | 7 | Quantification, Methodology |
| Narrative | 30+ | 1 (8 sub) | Story structure |
| Conversation Analysis | 25+ | 6 | Interactional, Face-Work |

## Candidate Sources for Next Pass

To fill gaps in data presentation:

- Data visualization literature (Tufte, Few, Cairo)
- Dashboard design (information dashboards, KPI design)
- Business intelligence / analytics reporting
- Monitoring and observability (SRE, DevOps)
- Statistical graphics (Cleveland, Wilkinson's Grammar of Graphics)
