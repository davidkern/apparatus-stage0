# Extraction Prompt: b1-04-judicial

## Task

Extract recipes from Aristotle's Rhetoric, Book 1, Chapters 10-15 (Judicial Rhetoric).

Follow the extraction procedure in `/work/apparatus-research/research/presentation-catalog/recipes/_generators/extract-recipes.md`.

## Source

- **File**: `/work/apparatus-research/reference/aristotle/chunks/b1-04-judicial.txt`
- **Work**: Rhetoric
- **Author**: Aristotle
- **Translation**: George A. Kennedy (Oxford, 2007)
- **Coverage**: Book 1, Chapters 10-15 (approximately 1368b1-1377b11)

## Context

Integrate guidance from:
- `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/_context.md`
- `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Content Focus

This chunk covers **judicial/forensic rhetoric** (dikanikon) — courtroom speeches about past actions.

### Core Topics to Extract

1. **Causes of Wrongdoing** — Why people commit injustice:
   - Voluntary vs. involuntary action
   - Through character (habit, desire)
   - Through reasoning (apparent good)
   - Conditions that lead to wrongdoing

2. **Topics about Pleasure (hedone)** — Since wrongdoing often stems from pleasure:
   - Definition and types of pleasure
   - What people find pleasant
   - Relationship to desire

3. **Topics about Justice/Injustice (dikaion/adikon)** — The central judicial concern:
   - Written vs. unwritten law
   - Universal vs. particular justice
   - Equity (epieikeia)

4. **Non-Artistic Proofs (pisteis atechnoi)** — Pre-existing evidence:
   - **Laws** (nomoi): How to use favorable/unfavorable laws
   - **Witnesses** (martyres): Living vs. ancient witnesses
   - **Contracts** (synthēkai): Written agreements
   - **Torture** (basanoi): Evidence from slaves
   - **Oaths** (horkoi): Offering, accepting, refusing oaths

5. **Degrees of Wrongdoing** — Making actions seem more or less serious:
   - Circumstances that aggravate
   - Circumstances that mitigate

### Extraction Hints

- The **non-artistic proofs** section is especially rich — each type (laws, witnesses, etc.) has techniques for both sides
- Aristotle explicitly shows how to argue both for and against each type of proof
- The pleasure analysis, while judicial context, applies broadly
- Look for the bilateral structure: "if X is favorable... if X is unfavorable..."

### Direction Guidance

- **Non-artistic proof techniques**: `both` (argue for your evidence, against opponent's)
- **Causes of wrongdoing**: `both` (construct accusations, construct defenses)
- **Justice/injustice topics**: `both` (argue either side)

### Extensions

For judicial-specific recipes:
```yaml
extensions:
  speech_species: ["judicial"]
  time_orientation: past  # Judicial concerns past actions
  proof_type: "non-artistic"  # For atechnoi pisteis
```

## Output

Create recipe files in: `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b1-04-judicial/`

Each file: `<slug>.md` conforming to SCHEMA.md

## Location References

Use Bekker numbers: `1372a1-5` or `Book 1, Chapter 12, 1372a1`

## Terminology

Preserve Greek terms:
- dikanikon (judicial, forensic)
- dikaion/adikon (just/unjust)
- hedone (pleasure)
- epieikeia (equity)
- pisteis atechnoi (non-artistic proofs)
- nomoi (laws)
- martyres (witnesses)
- synthēkai (contracts)
- basanoi (torture, examination)
- horkoi (oaths)

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b1-04-judicial/
```
