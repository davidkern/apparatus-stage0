# Prompt: Generate Chunk Extraction Structure

## Generator

Follow: `/work/apparatus-research/research/presentation-catalog/recipes/_generators/generate-chunk-extractions.md`

## Context

Read and integrate: `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/_context.md`

## References

- Recipe schema: `/work/apparatus-research/research/presentation-catalog/recipes/SCHEMA.md`
- Root context: `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`
- Extraction procedure: `/work/apparatus-research/research/presentation-catalog/recipes/_generators/extract-recipes.md`

## Chunks to Generate

Create extraction prompts for each of these chunks:

| Chunk ID | Source File | Focus |
|----------|-------------|-------|
| b1-01-definition | b1-01-definition.txt | Rhetorical foundations: pisteis, enthymeme, paradigm |
| b1-02-deliberative | b1-02-deliberative.txt | Deliberative topics: happiness, good, expedient |
| b1-03-epideictic | b1-03-epideictic.txt | Epideictic techniques: virtue, praise, amplification |
| b1-04-judicial | b1-04-judicial.txt | Judicial topics: wrongdoing, pleasure, non-artistic proofs |
| b2-01-emotions-intro | b2-01-emotions-intro.txt | Emotion foundations, anger, calmness, friendship, fear intro |
| b2-02-emotions-fear | b2-02-emotions-fear.txt | Fear, confidence, shame, shamelessness, kindness |
| b2-03-emotions-envy | b2-03-emotions-envy.txt | Pity, indignation, envy, emulation |
| b2-04-character | b2-04-character.txt | Character types: youth, old age, prime, fortune |
| b2-05-argument | b2-05-argument.txt | Common topics (28), maxims, apparent enthymemes, refutation |
| b3-01-style-intro | b3-01-style-intro.txt | Style foundations: clarity, appropriateness, prose rhythm |
| b3-02-style-metaphor | b3-02-style-metaphor.txt | Metaphor, simile, wit, written vs. spoken style |
| b3-03-arrangement | b3-03-arrangement.txt | Speech parts: prooemion, narration, proof, epilogue |

## Output Structure

For each chunk, create:

```
aristotle-rhetoric/<chunk-id>/
└── _prompt/
    └── extract.md
```

## Extraction Prompt Template

Each `extract.md` should:

1. Reference the extraction procedure
2. Integrate the source context
3. Specify the source file path
4. Describe what content this chunk covers
5. Provide chunk-specific extraction hints

## Chunk-Specific Guidance

### Book 1 Chunks

**b1-01-definition**: Core definitional content. Look for:
- Definition of rhetoric itself
- The three artistic proofs (ethos, pathos, logos)
- Enthymeme and paradigm as logical modes
- Probability, signs, necessary signs

**b1-02-deliberative**: Deliberative rhetoric's special topics. Look for:
- Topics of happiness and its components
- Topics of the good
- Topics of the expedient/advantageous
- Comparison techniques (more/less)

**b1-03-epideictic**: Epideictic techniques. Look for:
- Virtue and its species
- Praise and blame techniques
- Amplification methods
- Noble and shameful

**b1-04-judicial**: Judicial rhetoric's special topics. Look for:
- Causes of wrongdoing
- Topics about pleasure
- Topics about justice/injustice
- Non-artistic proofs (witnesses, contracts, torture, oaths, laws)

### Book 2 Emotion Chunks

**b2-01-emotions-intro**: Foundation for emotion chapters. Look for:
- Triadic structure (state of mind, target, causes)
- Anger: definition, causes, targets
- Calmness: definition, causes
- Friendship and enmity
- Fear introduction

**b2-02-emotions-fear**: Continuation of emotions. Look for:
- Fear and confidence
- Shame and shamelessness
- Kindness and unkindness

**b2-03-emotions-envy**: Final emotion chapters. Look for:
- Pity
- Indignation (righteous anger at undeserved fortune)
- Envy
- Emulation

### Book 2 Argument Chunk

**b2-05-argument**: Dense with explicit recipes. Look for:
- The 28 common topics (numbered, named techniques)
- Maxim types and uses
- Apparent/fallacious enthymemes (9 types)
- Refutation techniques (lysis)
- Amplification as non-topic

### Book 3 Chunks

**b3-01-style-intro**: Style foundations. Look for:
- Clarity (to saphes)
- Appropriateness (to prepon)
- Prose rhythm patterns
- Metaphor basics

**b3-02-style-metaphor**: Advanced style. Look for:
- Metaphor types (proportion, genus/species)
- Simile vs. metaphor
- Wit and urbanity (asteia)
- Written vs. spoken style differences

**b3-03-arrangement**: Speech structure. Look for:
- Essential parts (statement, proof) vs. optional
- Prooemion techniques
- Narration techniques (ethical, emotional)
- Proof organization
- Epilogue components (ethos, amplification, pathos, recapitulation)

## Notes

- Text files should be used (not PDFs) for extraction
- Source path: `/work/apparatus-research/reference/aristotle/chunks/`
- Kennedy's translation preserves Greek terms in parentheses - use these for `original_term`
- Expect high recipe density in b2-05-argument (28+ explicit topics)
