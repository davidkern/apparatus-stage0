# Extraction Prompt: b3-03-arrangement

## Task

Extract recipes from Aristotle's Rhetoric, Book 3, Chapters 13-19 (Parts of a Speech).

Follow the extraction procedure in `/work/apparatus-research/research/presentation-catalog/recipes/_generators/extract-recipes.md`.

## Source

- **File**: `/work/apparatus-research/reference/aristotle/chunks/b3-03-arrangement.txt`
- **Work**: Rhetoric
- **Author**: Aristotle
- **Translation**: George A. Kennedy (Oxford, 2007)
- **Coverage**: Book 3, Chapters 13-19 (approximately 1414a29-1420b4)

## Context

Integrate guidance from:
- `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/_context.md`
- `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Content Focus

This chunk covers **arrangement (taxis)** — the structure of speeches and functions of each part.

### Core Topics to Extract

1. **Essential Parts** — Chapter 13:
   - Statement (prothesis): What the speech is about
   - Proof (pistis): Arguments supporting the statement
   - These two are necessary; others are additions

2. **Prooemion (Introduction)** — Chapters 14-15:
   - Purpose: Prepare the audience, signal the subject
   - Techniques for capturing attention
   - Removing prejudice (diabole)
   - Epideictic vs. deliberative vs. judicial proems
   - Length and timing

3. **Narration (diēgēsis)** — Chapter 16:
   - Purpose: State the facts
   - Ethical narration (revealing character)
   - Emotional narration (evoking pathos)
   - Length: As much as needed
   - Positioning in different speech types

4. **Proof (pistis)** — Chapter 17:
   - Placement of proofs
   - Handling objections
   - Amplification in proof
   - Order of arguments
   - Character proof in the proof section

5. **Interrogation (erōtēsis)** — Chapter 18:
   - When to use questions
   - Types of questions
   - How to answer questions

6. **Epilogue (epilogos)** — Chapter 19:
   - Four functions:
     1. Disposing audience favorably toward speaker, unfavorably toward opponent
     2. Amplifying and diminishing
     3. Moving audience to emotion (pathos)
     4. Recapitulation (anamnēsis)
   - Techniques for each function
   - The asyndeton ending

### Extraction Hints

- Each **speech part** (prooemion, narration, proof, epilogue) should be a recipe
- The **four functions of the epilogue** are especially explicit
- Note **species-specific variations** (how each part differs for judicial/deliberative/epideictic)
- The "removing prejudice" (diabole) section has specific techniques
- **Interrogation** is a distinct technique with clear rules

### Direction Guidance

- **Speech parts**: `construction` (how to compose each part)
- **Prooemion techniques**: `both` (create engaging openings, recognize opponent's tactics)
- **Narration**: `construction` (how to present facts effectively)
- **Epilogue**: `construction` (how to conclude persuasively)
- **Interrogation**: `both` (how to question and how to answer)

### Extensions

For speech structure:
```yaml
extensions:
  speech_part: "prooemion" | "narration" | "proof" | "epilogue" | "interrogation"
  species_variations:
    deliberative: "..."
    epideictic: "..."
    judicial: "..."
```

For epilogue functions:
```yaml
extensions:
  epilogue_function: "disposition" | "amplification" | "emotion" | "recapitulation"
```

## Output

Create recipe files in: `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b3-03-arrangement/`

Each file: `<slug>.md` conforming to SCHEMA.md

## Location References

Use Bekker numbers: `1414b1-5` or `Book 3, Chapter 14, 1414b1`

## Terminology

Preserve Greek terms:
- taxis (arrangement, order)
- prothesis (statement, proposition)
- pistis (proof)
- prooimion (prooemion, introduction)
- diēgēsis (narration)
- epilogos (epilogue, conclusion)
- erōtēsis (interrogation, questioning)
- diabole (prejudice, slander)
- anamnēsis (recapitulation, reminder)
- asyndeton (without connectives)

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b3-03-arrangement/
```
