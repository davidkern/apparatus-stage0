# Tufte Visual Display - Full Extraction Plan

**Date**: 2026-02-10
**Source**: tufte_visual_display_of_quantitative_information_low-res_text.pdf (191 pages)
**Method**: Multimodal chunked extraction per methodology

## Page Mapping

PDF page = book page - 3 (front matter offset)

## Chunk Definition

| Chunk | Book Pages | PDF Pages | Size | Content |
|-------|------------|-----------|------|---------|
| ch1a | 13-32 | 10-29 | 20pp | Graphical Excellence (first half) |
| ch1b | 33-52 | 30-49 | 20pp | Graphical Excellence (second half) |
| ch2a | 53-65 | 50-62 | 13pp | Graphical Integrity (first half) |
| ch2b | 66-78 | 63-75 | 13pp | Graphical Integrity (second half) |
| ch3-4a | 79-92 | 76-89 | 14pp | Sources + Data-Ink (first half) |
| ch3-4b | 93-106 | 90-103 | 14pp | Data-Ink (second half) |
| ch5-6a | 107-122 | 104-119 | 16pp | Chartjunk + Data-Ink Max (first) |
| ch5-6b | 123-138 | 120-135 | 16pp | Data-Ink Max (second half) |
| ch7a | 139-149 | 136-146 | 11pp | Multifunctioning (first half) |
| ch7b | 150-160 | 147-157 | 11pp | Multifunctioning (second half) |
| ch8-9a | 161-175 | 158-172 | 15pp | Data Density + Small Multiples |
| ch8-9b | 176-190 | 173-187 | 15pp | Aesthetics + Epilogue |

## Phase Structure

| Phase | Chunks | Agents | Content Focus |
|-------|--------|--------|---------------|
| 1 | ch1a, ch1b | 4 | Graphical Excellence |
| 2 | ch2a, ch2b | 4 | Graphical Integrity |
| 3 | ch3-4a, ch3-4b | 4 | Sources + Data-Ink |
| 4 | ch5-6a, ch5-6b | 4 | Chartjunk + Data-Ink Max |
| 5 | ch7a, ch7b | 4 | Multifunctioning Elements |
| 6 | ch8-9a, ch8-9b | 4 | Data Density + Aesthetics |

Each phase: 2 chunks × 2 modalities = 4 parallel agents

## Quality Gates

After each phase:
- [ ] Check token usage (expect ~25-35k multimodal, ~15-20k text per chunk)
- [ ] Verify outputs written correctly
- [ ] Spot-check intent count and quality
- [ ] Abort if significant issues

## Output Structure

```
research/intent-extraction/tufte/
├── extraction-plan.md (this file)
├── chunks/
│   ├── ch1a-multimodal.md
│   ├── ch1a-text-only.md
│   ├── ch1b-multimodal.md
│   ├── ch1b-text-only.md
│   └── ... (24 files total)
├── comparisons/
│   ├── ch1a-comparison.md
│   ├── ch1b-comparison.md
│   └── ... (12 files)
├── quality-filter.md
└── consolidation.md
```

## Status

| Phase | Status | Notes |
|-------|--------|-------|
| 1 | complete | ch1a, ch1b — 4 agents |
| 2 | complete | ch2a, ch2b — 4 agents |
| 3 | complete | ch3-4a, ch3-4b — 4 agents |
| 4 | complete | ch5-6a, ch5-6b — 4 agents |
| 5 | complete | ch7a, ch7b — 4 agents |
| 6 | complete | ch8-9a, ch8-9b — 4 agents |
| Consolidation | pending | |

## Results Summary

- **24 agent tasks** completed (12 chunks × 2 modalities)
- **7,556 lines** of extraction output
- **~170 multimodal intents**, **~130 text-only intents** (with overlap)

## Prompts Used

### Multimodal Prompt Template

```
You are extracting communicative intents from data visualization literature.

First, read the framework document:
/work/apparatus/catalog/framework.md

Then read the source material:
/work/apparatus-research/reference/tufte/[CHUNK].pdf

This is pages [RANGE] from [CHAPTER] of Tufte's "Visual Display of
Quantitative Information." The PDF contains both text and figures.

Extract **communicative intents** — the purposes that data graphics serve.

For each intent:
1. Name (concise, actionable)
2. Definition (what communicative purpose it serves)
3. How Tufte articulates or demonstrates it
4. Specific examples from these pages
5. Framework category mapping

Write to: /work/apparatus-research/research/intent-extraction/tufte/chunks/[CHUNK]-multimodal.md

At the end, categorize which intents came from explicit prose, visual
examples, or visual-only discoveries.
```

### Text-Only Prompt Template

```
You are extracting communicative intents from data visualization literature.

First, read the framework document:
/work/apparatus/catalog/framework.md

Then read the source material:
/work/apparatus-research/reference/tufte/[CHUNK].txt

This is text extraction of pages [RANGE] from [CHAPTER] of Tufte's "Visual
Display of Quantitative Information."

Extract **communicative intents** — the purposes that data graphics serve.

For each intent:
1. Name (concise, actionable)
2. Definition (what communicative purpose it serves)
3. How Tufte articulates it
4. Examples referenced
5. Framework category mapping

Write to: /work/apparatus-research/research/intent-extraction/tufte/chunks/[CHUNK]-text-only.md

Note which intents came from explicit prose vs inferred, and any limitations
from lacking visual access.
```
