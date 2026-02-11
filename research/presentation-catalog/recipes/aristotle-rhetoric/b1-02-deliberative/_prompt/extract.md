# Extraction Prompt: b1-02-deliberative

## Task

Extract recipes from Aristotle's Rhetoric, Book 1, Chapters 4-8 (Deliberative Rhetoric).

Follow the extraction procedure in `/work/apparatus-research/research/presentation-catalog/recipes/_generators/extract-recipes.md`.

## Source

- **File**: `/work/apparatus-research/reference/aristotle/chunks/b1-02-deliberative.txt`
- **Work**: Rhetoric
- **Author**: Aristotle
- **Translation**: George A. Kennedy (Oxford, 2007)
- **Coverage**: Book 1, Chapters 4-8 (approximately 1359a30-1366a22)

## Context

Integrate guidance from:
- `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/_context.md`
- `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Content Focus

This chunk covers **deliberative rhetoric** (symbouleutikon) — speeches to assemblies about future action.

### Core Topics to Extract

1. **Topics of Happiness (eudaimonia)** — Components that constitute happiness:
   - Good birth, many friends, good friends
   - Wealth, good children, many children
   - Good old age, bodily excellences
   - Reputation, honor, good luck, virtue

2. **Topics of the Good (agathon)** — What counts as good:
   - Happiness itself and its components
   - What produces or preserves good
   - What prevents or destroys the opposite

3. **Topics of the Expedient/Advantageous (sympheron)** — What is beneficial:
   - Relation to the good
   - Political context of advantage

4. **Comparison Techniques (More/Less)** — How to argue something is greater or more important:
   - Techniques for amplification
   - Criteria for comparison

5. **Political Topics** — Specific subjects of deliberation:
   - Revenue and expenditure
   - War and peace
   - Defense of the country
   - Imports and exports
   - Legislation

### Extraction Hints

- Aristotle provides **lists** of components (e.g., parts of happiness) — these are recipe parameters
- Comparison techniques are explicit methods — extract as distinct recipes
- The "more and less" section contains systematic techniques
- Political topics may be too domain-specific for general recipes; focus on the rhetorical techniques

### Direction Guidance

Deliberative techniques typically work **bidirectionally**:
- Construction: How to argue for a course of action
- Recognition: How to analyze an opponent's deliberative arguments

Use `both` for most techniques.

### Extensions

For deliberative-specific recipes:
```yaml
extensions:
  speech_species: ["deliberative"]
  time_orientation: future  # Deliberative concerns the future
```

## Output

Create recipe files in: `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b1-02-deliberative/`

Each file: `<slug>.md` conforming to SCHEMA.md

## Location References

Use Bekker numbers: `1360a1-5` or `Book 1, Chapter 5, 1360a1`

## Terminology

Preserve Greek terms:
- symbouleutikon (deliberative)
- eudaimonia (happiness)
- agathon (good)
- sympheron (expedient, advantageous)
- auxesis (amplification)

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b1-02-deliberative/
```
