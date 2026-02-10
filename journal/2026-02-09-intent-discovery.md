# Intent Discovery Experiments

Informal experiments using agents to discover communicative intents from
topical sources. The goal is to expand the intent catalog beyond the
apparatus-derived examples that seeded the framework.

## Methodology

Prime agents with the catalog framework, then have them read topical
materials to identify intents. Sources should span different traditions:
- Classical rhetoric (Aristotle, Quintilian, Cicero)
- Instructional design (Mayer, Merrill, Gagné)
- Technical writing (style guides, documentation standards)
- Accessibility (WCAG, inclusive design)

The 24 auditory forms and 40 presently intents are held back as validation
sets — we check whether discovered intents cover these, not vice versa.

## Discovery Log

### Attempt 1: Classical Rhetoric

**Date**: 2026-02-09

**Source**: Aristotle's Rhetoric (via web search synthesis)

**Prompt**:
```
You are researching communicative intents — the semantic purposes that
authors have when presenting information to an audience.

First, read the framework document to understand what an "intent" is in
this context:
/work/apparatus/catalog/framework.md

Then research Aristotle's Rhetoric to identify intents. What distinct
things do speakers/authors want audiences to understand, feel, or do?

For each intent you identify:
1. Name it (short, descriptive)
2. Define its semantic purpose (what does the author want to achieve?)
3. Give examples of how it manifests
4. Note containment relationships (does it contain or get contained by others?)
5. Note which of our existing categories it might belong to, or if it needs a new category

Focus on intents that are DIFFERENT from the provisional categories
already in the framework. We're looking to expand, not confirm.

Write your findings to:
/work/apparatus/catalog/intents/discovery/aristotle-rhetoric.md
```

**Result**: 17 intents identified, 4 new categories proposed

**Output**: `/work/apparatus/catalog/intents/discovery/aristotle-rhetoric.md`

**Proposed New Categories**:
- **Persuasive**: Exhortation, Dissuasion, Accusation, Defense, Praise, Blame
- **Credibility**: Credential, Concession
- **Emotional**: Reassurance, Urgency, Empathy
- **Argumentative**: Analogy, Anticipation, Maxim, Refutation

**Structural additions**: Attention-Capture, Framing, Recapitulation, Timeliness

**Observations**:

1. The Persuasive category is significant — it's about changing belief/disposition,
   which is distinct from Instruction (do this) or Explanation (understand this).
   Aristotle's three genera (deliberative/forensic/epideictic) all involve
   movement toward positions.

2. Some discoveries overlap with existing categories but with different framing:
   - Dissuasion overlaps Warning but is broader (argues against, not just alerts)
   - Accusation/Defense relate to Error/Provenance but focus on attribution
   - Recapitulation is nearly identical to Summary

3. The agent raised good meta-questions:
   - Is Persuasive a category or a mode? (Could be orthogonal axis like intent/form)
   - Should Emotional be modifiers rather than standalone?
   - Aristotle's three genera map to temporal orientation — orthogonal?

4. The Argumentative category may overlap with Evidential, or they may be
   complementary (Evidential = confidence/source, Argumentative = logical moves).

5. Practical intents for apparatus: Accusation (git blame, error attribution),
   Defense (commit message justification), Anticipation (FAQ), Maxim (best practices).

**Next**: Try a different source tradition to see if similar patterns emerge
or if we find genuinely orthogonal intents.

---

### Attempt 2: Instructional Design

**Date**: 2026-02-09

**Source**: Instructional design literature (Mayer, Merrill, Gagné)

**Prompt**:
```
You are researching communicative intents — the semantic purposes that
authors have when presenting information to an audience.

First, read the framework document to understand what an "intent" is:
/work/apparatus/catalog/framework.md

Then research instructional design literature — particularly Mayer's
multimedia learning principles, Merrill's first principles of instruction,
and Gagné's nine events of instruction. What distinct communicative
purposes do instructional designers identify?

For each intent you identify:
1. Name it (short, descriptive)
2. Define its semantic purpose
3. Give examples of how it manifests
4. Note containment relationships
5. Note which existing categories it might belong to, or if it needs new category

Focus on intents DIFFERENT from provisional categories. We're expanding.

Write findings to:
/work/apparatus/catalog/intents/discovery/instructional-design.md
```

**Result**: 26 intents identified, 7 proposed categories

**Output**: `/work/apparatus/catalog/intents/discovery/instructional-design.md`

**Proposed New Categories**:
- **Activation**: Prior-Knowledge-Activation, Advance-Organizer, Objective-Statement
- **Guidance**: Prompt, Hint, Worked-Example, Completion-Problem, Fading-Indication
- **Elicitation**: Practice-Prompt, Self-Test, Elaborative-Interrogation
- **Feedback**: Corrective-Feedback, Explanatory-Feedback, Progress-Feedback
- **Signaling**: Signal, Coherence-Maintenance
- **Motivation**: Relevance-Statement, Confidence-Building, Attention-Capture
- **Sequencing**: Epitome, Synthesis

**Observations**:

1. Strong convergence with Aristotle on Attention-Capture and Confidence-Building/
   Reassurance — suggests these are robust cross-domain intents.

2. Guidance category is about graded support (scaffolding) that can be removed
   as competence increases. Different from Instruction (what to do).

3. Elicitation is interesting — demands learner-generated output. Related to
   Command but purpose differs (learning vs task completion).

4. Feedback extends Error/Status with learning-specific nuance: corrective,
   explanatory, progress forms.

5. Open question: Is position-in-sequence an attribute of intents? Advance-
   Organizer and Epitome are position-dependent (start of section).

6. Worked-Example is a container intent that includes Steps, Examples, and
   Explanations but is meant to be studied, not executed.

---

### Attempt 3: Accessibility Standards

**Date**: 2026-02-09

**Source**: WCAG, inclusive design principles, screen reader conventions

**Prompt**:
```
You are researching communicative intents — the semantic purposes that
authors have when presenting information to an audience.

First, read the framework document to understand what an "intent" is:
/work/apparatus/catalog/framework.md

Then research accessibility standards and inclusive design — WCAG
guidelines, screen reader conventions, cognitive accessibility principles.
What distinct communicative purposes does accessibility work identify?
What intents matter for audiences with different abilities?

For each intent you identify:
1. Name it (short, descriptive)
2. Define its semantic purpose
3. Give examples of how it manifests
4. Note containment relationships
5. Note which existing categories it might belong to, or if it needs new category

Focus on intents DIFFERENT from provisional categories. Look especially
for intents about: navigation, orientation, alternative representations,
cognitive load, sensory modes.

Write findings to:
/work/apparatus/catalog/intents/discovery/accessibility.md
```

**Result**: 18 intents identified, 5 proposed categories

**Output**: `/work/apparatus/catalog/intents/discovery/accessibility.md`

**Proposed New Categories**:
- **Orientation**: Landmark, Location-in-Structure, Skip-Navigation, Heading-Outline
- **Announcement**: Polite-Update, Assertive-Update, State-Change
- **Alternative-Representation**: Text-Alternative, Caption, Audio-Description, Transcript
- **Guidance**: Input-Hint, Error-Identification, Error-Suggestion
- **Cognitive-Support**: Simplified-Content, Chunking, Timeout-Warning

**Observations**:

1. **Urgency as orthogonal dimension**: Polite vs Assertive delivery applies to
   any content type. This suggests urgency/timing might be an axis rather than
   category — any Status, Warning, or Error can be polite or assertive.

2. **Mode translation is distinct**: Alternative-Representation intents don't add
   information — they translate across sensory modes. This is different from most
   intents. May be a Form concern rather than Intent concern.

3. **Guidance appears in both**: Instructional design has Guidance (scaffolding),
   accessibility has Guidance (error prevention/recovery). Similar but different
   emphasis. Convergence suggests robust category.

4. **Prevention → Identification → Recovery sequence**: Error handling has
   internal structure that could inform Error-Handling composition generally.

5. **Two types of hierarchy**: Document hierarchy (navigation) vs data hierarchy
   (understanding relationships). May need to refine the Hierarchy intent.

6. **Cognitive-Support raises question**: Is Simplified-Content an intent or a
   treatment? Same Definition intent, different complexity level. May belong in
   Forms dimension rather than Intent dimension.

---

## Cross-Source Patterns (after 3 sources)

### High-Confidence Intents (appear in multiple sources)

| Intent | Aristotle | Instructional | Accessibility |
|--------|-----------|---------------|---------------|
| Attention-Capture | ✓ | ✓ | — |
| Reassurance/Confidence | ✓ | ✓ | — |
| Framing/Advance-Organizer | ✓ | ✓ | — |
| Guidance (scaffolding/hints) | — | ✓ | ✓ |
| Summary/Recapitulation | ✓ | ✓ | — |

### Possible Orthogonal Dimensions (not categories)

1. **Urgency/Timing**: polite vs assertive delivery
2. **Position-in-sequence**: opening, middle, closing
3. **Audience-adaptation**: simplified vs standard complexity
4. **Mode**: visual, typographic, auditory (already in framework)

### Gaps Not Yet Addressed

- Measurement/uncertainty forms (e.g., "10.12±0.4 kg") — try scientific writing
- Narrative intents — try storytelling/fiction
- Social/phatic intents — try conversation analysis

---

### Attempt 4: Scientific Writing

**Date**: 2026-02-09

**Source**: Scientific communication conventions, data presentation, uncertainty quantification

**Result**: 25+ intents identified, 7 proposed categories

**Output**: `/work/apparatus/catalog/intents/discovery/scientific-writing.md`

**Proposed New Categories**:
- **Quantification**: Measurement, Measurement-with-Uncertainty, Precision-Statement, Significant-Figures
- **Statistical-Claim**: Statistical-Significance, Effect-Size, Confidence-Interval, Sample-Size, Power
- **Evidence-Grading**: Evidence-Level, Study-Design
- **Epistemic-Hedging**: Hedge, Boost, Caveat
- **Methodology-Transparency**: Reproducibility-Info, Assumption, Limitation, Scope
- **Visual-Data-Presentation**: Figure-Caption, Axis-Label, Legend, Error-Bar-Specification
- **Attribution**: Citation, Direct-Quote, Paraphrase-Attribution

**Key Observations**:

1. **Measurement-with-Uncertainty is distinct**: "10.12±0.4 kg" is not just a number —
   the uncertainty bound is semantic content. This is the intent we were looking for.

2. **Precision as encoded information**: "5.00 m" vs "5 m" carry different epistemic
   meaning in their form, not just their value. Significant figures are an intent.

3. **Confidence spectrum**: Multiple mechanisms express confidence — linguistic hedges,
   statistical bounds, evidence hierarchies, precision notation. These are related but
   distinct intents.

4. **Error bars need specification**: "Error bars represent ±1 SD" is itself an intent
   (Error-Bar-Specification). The visual form is incomplete without this.

5. **Reproducibility as meta-intent**: Multiple intents (Methodology, Scope, Limitation,
   Data-Availability) collectively serve enabling verification.

---

### Attempt 5: Narrative/Storytelling

**Date**: 2026-02-09

**Source**: Narrative theory, fiction writing, storytelling traditions

**Result**: 30+ intents identified, 8 sub-groups

**Output**: `/work/apparatus/catalog/intents/discovery/narrative.md`

**Proposed Sub-Groups** (possibly a new Narrative category):
- **Story Arc**: Exposition, Inciting-Incident, Rising-Action, Climax, Falling-Action, Denouement
- **Perspective**: Narrative-Voice, Interior-Monologue, Dialogue
- **Tension**: Hook, Suspense, Cliffhanger, Foreshadowing
- **Temporal**: Flashback, Flash-forward, In-Medias-Res
- **Character**: Character-Introduction, Motivation, Character-Arc, Antagonism
- **Revelation**: Epiphany, Anagnorisis, Mystery, Revelation
- **Setting**: Scene-Setting, World-Building, Frame-Narrative
- **Oral Tradition**: Call-and-Response, Formulaic-Opening, Repetition-with-Variation

**Key Observations**:

1. **Narrative communicates through experience**: Unlike Explanation (understanding) or
   Instruction (action), narrative creates understanding through dramatic shape and
   emotional journey.

2. **Tension intents are distinct**: Hook, Suspense, Cliffhanger manage reader engagement
   differently than Attention-Capture. They sustain rather than initiate.

3. **Temporal manipulation is narrative-specific**: Flashback and foreshadowing are not
   just Temporal intents — they create meaning through temporal displacement.

4. **Revelation has structure**: Mystery → Suspense → Revelation → Epiphany is a
   compositional pattern for managing what audience knows when.

5. **Applicable to technical writing**: Incident reports, debugging narratives, case
   studies all use narrative intents (scene-setting, rising action, resolution).

---

### Attempt 6: Conversation Analysis

**Date**: 2026-02-09

**Source**: Conversation analysis, pragmatics, speech act theory

**Result**: 25+ intents identified, 6 proposed categories

**Output**: `/work/apparatus/catalog/intents/discovery/conversation-analysis.md`

**Proposed New Categories**:
- **Interactional**: Phatic, Backchannel, Continuer, Pre-Sequence, Turn-Yielding
- **Face-Work**: Face-Threat-Mitigation, Hedge, Positive-Face, Negative-Face, Self-Deprecation
- **Remedial**: Apology, Excuse, Justification, Disclaimer
- **Preference-Marked**: Dispreferred-Response-Preface, Account
- **Implicature**: Indirect-Speech-Act, Hint, Flouting
- **Topic-Management**: Topic-Initiation, Topic-Shift, Topic-Closure

**Key Observations**:

1. **Meta-communicative intents are real**: Backchannels ("uh-huh"), continuers, and
   turn-management are about the channel, not content. They're intents without propositional
   content.

2. **Face-work pervades communication**: Protection of social self-image affects how
   all other intents are realized. May be a dimension rather than category.

3. **Indirect speech is systematic**: "Can you pass the salt?" is a Request wearing
   Question's form. The gap between form and intent is itself meaningful.

4. **Preference structure matters**: Dispreferred responses (refusals, disagreements)
   are marked with delays, hedges, accounts. The marking is an intent.

5. **Phatic function is distinct**: "How are you?" in greeting isn't a Question intent —
   it's a Phatic intent using question form. Content-free social maintenance.

---

## Summary After 6 Sources

### Total Discovery

| Source | Intents | New Categories Proposed |
|--------|---------|------------------------|
| Aristotle's Rhetoric | 17 | 4 (Persuasive, Credibility, Emotional, Argumentative) |
| Instructional Design | 26 | 7 (Activation, Guidance, Elicitation, Feedback, Signaling, Motivation, Sequencing) |
| Accessibility | 18 | 5 (Orientation, Announcement, Alternative-Rep, Guidance, Cognitive-Support) |
| Scientific Writing | 25+ | 7 (Quantification, Statistical-Claim, Evidence-Grading, Epistemic-Hedging, Methodology, Visual-Data, Attribution) |
| Narrative | 30+ | 1 meta-category with 8 sub-groups |
| Conversation Analysis | 25+ | 6 (Interactional, Face-Work, Remedial, Preference-Marked, Implicature, Topic-Management) |
| **Total** | **~140** | **~30 proposed** |

### High-Confidence Cross-Source Patterns

| Pattern | Sources | Implication |
|---------|---------|-------------|
| Attention-Capture / Hook | Aristotle, Instructional, Narrative | Robust intent |
| Guidance / Scaffolding | Instructional, Accessibility | Robust category |
| Hedge / Epistemic-Hedging | Aristotle, Scientific, Conversation | Robust intent, maybe dimension |
| Framing / Advance-Organizer / Exposition | Aristotle, Instructional, Narrative | Robust opening intent |
| Summary / Recapitulation / Denouement | Aristotle, Instructional, Narrative | Robust closing intent |

### Likely Orthogonal Dimensions (not categories)

1. **Urgency/Timing**: polite vs assertive (Accessibility)
2. **Position-in-sequence**: opening/middle/closing (Instructional, Narrative)
3. **Confidence/Hedging**: tentative to certain (Scientific, Conversation)
4. **Face-concern**: degree of social self-image protection (Conversation)
5. **Directness**: explicit to implied (Conversation)

### Measurement Intent Found

Scientific writing produced exactly what we were looking for:

- **Measurement**: "10.12 kg"
- **Measurement-with-Uncertainty**: "10.12 ± 0.04 kg"
- **Confidence-Interval**: "95% CI [10.08, 10.16]"
- **Significant-Figures**: "10.1" vs "10.10" as precision encoding
- **Effect-Size**: "d = 0.81"

These are distinct intents with specific typographic and auditory forms.

---

## Next Steps (for tomorrow)

### 1. Consolidation Pass

Reduce ~140 discovered intents and ~30 proposed categories to a coherent taxonomy:
- Identify truly distinct categories (estimate: 12-15 after merging)
- Extract orthogonal dimensions (urgency, position, confidence, face, directness)
- Merge overlapping intents across sources
- Produce revised `intents/index.md`

### 2. Validation Against Holdback

Check coverage of:
- 24 auditory forms from Research 012
- 40 presently intents from design document

Gaps indicate either:
- Missing discovery sources
- Apparatus-specific intents that don't generalize (which is fine)

### 3. Recipe Drafting

For high-confidence intents that appeared in multiple sources, draft recipes:
- Attention-Capture / Hook
- Guidance / Hint
- Hedge
- Measurement-with-Uncertainty (the one we specifically wanted)

### 4. Framework Refinement

Update `framework.md` to incorporate:
- Orthogonal dimensions discovered
- Revised category structure
- Relationship between Intent and Form clarified by discoveries

---
