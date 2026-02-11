# Extraction Prompt: b1-01-definition

## Task

Extract recipes from Aristotle's Rhetoric, Book 1, Chapters 1-2 (Definition of Rhetoric).

Follow the extraction procedure in `/work/apparatus-research/research/presentation-catalog/recipes/_generators/extract-recipes.md`.

## Source

- **File**: `/work/apparatus-research/reference/aristotle/chunks/b1-01-definition.txt`
- **Work**: Rhetoric
- **Author**: Aristotle
- **Translation**: George A. Kennedy (Oxford, 2007)
- **Coverage**: Book 1, Chapters 1-2 (approximately 1354a1-1358a35)

## Context

Integrate guidance from:
- `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/_context.md`
- `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Content Focus

This chunk contains the **foundational definitions** of Aristotelian rhetoric:

### Core Concepts to Extract

1. **Definition of rhetoric itself** — Rhetoric as the counterpart of dialectic, the faculty of discovering means of persuasion

2. **The three artistic proofs (pisteis entechnoi)**:
   - **Ethos**: Character of the speaker as means of persuasion
   - **Pathos**: Putting the audience into a certain emotional state
   - **Logos**: Argument from the speech itself

3. **Enthymeme** — The rhetorical syllogism; "the body of proof"
   - Distinction from logical syllogism
   - Based on probabilities and signs

4. **Paradigm (paradeigma)** — Rhetorical induction
   - Use of examples to establish general claims

5. **Probability (eikos)** — What happens for the most part
   - As a basis for rhetorical reasoning

6. **Signs (semeion, tekmerion)**:
   - Fallible signs (semeia)
   - Necessary/irrefutable signs (tekmeria)

### Extraction Hints

- Look for Aristotle's explicit definitions — he often signals these with "let X be defined as..."
- The enthymeme receives extensive treatment; may yield multiple recipes (types, uses)
- Distinguish between the three proofs as separate recipes if they have distinct structures
- Note the relationship between rhetoric and dialectic — Aristotle draws parallels throughout

### Direction Guidance

Most techniques here work **bidirectionally**:
- Construction: How to build persuasive arguments using these forms
- Recognition: How to identify what proofs an opponent is using

Default to `both` unless clearly one-directional.

## Output

Create recipe files in: `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b1-01-definition/`

Each file: `<slug>.md` conforming to SCHEMA.md

## Location References

Use Bekker numbers for the `location` field:
- Format: `1356a1-5` or `Book 1, Chapter 2, 1356a1`
- Kennedy's translation includes these in margins

## Terminology

Preserve Greek terms in `original_term` field:
- pistis/pisteis (proof)
- enthymema (enthymeme)
- paradeigma (paradigm)
- eikos (probability)
- semeion (sign)
- tekmerion (necessary sign)

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b1-01-definition/
```

Fix all errors before completing.
