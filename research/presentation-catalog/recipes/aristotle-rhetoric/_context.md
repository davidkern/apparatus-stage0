# Source Context: Aristotle's Rhetoric

## Work Information

- **Title**: Rhetoric (also: On Rhetoric, Ars Rhetorica)
- **Author**: Aristotle (384-322 BCE)
- **Translation**: George A. Kennedy (Oxford University Press, 2007)
- **Original Language**: Ancient Greek

### Structure

The Rhetoric is organized into three books:

- **Book 1**: Definition of rhetoric, means of persuasion (pisteis), three species of rhetoric
  (deliberative, epideictic, judicial), and special topics (idia) for each species
- **Book 2**: Character (ethos) and emotions (pathos) as means of persuasion, followed by
  common topics (koina) for constructing enthymemes
- **Book 3**: Style (lexis) and arrangement (taxis) of speeches

The work represents Aristotle's lectures at the Lyceum, likely compiled over years. Books 1-2
originally formed a unit on "invention" (discovering what to say); Book 3 on style and
arrangement may have been added later.

## Chunk Inventory

| Chunk ID | File | Book | Content Coverage |
|----------|------|------|------------------|
| b1-01-definition | b1-01-definition.txt | 1 | Chs. 1-2: Definition of rhetoric, pisteis, enthymeme, paradigm |
| b1-02-deliberative | b1-02-deliberative.txt | 1 | Chs. 4-8: Deliberative rhetoric, topics of happiness, good, expedient |
| b1-03-epideictic | b1-03-epideictic.txt | 1 | Ch. 9: Epideictic rhetoric, virtue, praise/blame, amplification |
| b1-04-judicial | b1-04-judicial.txt | 1 | Chs. 10-15: Judicial rhetoric, wrongdoing, non-artistic proofs |
| b2-01-emotions-intro | b2-01-emotions-intro.txt | 2 | Chs. 1-5: Introduction to pathos, anger, calmness, friendship, fear |
| b2-02-emotions-fear | b2-02-emotions-fear.txt | 2 | Chs. 5-7: Fear, confidence, shame, shamelessness, kindness |
| b2-03-emotions-envy | b2-03-emotions-envy.txt | 2 | Chs. 8-11: Pity, indignation, envy, emulation |
| b2-04-character | b2-04-character.txt | 2 | Chs. 12-17: Character types by age and fortune |
| b2-05-argument | b2-05-argument.txt | 2 | Chs. 18-26: Common topics, enthymemes, maxims, refutation |
| b3-01-style-intro | b3-01-style-intro.txt | 3 | Chs. 1-6: Introduction to style, clarity, metaphor, prose rhythm |
| b3-02-style-metaphor | b3-02-style-metaphor.txt | 3 | Chs. 7-12: Appropriateness, metaphor types, wit, written vs. spoken |
| b3-03-arrangement | b3-03-arrangement.txt | 3 | Chs. 13-19: Parts of a speech, prooemion, narration, proof, epilogue |

**Source files**: Both PDF and plain text (.txt) versions available. Text files are extracted
from the Kennedy translation and should be used for extraction.

**Source path**: `/work/apparatus-research/reference/aristotle/chunks/`

## Reference System

Use Bekker numbers for location references. Bekker numbers are the standard scholarly
citation system for Aristotle's works, based on the 1831 Berlin Academy edition.

Format: `[page][column][line]` where:
- Page: 1354-1420 for the Rhetoric
- Column: a or b
- Line: 1-40 approximately

### YAML Examples

```yaml
source:
  work: Rhetoric
  author: Aristotle
  location: "1356a1-5"  # Bekker number range
  original_term: enthymema  # Greek term if relevant
```

```yaml
source:
  work: Rhetoric
  author: Aristotle
  location: "Book 2, Chapter 23, 1397a7"  # Combined format for clarity
```

When a technique spans multiple passages, use the primary location where it is defined
or most fully explained.

## Terminology Guidance

### Key Terms to Preserve

| Greek | Transliteration | Kennedy Translation | Notes |
|-------|-----------------|---------------------|-------|
| pistis/pisteis | pistis | proof, means of persuasion | Central concept - artistic vs. non-artistic |
| enthymema | enthymeme | enthymeme | Rhetorical syllogism |
| paradeigma | paradigm | example, paradigm | Rhetorical induction |
| topos/topoi | topos | topic | "Place" to find arguments |
| ethos | ethos | character | Speaker's credibility |
| pathos | pathos | emotion | Audience's emotional state |
| logos | logos | argument, speech, reason | Logical argument |
| lexis | lexis | style | Word choice, expression |
| taxis | taxis | arrangement | Speech structure |
| eikos | eikos | probability | Probable argument |
| semeion | semeion | sign | Sign argument |
| tekmerion | tekmerion | necessary sign | Irrefutable sign |
| gnome | gnome | maxim | General statement |
| auxesis | auxesis | amplification | Making something seem greater |

### Rhetorical Species

- **Deliberative** (symbouleutikon): Assembly speeches about future action
- **Epideictic** (epideiktikon): Ceremonial speeches of praise/blame
- **Judicial/Forensic** (dikanikon): Courtroom speeches about past action

### Technical Distinctions

- **Artistic (entechnoi) proofs**: Created by the speaker (ethos, pathos, logos)
- **Non-artistic (atechnoi) proofs**: Pre-existing (witnesses, contracts, torture, oaths)
- **Common topics (koina)**: Strategies applicable across all subjects
- **Special topics (idia)**: Premises specific to a subject domain

## Extraction Guidance

### What to Extract

1. **Named techniques**: The 28 topics of enthymemes (Book 2, Ch. 23) are explicit recipes
2. **Emotion triads**: Each emotion has three components (state of mind, target, causes)
3. **Speech parts**: Prooemion, narration, proof, epilogue have distinct purposes
4. **Style devices**: Metaphor types, prose rhythm patterns, clarity techniques
5. **Fallacious forms**: Apparent enthymemes (Book 2, Ch. 24) - extraction as warnings
6. **Character adaptations**: How to adapt speech to audience character types

### Direction Hints

Most techniques in the Rhetoric work bidirectionally:
- **Construction**: How to create persuasive arguments
- **Recognition**: How to identify and refute opponent's arguments

Aristotle explicitly discusses both uses, especially in Book 2 (refutation techniques).
Default to `both` unless the technique is clearly one-directional.

### Structural Patterns

Many recipes will have:
- **Components**: The elements that make up the technique
- **Parameters**: What varies in application (domain, audience, etc.)
- **Warnings**: Aristotle frequently notes when techniques can fail or backfire

### Extensions to Consider

```yaml
extensions:
  aristotle_topic_number: 1-28  # For the 28 common topics
  emotion_triad:
    state_of_mind: "..."
    toward_whom: "..."
    causes: "..."
  fallacious_form:
    name: "..."
    description: "..."
  speech_species: ["deliberative", "epideictic", "judicial"]
```

### Cross-Reference Notes

Aristotle frequently references his other works:
- **Topics**: Dialectical techniques, many shared with rhetoric
- **Analytics**: Logical foundations of syllogism
- **Nicomachean Ethics**: Virtue, character, happiness
- **Politics**: Context for deliberative rhetoric
- **Poetics**: Shared concepts like metaphor

Note these in recipe `Notes` section but don't create dependencies on external works.

## Extraction Strategy

Given the 12 chunks and the structured nature of the Rhetoric:

1. **Book 1 chunks**: Focus on the three species of rhetoric and their special topics
2. **Book 2 emotion chunks**: Extract emotion recipes with their triadic structure
3. **Book 2 argument chunk**: Extract the 28 common topics as individual recipes
4. **Book 3 chunks**: Extract style devices and speech structure techniques

Expect significant recipe density in:
- **b2-05-argument**: The 28 topics chapter alone yields 28+ recipes
- **b2-01 through b2-03**: Each emotion is a potential recipe
- **b3-03-arrangement**: Each speech part has associated techniques
