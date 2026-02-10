# Semantic Presentation: From Shell Commands to Knowledge Representation

A design for shell output led to a research detour that revealed deep connections
between information presentation and the apparatus project's core concerns.

## How we got here

While implementing one of the apparatus debug commands as an example of good
program architecture, it became apparent that the dual-audience output requirement
(ergonomic for human users, structured for AI agents) was going to spread
pervasively throughout the system. Rather than allow presentation concerns to
contaminate domain logic, I started a design process for a presentation layer
as its own project — "presently" — consumed by apparatus.

The investigation is at `/work/apparatus/investigations/semantic-presentation/`. It
began with practical questions about terminal rendering (how to emit styled
output and JSON from the same code path) and progressed through:

| # | Research | What it addressed |
|---|----------|-------------------|
| 001 | Design Exploration | Iterative design studying `rich`, developing IR approach |
| 002 | Primitive vs Composite Nodes | Node classes for extensibility |
| 003 | Lowering Architecture | MLIR-inspired extensible lowering model |
| 004 | Core Vocabulary | Initial attempt at minimal primitive set |
| 005 | Knowledge Primitives | Domain-driven primitive derivation |
| 006 | Representational Hierarchy | Visual forms: ten-layer hierarchy from values to documents |
| 007-009 | Document/Page Hierarchy | Typographic forms: naive→synthesis sequence |
| 010-011 | Auditory Forms | Auditory forms: naive exploration phase |
| 012 | Auditory Compositional Forms | Auditory forms: synthesis producing six-layer hierarchy |

A design sufficient for immediate needs was developed and validated through
three experiments. The recommendation: use an Intermediate Representation (IR)
that captures semantic structure without presentation details.

## The thread that unraveled

Research 004 and 005 attempted to find "irreducible primitives" — the minimal
set from which everything else composes. The results were unsatisfying. The
framing was wrong.

Research 006 reframed the problem: this is not reduction, it's hierarchicalization.
The question isn't "what are the atoms?" but "what are the layers of complexity,
and how do forms at higher layers degrade to lower layers?"

This reframing produced a ten-layer hierarchy of representational forms:

```
SEMANTIC DOMAIN
  L0: Raw Values (scalars, types, bytes)
  L1: Structured Data (variables, observations, arrays)
  L2: Labeled Data (coordinates, metadata, data types)
        ── semiotic boundary ──
ENCODING DOMAIN
  L3: Visual Variables (position, size, color, shape)
  L4: Graphical Marks (point, line, area, text)
  L5: Scales & Transforms (linear, log, bin, density)
        ── recognition boundary ──
COMPOSITION DOMAIN
  L6: Composed Visualizations (scatter, histogram, box plot)
  L7: Composite Displays (facets, tables, panels, trees)
  L8: Document Structures (sections, lists, IMRAD)
  L9: Complete Documents (papers, notebooks, dashboards)
```

Key insight: the semiotic boundary (L2/L3) is where data (signified) meets
visual form (signifier). This is where presentation begins. Apparatus operates
primarily in the Semantic Domain (L0-L2) and Composition Domain (L7-L9),
largely bypassing the Encoding Domain (L3-L5).

## The failure sequence: 007 → 008 → 009

Research 006 produced the insight-generating hierarchical model for visual
information. The intention of 007 was to get the same thing for textual/typeset
information. It failed — the results were diffuse and unstructured and it failed
to synthesize into a coherent model.

Research 008 heavily indexed on online systems and "synthesized" essentially the
CSS model — an inventory of properties without explanatory power.

Research 009 finally delivered the desired synthesis, drawing from print forms
and the typography tradition (Bringhurst, Tschichold, etc.) to produce a model
of compositional forms that explains *why* document conventions work, not just
*what* they are.

The importance of this sequence: **the "failures" in 007 and 008 may have been
necessary conditions for 009's success.** The problem statement for 009 could
only be formulated after experiencing what 007 and 008 got wrong. The failures
defined what "success" needed to avoid.

This realization was tested with auditory forms. Research 010 and 011 were
deliberately structured similar to the "failed" research (007/008) — diffuse,
exploratory, cataloging prosodic properties and synthesis capabilities. As
predicted, they produced unsatisfying inventories without explanatory power.

Research 012, shaped like 009, then succeeded. It extracted a six-layer
hierarchy of auditory compositional forms and made a significant discovery:
**the compositional layer existed historically but was lost from modern systems**.
Classical rhetoricians (Quintilian, Aristotle, Cicero) had vocabulary for
connecting semantic intent to prosodic realization — "grave and dignified voice"
for warnings, specific delivery patterns for definitions and procedures. Modern
synthesis systems (SSML, TTS) inherited the prosodic mechanisms but not the
compositional vocabulary that organized them.

The naive→synthesis hypothesis held. The exploratory phases (010, 011) were
necessary to define what "success" meant — 012's problem statement could only
be formulated after experiencing what catalog-style research got wrong.

## Connection to apparatus research

This is directly applicable to apparatus. The apparatus research program is
fundamentally about knowledge representation: how do we capture decisions,
trace assumptions, preserve ephemeral insight? The git-as-database design
already grapples with the semantic/encoding boundary — what is the "meaning"
of an investigation versus how it's stored and rendered?

The hierarchy provides vocabulary for this distinction. When we talk about
apparatus artifacts, we're operating at L7-L9 (composite displays, document
structures, complete documents). When we talk about storage, we're at L0-L2
(raw values, structured data, labeled data). The encoding domain is where
format decisions live — how does an Investigation render in terminal vs JSON
vs a future web UI?

## Breaking the visual bias

The semantic-presentation research developed an inherent visual bias. Every
form was conceived in terms of printed output — terminal characters, markdown
rendering, PDF layout. This is natural given the research path (started from
terminal rendering) but limits the design.

Parallel research on auditory forms (010-012) addressed this. The goal was
understanding what structural vocabulary exists natively in audio traditions —
not "translating" visual forms to audio, which would preserve the bias.

The auditory research discovered that oral tradition had compositional vocabulary
that modern systems lack. Quintilian's five-part dispositio, the rhetorical
tradition's delivery patterns for warnings and definitions, oral-formulaic
theory's type-scenes — these are Layer 3 (Utterance Form) and Layer 4 (Segment
Structure) vocabulary that synthesis systems never inherited. SSML can adjust
pitch and rate; it has no concept of "warning" or "definition" as compositional
forms with characteristic prosodic recipes.

This validates the hierarchy approach: the problem isn't finding primitives, it's
finding the layers where semantic intent meets physical realization.

## Retrospective findings

Today's session with the practitioner who set up 010 produced three
retrospective documents (in this entry's companion directory):

**constructing-naive-research.md**: Observations on building research statements
that "fail in instructive ways." Key findings:
- "Do nots" prime what they prohibit (pink elephant problem)
- Quality vs mechanism: describe experience, not process that created it
- Biased language often smuggles in useful scope constraints
- Training data bias may be unreachable via prompting

**connecting-to-the-larger-project.md**: The practitioner explored the research
space and found connections between their experience and the larger project:
- The autonomy ceiling manifests as substrate bias, not disobedience
- Formal→informal transitions produce meta-observations
- Naive research is designed perturbation (the permeability requirement)
- The preservation problem in action: documenting to prevent ephemeral loss

**questions-and-answers.md**: A Q&A on bias detection and the naive research
pattern. Two key strategies emerged:

1. **Binding strength**: Short and direct statements compress precisely; all
   results bind strongly to them. Extensive content becomes fuzzy intention —
   summarized rather than precisely referenced. This affects both what is
   considered and how.

2. **Failure defines success**: The "not like X" constraint requires the
   extensive content of X, which gets compressed. The 30-minute sessions that
   produced 004/005 created the fuzzy intention space that 006 operated within.
   That space can't be serialized into a prompt.

## Assessment

This has been a good example of recognizing something small as actually profound.
The shell needed pretty-printed tables. That led to asking "what should a
presentation layer look like?" That led to "what are the layers of
representation?" That revealed connections to how the apparatus itself
structures knowledge.

The time spent understanding exceeds what the implementation will take. But
the understanding applies beyond this one crate. The hierarchy informs how we
think about apparatus artifacts, how we design storage formats, how we approach
new output media. And recognizing that our framing carried visual bias — that's
a lesson in how research problems shape research outputs.

The naive→synthesis pattern proved reproducible. The 007-009 sequence (visual/
typographic) and the 010-012 sequence (auditory) both followed the same arc:
exploratory research that felt like failure, followed by synthesis research
that succeeded precisely because the failures defined what success needed to
avoid. This is now a validated research technique.

The investigation is complete. The hierarchical models for visual, typographic,
and auditory forms provide sufficient grounding to finalize presently's design
scope and implement the minimal forms needed for shell output.

## Artifacts

This entry's companion directory contains:

**Retrospective documents:**
- `retrospective-prompt.md` — Full session transcript from the 010 setup
- `2026-02-09-constructing-naive-research.md` — Practitioner retrospective on building 010
- `2026-02-09-connecting-to-the-larger-project.md` — Practitioner exploration of research space
- `2026-02-09-questions-and-answers.md` — Q&A on bias detection and binding strength

**Process artifacts (from presently design scratch pad):**
- `session-notes.md` — Notes on intent/structure orthogonality discovery
- `006-009-surgical-comparison.md` — Section-by-section analysis showing how to transform
  research problem statements while preserving rhetorical structure
- `010-attempt-01.md` — First 010 draft with analysis of visual bias leakage
- `010-attempt-02.md` — Second attempt after removing "do not" constraints
- `010-attempt-03.md` — Third attempt adding capability tiers
- `010-attempt-03-edits-post-output.md` — Final refined version with manual edits annotated

## References

Apparatus repo at `/work/apparatus`:
- Investigation: `investigations/semantic-presentation/`
  - `index.md` — Investigation overview and recommendation
  - `research/006-representational-hierarchy/` — Visual forms: ten-layer hierarchy
  - `research/007-009` — Typographic forms: naive→synthesis sequence
  - `research/010-auditory-forms.md` — Auditory naive phase
  - `research/011-auditory-composition.md` — Auditory naive phase (continued)
  - `research/012-auditory-compositional-forms.md` — Auditory synthesis: six-layer hierarchy
  - `experiments/001-003` — Architecture validation experiments
- Crate: `crates/presently/`
- Design: `designs/presently/`
