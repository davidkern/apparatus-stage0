# Aristotle Rhetoric — Extraction Context

Source-specific guidance for extracting recipes from Aristotle's Rhetoric.

## Source Location Format

Use Bekker numbers for `source.location`:

```yaml
source:
  work: Rhetoric
  author: Aristotle
  location: "Book 2, Chapter 23, 1397a7-15"
  original_term: ek tōn enantiōn
```

Format: `Book N, Chapter M, <bekker-start>[-<bekker-end>]`

## Greek Terms

Include the Greek term when Aristotle names a technique:

```yaml
source:
  original_term: enthymēma
```

Use transliterated Greek (not Greek alphabet) for accessibility.
Kennedy's translation often includes these in brackets or footnotes.

## The Three Pisteis

Aristotle's central framework — three means of persuasion:
- **Ethos** (ēthos) — character/credibility of speaker
- **Pathos** (pathos) — emotional state of audience
- **Logos** (logos) — the argument itself

Many recipes involve one or more pisteis. Note this in the description when relevant.

## Book Structure

- **Book 1**: Definition and content (what to argue)
  - Species: deliberative, judicial, epideictic
  - Topics for each species

- **Book 2**: Audience and argument patterns (how to argue)
  - Emotions and character types (Ch. 1-17)
  - 28 valid topics for enthymemes (Ch. 23)
  - 9 fallacious topics (Ch. 24)
  - Refutation and objection (Ch. 25-26)

- **Book 3**: Style and arrangement (how to present)
  - Lexis (style, word choice, metaphor)
  - Taxis (arrangement, speech structure)

## Bidirectionality

Most Aristotelian techniques work bidirectionally:
- **Construction**: Use topic X to build an argument
- **Recognition**: Identify when opponent uses topic X (to refute)

Default to `direction: both` unless the technique is clearly one-way.

## Fallacious Topics (Book 2, Chapter 24)

Aristotle catalogs 9 apparent enthymemes (fallacies). These are valuable for
recognition. Use:

```yaml
extensions:
  fallacious: true
  fallacy_type: "false cause"  # or similar description
```

## Kennedy's Commentary

The translation includes substantial scholarly notes. These often:
- Cross-reference the Topics, Poetics, Politics
- Explain historical context
- Note textual variants

Include relevant commentary insights in the Notes section.

## Emotional Recipes (Book 2, Ch. 1-11)

Emotions follow a consistent structure:
- State of mind that produces the emotion
- Target (who/what the emotion is directed at)
- Causes that trigger it

Consider using `extensions` for this pattern:

```yaml
extensions:
  emotion_structure:
    state: "slight received"
    target: "one who slighted"
    causes: ["contempt", "spite", "insolence"]
```

## Character Types (Book 2, Ch. 12-17)

These are audience profiles (youth, elderly, wealthy, etc.), not techniques.
They describe how to adapt arguments to audience character.

If extracting these, note they differ from argument patterns:

```yaml
extensions:
  recipe_type: audience-adaptation
```
