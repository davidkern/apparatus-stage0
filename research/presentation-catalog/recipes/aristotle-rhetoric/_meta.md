# Aristotle's Rhetoric: Source Metadata

## Work Information

- **Title**: On Rhetoric (Rhetoric)
- **Author**: Aristotle
- **Translation**: George A. Kennedy (Oxford University Press, 2007)
- **Structure**: 3 Books
  - Book 1: Pisteis (Means of Persuasion) - Definition, species of rhetoric, deliberative/epideictic/judicial topics
  - Book 2: Continued pisteis - Emotions (pathos), character (ethos), common topics (topoi), enthymemes
  - Book 3: Style (lexis) and arrangement (taxis)

## Chunk Inventory

| Chunk ID | Content Coverage | File Path |
|----------|-----------------|-----------|
| `b1-01-definition` | Book 1, Chapters 1-3: Introduction, definition of rhetoric, pisteis, enthymemes | `reference/aristotle/chunks/b1-01-definition.txt` |
| `b1-02-deliberative` | Book 1, Chapters 4-8: Deliberative rhetoric topics (happiness, good, expediency) | `reference/aristotle/chunks/b1-02-deliberative.txt` |
| `b1-03-epideictic` | Book 1, Chapter 9: Epideictic rhetoric (praise and blame, virtue, nobility) | `reference/aristotle/chunks/b1-03-epideictic.txt` |
| `b1-04-judicial` | Book 1, Chapters 10-15: Judicial rhetoric (wrongdoing, pleasure, injustice, non-artistic proofs) | `reference/aristotle/chunks/b1-04-judicial.txt` |
| `b2-01-emotions-intro` | Book 2, Chapters 1-5: Introduction to emotions, anger, calmness, friendship | `reference/aristotle/chunks/b2-01-emotions-intro.txt` |
| `b2-02-emotions-fear` | Book 2, Chapters 5-8: Fear, confidence, shame, kindness | `reference/aristotle/chunks/b2-02-emotions-fear.txt` |
| `b2-03-emotions-envy` | Book 2, Chapters 9-11: Pity, indignation, envy, emulation | `reference/aristotle/chunks/b2-03-emotions-envy.txt` |
| `b2-04-character` | Book 2, Chapters 12-17: Character types by age and fortune | `reference/aristotle/chunks/b2-04-character.txt` |
| `b2-05-argument` | Book 2, Chapters 18-26: Common topics (28 topoi), fallacious enthymemes, refutation | `reference/aristotle/chunks/b2-05-argument.txt` |
| `b3-01-style-intro` | Book 3, Chapters 1-7: Introduction to style, clarity, appropriateness, rhythm | `reference/aristotle/chunks/b3-01-style-intro.txt` |
| `b3-02-style-metaphor` | Book 3, Chapters 8-12: Metaphor, simile, antithesis, vividness | `reference/aristotle/chunks/b3-02-style-metaphor.txt` |
| `b3-03-arrangement` | Book 3, Chapters 13-19: Parts of a speech (prooemion, narration, proof, epilogue) | `reference/aristotle/chunks/b3-03-arrangement.txt` |

## Reference System

### Primary Reference: Bekker Numbers

The standard scholarly reference system uses Bekker numbers, which appear in the margins of Kennedy's translation:

- Format: `[page][column][line]` (e.g., `1354a1`, `1397b15`)
- Page numbers: 1354-1420 for the Rhetoric
- Columns: `a` or `b` (left or right column of Bekker's 1831 edition)
- Line numbers: 1-35 approximately

### Secondary Reference: Book/Chapter/Section

Kennedy also uses structural divisions:

- Format: `Book [N], Chapter [M], Section [P]` or abbreviated `[N].[M].[P]`
- Example: `Book 2, Chapter 23, Section 1` or `2.23.1`

### Citation Practice

For recipe extraction, use both systems when available:

```yaml
source:
  location: "Book 2, Chapter 23, 1397a7"
```

The Bekker number provides precision; the chapter reference provides context.

### Kennedy's Footnotes

Kennedy provides extensive scholarly footnotes that often:
- Explain Greek terminology
- Reference parallel passages in Aristotle's other works (Topics, Analytics, Nicomachean Ethics)
- Note textual uncertainties or editorial decisions
- Provide historical context for examples

These footnotes are valuable for understanding nuance and should inform extraction.

## Schema Development

The recipe schema was refined based on observations from an initial extraction
pass (252 recipes, 12 files). Independent convergence across parallel tasks:

- **Bidirectionality** (6+ files noted this) → Added `direction` field with default guidance
- **Audience sensitivity** (4+ files) → Added `audience` field
- **Examples essential** (3+ files) → Body structure emphasizes examples
- **Warnings/limitations** (2+ files) → Added `warnings` field

These observations are incorporated into SCHEMA.md and `_context.md`.
