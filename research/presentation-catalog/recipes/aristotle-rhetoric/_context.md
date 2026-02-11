# Aristotle's Rhetoric: Source Context

## Work Information

- **Title**: Rhetoric (On Rhetoric)
- **Author**: Aristotle
- **Translation**: George A. Kennedy (Oxford University Press, 2007)
- **Total Size**: ~250 pages across three books

### Overall Structure

The work divides into three books:

- **Book 1**: Introduction to rhetoric, the three species of rhetoric (deliberative, judicial, epideictic), and subject matter specific to each species
- **Book 2**: The means of persuasion (pisteis) through character (ethos) and emotion (pathos), types of character, the common topics (topoi) for enthymemes
- **Book 3**: Style (lexis) and arrangement (taxis) of speeches

Books 1 and 2 were originally Aristotle's lectures on "thought" (dianoia) in rhetoric; Book 3 was a separate work on style and arrangement later combined with them.

## Chunk Inventory

| Chunk ID | Content Coverage | File Path |
|----------|------------------|-----------|
| b1-01-definition | Book 1, Ch. 1-3: Definition of rhetoric, dialectic relationship, pisteis | `reference/aristotle/chunks/b1-01-definition.pdf` |
| b1-02-deliberative | Book 1, Ch. 4-8: Deliberative rhetoric, happiness, good, political topics | `reference/aristotle/chunks/b1-02-deliberative.pdf` |
| b1-03-epideictic | Book 1, Ch. 9: Epideictic rhetoric, virtue, praise, blame | `reference/aristotle/chunks/b1-03-epideictic.pdf` |
| b1-04-judicial | Book 1, Ch. 10-15: Judicial rhetoric, wrongdoing, pleasure, atechnic proofs | `reference/aristotle/chunks/b1-04-judicial.pdf` |
| b2-01-emotions-intro | Book 2, Ch. 1-4: Introduction to emotions, anger, calmness | `reference/aristotle/chunks/b2-01-emotions-intro.pdf` |
| b2-02-emotions-fear | Book 2, Ch. 5-8: Fear, confidence, shame, kindness | `reference/aristotle/chunks/b2-02-emotions-fear.pdf` |
| b2-03-emotions-envy | Book 2, Ch. 9-11: Pity, indignation, envy, emulation | `reference/aristotle/chunks/b2-03-emotions-envy.pdf` |
| b2-04-character | Book 2, Ch. 12-17: Character types by age and fortune | `reference/aristotle/chunks/b2-04-character.pdf` |
| b2-05-argument | Book 2, Ch. 18-26: Common topics, enthymemes, fallacies, refutation | `reference/aristotle/chunks/b2-05-argument.pdf` |
| b3-01-style-intro | Book 3, Ch. 1-6: Introduction to style, clarity, appropriateness | `reference/aristotle/chunks/b3-01-style-intro.pdf` |
| b3-02-style-metaphor | Book 3, Ch. 7-12: Metaphor, simile, prose rhythm, written vs. spoken | `reference/aristotle/chunks/b3-02-style-metaphor.pdf` |
| b3-03-arrangement | Book 3, Ch. 13-19: Parts of a speech, arrangement | `reference/aristotle/chunks/b3-03-arrangement.pdf` |

Text versions (`.txt`) are also available alongside each PDF.

## Reference System

Aristotle's Rhetoric uses **Bekker numbers** as the standard scholarly reference system. These refer to page and column in the 1831 Berlin Academy edition of Aristotle's works.

Format: `[page number][column letter][line number]`
- Page numbers for the Rhetoric range from 1354 to 1420
- Column letters are `a` or `b`
- Line numbers are optional but increase precision

### Location Format in Recipes

```yaml
source:
  work: Rhetoric
  author: Aristotle
  location: "Book 2, Chapter 23, 1397a7"  # Full reference
  # or
  location: "2.23.1, 1397a1"              # Abbreviated form
```

Kennedy's translation includes Bekker numbers in the margins. When extracting, capture both the Book/Chapter reference and the Bekker number when available.

## Terminology

### Key Greek Terms to Preserve

The following terms should be captured in `source.original_term` when extracting the corresponding recipe:

| English Term | Greek (transliterated) | Notes |
|--------------|------------------------|-------|
| enthymeme | enthymema | Rhetorical syllogism |
| paradigm/example | paradeigma | Rhetorical induction |
| topic | topos (pl. topoi) | Line/strategy of argument |
| proof/means of persuasion | pistis (pl. pisteis) | Covers ethos, pathos, logos |
| probability | eikos | "What happens for the most part" |
| sign | semeion | Non-necessary evidence |
| infallible sign | tekmerion | Necessary/conclusive evidence |
| maxim | gnome | General statement about action |
| character | ethos | Speaker's credibility |
| emotion | pathos | Audience's emotional state |
| style | lexis | Verbal expression |
| arrangement | taxis | Structure of speech |

### Translation Conventions

Kennedy uses consistent English renderings:
- "pistis" as "means of persuasion" or "proof" depending on context
- "topos" as "topic" (preserving the Greek plural "topoi")
- Section numbers within chapters (e.g., "2.23.4" means Book 2, Chapter 23, section 4)

## Source Structure and Content Types

### What to Extract

1. **Topics (topoi)**: The 28 common topics in Book 2, Chapter 23 are the primary extraction target. Each is a named strategy for constructing enthymemes.

2. **Fallacious patterns**: Chapter 24 describes apparent (fallacious) enthymemes. Extract these with warnings about their invalid nature.

3. **Emotional techniques**: Chapters 2-11 of Book 2 describe how to arouse and calm specific emotions. Each emotion has a characteristic structure.

4. **Character adaptation**: Chapters 12-17 describe character types and how arguments should adapt to them.

5. **Style techniques**: Book 3 covers specific stylistic devices (metaphor, simile, antithesis, etc.).

6. **Structural elements**: Parts of a speech (prooemion, narration, proof, epilogue) and their purposes.

### Granularity Guidelines

- Each numbered topic (1-28) in Chapter 23 is a separate recipe
- Each fallacious pattern in Chapter 24 is a separate recipe
- Each emotion in Chapters 2-11 may yield multiple recipes (arousing, calming, recognizing)
- Stylistic devices are individual recipes; general principles are not

## Extraction Hints

### Direction Field

Most techniques in the Rhetoric work bidirectionally:
- Construction: how to build arguments using the topic
- Recognition: how to identify when opponents use it

Default to `direction: both` unless:
- The technique is purely about identification (e.g., recognizing fallacies) → `recognition`
- The technique is purely about production (e.g., arrangement of prooemion) → `construction`

### Components vs. Parameters

**Components** are structural parts of the technique:
```yaml
components:
  - element: opposite-pair
    encodes: Two contrary states or actions
  - element: consequence-pair
    encodes: Results that follow from each opposite
```

**Parameters** are variations in how the technique can be applied:
```yaml
parameters:
  domain: actions | states | qualities
  context: deliberative | judicial | epideictic
```

### Handling Examples

Aristotle provides rich examples, often from Greek literature and history. Quote them directly:

```markdown
## Examples

> "Self-control is good, for lack of self-control is harmful." (2.23.1, 1397a9)

Kennedy notes this example demonstrates the topic from opposites in its simplest form.
```

### Warnings and Limitations

Aristotle often notes when techniques can fail or be refuted. Capture these:

```yaml
warnings:
  - "Opposites must be genuine contraries, not merely different things"
  - "Can be refuted if the consequence doesn't actually follow"
```

### Cross-references

The Rhetoric frequently cross-references other works (Topics, Analytics, Poetics). Note these in the body but don't create `related` entries during extraction:

```markdown
## Notes

Aristotle refers to a fuller treatment in the Topics (113b15ff). The logical
structure is also discussed in Prior Analytics 2.27.
```

## Extensions

### Topic Numbering

For the 28 topics in Chapter 23, use:

```yaml
extensions:
  aristotle_topic_number: 1
```

### Fallacious Forms

When a valid topic has a fallacious variant (or vice versa), document:

```yaml
extensions:
  fallacious_form:
    name: false-dichotomy
    description: "Presenting non-opposites as if they were contraries"
```

### Emotion Triads

Emotions in Book 2 are analyzed with a consistent structure. Capture:

```yaml
extensions:
  emotion_structure:
    definition: "What the emotion is"
    toward_whom: "Who we feel it toward"
    occasions: "What circumstances arouse it"
```

### Species Applicability

Some techniques are specific to one species of rhetoric:

```yaml
extensions:
  rhetoric_species: deliberative | judicial | epideictic | all
```

## Prior Knowledge

This source type (classical rhetoric treatise) has patterns that apply:

1. **Numbered lists are significant**: Aristotle's enumerations (28 topics, 3 species, etc.) should be preserved in extensions.

2. **Technical vocabulary is precise**: Greek terms have specific meanings. Preserve original terms and note when translations vary.

3. **Examples drive understanding**: The examples Aristotle uses are carefully chosen. Extract and contextualize them.

4. **Bidirectional by default**: Rhetorical techniques inherently work for both production and analysis.

5. **Audience adaptation matters**: Many techniques have audience-specific variations worth capturing.
