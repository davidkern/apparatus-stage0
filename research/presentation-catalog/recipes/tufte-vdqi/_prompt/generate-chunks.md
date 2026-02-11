# Generate Chunk Extractions for Tufte VDQI

Instantiated prompt for generating chunk subdirectories and extraction prompts.

---

You are generating chunk-level structure for recipe extraction.

## Generator

Read for guidance: `/work/apparatus-research/research/presentation-catalog/recipes/_generators/generate-multimodal-chunk-extractions.md`

## Source Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/_context.md`

## Source Material

Directory: `/work/apparatus-research/reference/tufte/visual-display-quantitative/`

## Chunk Structure

Create the following chunk directories, each with `_prompt/extract.md`:

| Chunk | Directory | PDF Files | Content |
|-------|-----------|-----------|---------|
| Part I Intro + Ch.1 | `ch1-excellence/` | ch1-graphical-excellence.pdf, ch1a.pdf, ch1b.pdf, ch1-late-section.pdf | Graphical Excellence principles |
| Chapter 2 | `ch2-integrity/` | ch2a.pdf, ch2b.pdf | Graphical Integrity, Lie Factor |
| Chapter 3 | `ch3-sources/` | ch3-4a.pdf (first ~7 pages) | Sources of integrity and sophistication |
| Chapter 4 | `ch4-data-ink/` | ch3-4a.pdf (latter part), ch3-4b.pdf | Data-ink ratio, erasing principles |
| Chapter 5 | `ch5-chartjunk/` | ch5-6a.pdf | Chartjunk types |
| Chapter 6 | `ch6-maximization/` | ch5-6b.pdf | Data-ink maximization, redesigns |
| Chapter 7 | `ch7-multifunctioning/` | ch7a.pdf, ch7b.pdf | Multifunctioning elements |
| Chapter 8 | `ch8-resolution/` | ch8-9a.pdf | High-resolution, data density |
| Chapter 9 | `ch9-aesthetics/` | ch8-9b.pdf | Aesthetics and technique |

## Output Structure

```
tufte-vdqi/
├── _context.md                    (exists)
├── _prompt/
│   ├── generate-chunks.md         (this file)
│   └── consolidate.md             (create)
├── ch1-excellence/
│   └── _prompt/
│       └── extract.md
├── ch2-integrity/
│   └── _prompt/
│       └── extract.md
├── ch3-sources/
│   └── _prompt/
│       └── extract.md
├── ch4-data-ink/
│   └── _prompt/
│       └── extract.md
├── ch5-chartjunk/
│   └── _prompt/
│       └── extract.md
├── ch6-maximization/
│   └── _prompt/
│       └── extract.md
├── ch7-multifunctioning/
│   └── _prompt/
│       └── extract.md
├── ch8-resolution/
│   └── _prompt/
│       └── extract.md
└── ch9-aesthetics/
    └── _prompt/
        └── extract.md
```

## Extraction Prompt Template

Each `extract.md` should:

1. Reference the source `_context.md`
2. Specify which PDF files to examine
3. Note what content/principles this chapter covers
4. Include visual extraction guidance from multimodal generator
5. Reference `recipes/SCHEMA.md` for output format
6. Reference `recipes/_context.md` for general extraction guidance

## Special Considerations

### Ch3-4 Split

The ch3-4a.pdf file contains both Chapter 3 (Sources) and the beginning of Chapter 4
(Data-Ink). The extraction prompts should clarify:
- ch3-sources: Extract from ch3-4a.pdf, focusing on pages discussing news graphics,
  sophistication measures, and the "conclusion" before Part II
- ch4-data-ink: Extract from ch3-4a.pdf starting at "Part II: Theory of Data Graphics"
  through ch3-4b.pdf

### Visual Density

Chapters 4-6 have the highest density of visual examples and redesign demonstrations.
Extraction prompts for these chapters should emphasize:
- Before/after comparisons
- Step-by-step erasing demonstrations
- Specific figure references

### Principle Derivation

Chapters 1, 4, and 9 contain Tufte's named principles. Extraction prompts should
instruct extractors to look for quotable principle statements.

## Task

1. Create all chunk directories with `_prompt/` subdirectories
2. Create self-contained `extract.md` for each chunk
3. Create `_prompt/consolidate.md` for post-extraction consolidation
4. Ensure each extraction prompt can stand alone (includes all necessary references)

## Agency

You may:
- Adjust chunk boundaries if examination of PDFs reveals better splits
- Add chunk-specific `_context.md` files if a chapter needs particular guidance
- Emphasize different aspects (principles vs. techniques) per chapter
