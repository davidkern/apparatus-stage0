# Aristotle's Rhetoric: Extraction Context

This document provides guidance specific to extracting recipes from Aristotle's Rhetoric.

## Source Structure

### Overall Organization

The Rhetoric divides into three major parts:

1. **Books 1-2 (Pisteis)**: The means of persuasion - what Aristotle calls the "body" of rhetoric
   - Logical argument (logos) via enthymemes and paradigms
   - Speaker credibility (ethos) via character projection
   - Audience emotion (pathos) via understanding of emotional states

2. **Book 3 (Lexis and Taxis)**: Style and arrangement - later additions
   - How to express arguments effectively
   - How to structure a speech

### Key Structural Units

- **Topics (topoi)**: Strategies for constructing arguments - the core extractable patterns
- **Species of rhetoric**: Deliberative, epideictic, judicial - context for techniques
- **Emotions (pathE)**: Defined states with causes and targets - frameworks for emotional appeals
- **Character types**: Age and fortune variations - audience adaptation patterns

## Terminology

### Greek Terms to Preserve

The following terms have technical meanings that English translations don't fully capture. Use `source.original_term` to preserve them:

| Greek | Transliteration | Kennedy's Translation | Notes |
|-------|-----------------|----------------------|-------|
| ἐνθύμημα | enthymema | enthymeme | Rhetorical syllogism; the "body" of persuasion |
| παράδειγμα | paradeigma | paradigm/example | Rhetorical induction |
| τόπος | topos | topic | Strategy or "place" for finding arguments |
| πίστις | pistis | proof/persuasion | Means of persuasion; broader than "proof" |
| ἦθος | ethos | character | Speaker credibility through the speech |
| πάθος | pathos | emotion | Audience state to be produced |
| λόγος | logos | argument/speech | Both the words and the reasoning |
| εἰκός | eikos | probability | What usually happens |
| σημεῖον | semeion | sign | Evidence; may be necessary or fallible |
| τεκμήριον | tekmerion | necessary sign | Irrefutable evidence |
| λέξις | lexis | style | Manner of expression |
| τάξις | taxis | arrangement | Structure/ordering of parts |

### Translation Conventions

Kennedy uses specific English terms consistently:
- "pisteis" rather than "proofs" when referring to the three modes
- "enthymeme" retained as technical term (not "rhetorical syllogism")
- "topic" for topos (not "commonplace" or "locus")
- "paradigm" and "example" used interchangeably

## Source-Specific Patterns

### The 28 Topics (Book 2, Chapter 23)

The most concentrated extraction source. Each topic is:
- A named strategy for constructing enthymemes
- Applicable across subject matters (deliberative, epideictic, judicial)
- Illustrated with examples from speeches, drama, or historical events

Extract each topic as a separate recipe. Note:
- Topic names come from Kennedy's section headings (e.g., "From opposites")
- Aristotle's Greek designation where given (e.g., "ek tOn enantiOn")
- The logical structure of the argument pattern
- Whether primarily constructive or refutative

### Fallacious Enthymemes (Book 2, Chapter 24)

Nine apparent/fallacious topics - patterns that seem valid but aren't. Extract these as:
- Recognition-oriented recipes (direction: recognition)
- With `warnings` about how they deceive
- Cross-referenced to valid counterparts where applicable

### Emotion Frameworks (Book 2, Chapters 2-11)

Each emotion is analyzed systematically:
1. **Definition**: What the emotion is
2. **Disposition**: What state makes someone prone to feel it
3. **Objects**: Toward whom/what is it felt
4. **Occasions**: What circumstances trigger it

This triad structure (disposition-object-occasion) recurs across emotions and should be captured in `extensions`.

### Character Types (Book 2, Chapters 12-17)

Audience adaptation patterns based on:
- Age (youth, prime, old age)
- Fortune (birth, wealth, power)

These provide `audience` context rather than standalone techniques.

## Extraction Hints

### Direction Assignment

Most Rhetoric techniques are bidirectional (`direction: both`):
- Aristotle explicitly teaches both "how to" and "how to recognize"
- The fallacious topics are primarily `recognition`
- Emotional frameworks can be used to arouse OR to detect manipulation

### Components vs. Parameters

For topics, prefer `components` when the technique has identifiable parts that encode specific information:

```yaml
components:
  - element: opposite-pair
    encodes: Two contrary states or actions
  - element: consequence-pair
    encodes: Results that follow from each
```

Use `parameters` when the same structure varies by domain:

```yaml
parameters:
  domain: deliberative | epideictic | judicial
```

### Handling Examples

Aristotle's examples are often:
- Quotations from lost speeches, plays, or poems
- References to historical events (Peloponnesian War, Sicilian politics)
- Hypothetical constructions for illustration

Quote examples directly with Kennedy's text. Include his footnote context when it clarifies the example's force.

### Cross-References in Aristotle

Aristotle frequently references:
- **Topics** (his dialectic treatise) - for logical parallels
- **Analytics** (Prior and Posterior) - for formal logic
- **Nicomachean Ethics** - for virtue definitions
- **Politics** - for civic context
- **Poetics** - for dramatic examples

Note these in the `## Notes` section when they illuminate a technique.

### Textual Uncertainties

Kennedy marks textual problems:
- Bracketed text `[...]` indicates editorial additions
- Double brackets indicate suspected interpolations
- Footnotes flag manuscript variants

When extracting from uncertain passages, note the uncertainty but extract the technique as Kennedy presents it.

## Extensions

Use the `extensions` field for Aristotle-specific patterns:

```yaml
extensions:
  aristotle_topic_number: 1        # For the 28 topics
  emotion_triad:                    # For emotion frameworks
    disposition: ...
    objects: ...
    occasions: ...
  fallacious_form:                  # For techniques with invalid variants
    name: ...
    description: ...
```

## Scholarly Context

The Rhetoric is:
- A teaching text assembled from lecture notes
- Not always internally consistent (Ch. 1 vs. later chapters on emotion)
- Foundational to Western rhetoric, political science, and communication studies
- Still actively debated in scholarship

Kennedy's footnotes provide essential scholarly context. When a technique's interpretation is contested, note this in `## Notes` rather than presenting one interpretation as definitive.
