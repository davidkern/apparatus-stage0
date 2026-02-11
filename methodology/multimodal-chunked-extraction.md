# Multimodal Chunked Extraction Methodology

**Created**: 2026-02-10
**Source**: Intent discovery experiments on Tufte's "Visual Display of Quantitative Information"

## Purpose

Extract structured information from visually-rich documents (PDFs with figures, diagrams, examples) using a chunked multimodal approach that maximizes quality while managing context constraints.

## When to Use

Use this methodology when:
- Source material contains significant visual content (figures, diagrams, examples)
- Visual content demonstrates concepts that text alone describes
- Document exceeds ~15 pages (context pressure degrades multimodal quality)
- High-quality extraction matters more than speed

Skip this methodology when:
- Document is text-only or text-primary
- Document is under 15 pages (single-pass multimodal is fine)
- Speed matters more than completeness
- Visual content is decorative rather than informative

## Key Findings

| Finding | Implication |
|---------|-------------|
| Multimodal yield drops ~3x on 40pp vs 11pp documents | Chunk into 10-15 page sections |
| Text-only finds no unique high-quality items | Multimodal is essential for visual sources |
| Text-only is robust to document size | Use for comprehensive prose coverage |
| Focused sections find items full-pass misses | Multiple passes reveal more than single pass |
| ~60% of extracted items need filtering | Apply domain-specific quality criteria |

## Procedure

### Step 1: Prepare Materials

```bash
# Extract PDF pages into chunks (adjust page ranges as needed)
pdfseparate -f START -l END source.pdf chunk-%d.pdf
pdfunite chunk-*.pdf section-N.pdf

# Create parallel text extraction
pdftotext section-N.pdf section-N.txt
```

**Chunk size guidance:**
- 10-15 pages optimal for multimodal
- Align chunks with document structure (chapters, sections) when possible
- Dense visual content → smaller chunks
- Sparse visual content → larger chunks acceptable

### Step 2: Run Parallel Extraction

For each chunk, run two agent tasks in parallel:

**Multimodal task:**
```
You are extracting [DOMAIN] from source material.

First, read the framework/context document:
[FRAMEWORK_PATH]

Then read the source material:
[CHUNK_PDF_PATH]

This PDF contains both text and figures — you can see the graphics.

Your goal is to extract [WHAT_TO_EXTRACT].

Look for:
1. Explicit statements in prose
2. Named concepts with definitions
3. Purposes/patterns demonstrated by examples
4. Anti-patterns or negative examples

For each item you identify:
1. Name it
2. Definition
3. How it is articulated or demonstrated
4. Specific examples from this section
5. Category/taxonomy mapping

Write findings to: [OUTPUT_PATH_MULTIMODAL]

At the end, note which items came from:
- Explicit prose statements
- Visual examples you could see
- Discoveries from visual examination not named in text
```

**Text-only task:**
```
You are extracting [DOMAIN] from source material.

First, read the framework/context document:
[FRAMEWORK_PATH]

Then read the source material:
[CHUNK_TXT_PATH]

Note: The original contains figures that are not visible in this text
extraction — you only have the prose content.

Your goal is to extract [WHAT_TO_EXTRACT].

Look for:
1. Explicit statements in prose
2. Named concepts with definitions
3. Purposes/patterns described in text
4. Anti-patterns mentioned

For each item you identify:
1. Name it
2. Definition
3. How it is articulated
4. Any examples referenced (even if you can't see them)
5. Category/taxonomy mapping

Write findings to: [OUTPUT_PATH_TEXT]

At the end, note:
- Which items came from explicit prose
- Which items you inferred from descriptions of visuals you couldn't see
- Any limitations you encountered from not having visual access
```

### Step 3: Compare Per-Chunk Results

For each chunk, compare multimodal vs text-only:

| Question | What it reveals |
|----------|-----------------|
| What did both find? | Core items with strong prose support |
| What did only multimodal find? | Visual-only discoveries |
| What did only text find? | Items multimodal may have missed due to context |
| What limitations did text-only acknowledge? | Validation of multimodal value |

Create a comparison artifact for each chunk.

### Step 4: Apply Quality Filter

Domain-specific filtering to remove low-quality extractions.

**Generic quality criteria:**
- **Specificity**: Is it well-defined with clear boundaries?
- **Groundedness**: Is it supported by concrete evidence?
- **Actionability**: Could a practitioner use this?
- **Distinctiveness**: Is it genuinely different from other items?

**Example filter for communicative intents:**
- Is this a *purpose* that guides design choices, or a *quality* that results from good design?
- Can a presentation succeed at one intent while failing at this?
- What specific design choice does this intent guide?

**Common discard patterns:**
- Meta-qualities (clarity, efficiency, precision)
- Tautologies (purpose clarity = having a clear purpose)
- Historical context (how we got here, not what to do)
- Techniques masquerading as purposes

### Step 5: Consolidate Across Chunks

Merge findings from all chunks:

1. **Identify equivalents**: Same item with different names across chunks
2. **Identify hierarchy**: Some items contain others (parent/child)
3. **Identify redundancy**: Overlapping items that should merge
4. **Identify gaps**: Items mentioned in one chunk, detailed in another

Create consolidated output with:
- Unified item list
- Source tracking (which chunks contributed)
- Hierarchy relationships
- Confidence levels based on cross-chunk validation

### Step 6: Document Methodology Notes

Record for future reference:
- Token usage per chunk (multimodal vs text-only)
- Items discovered per chunk
- Quality filter decisions made
- Any chunk-specific issues

## Token Budget Guidance

Based on experimentation:

| Chunk Size | Multimodal Tokens | Text-Only Tokens | Quality |
|------------|-------------------|------------------|---------|
| 40 pages | ~97k | ~50k | Degraded |
| 11 pages | ~56k | ~22k | High |

**Rule of thumb**: Keep multimodal chunks under 60k tokens total usage.

For a 100-page document:
- ~7-10 chunks of 10-15 pages each
- ~400-600k total tokens for full multimodal coverage
- Compare against single-pass text-only (~100-150k) for cost/benefit

## Template Files

### Chunk Comparison Template

```markdown
# Chunk N Comparison: Multimodal vs Text-Only

## Quantitative Summary

| Metric | Multimodal | Text-Only |
|--------|------------|-----------|
| Items extracted | | |
| Token usage | | |
| Items/page | | |

## Items Found by Both

| Item | Multimodal Description | Text-Only Description |
|------|------------------------|----------------------|

## Items Only in Multimodal

| Item | Why Visual Required |
|------|---------------------|

## Items Only in Text-Only

| Item | Why Multimodal Missed |
|------|----------------------|

## Text-Only Acknowledged Limitations

[Quote limitations section from text-only output]
```

### Quality Filter Template

```markdown
# Quality Filter: [Domain]

## Inclusion Criteria

An item should be included if:
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

## Exclusion Patterns

Discard items that are:
- Pattern A (example)
- Pattern B (example)
- Pattern C (example)

## Filter Decisions

| Item | Include? | Reason |
|------|----------|--------|
```

### Consolidation Template

```markdown
# Consolidated Extraction: [Source]

## Summary

| Metric | Value |
|--------|-------|
| Chunks processed | |
| Total items before filter | |
| Total items after filter | |
| High confidence | |
| Needs refinement | |

## Tier 1: High Confidence

[Items with strong support across chunks]

## Tier 2: Needs Refinement

[Items found but requiring definition work]

## Tier 3: Consider Merging

[Items that may be duplicates or sub-items]

## Discarded

[Items filtered out, with reasons]

## Methodology Notes

[Token usage, issues encountered, lessons learned]
```

## Example Application

See `/work/apparatus-research/journal/2026-02-10-intent-consolidation/` for full example:

- `tufte-discovery-multimodal.md` — Full chapter multimodal (40pp)
- `tufte-discovery-text-only.md` — Full chapter text-only (40pp)
- `tufte-late-multimodal.md` — Focused section multimodal (11pp)
- `tufte-late-text-only.md` — Focused section text-only (11pp)
- `modality-comparison-results.md` — Full chapter comparison
- `modality-comparison-focused.md` — Focused section comparison
- `intent-quality-assessment.md` — Quality filter application

## Future Enhancements

- [ ] Script to automate PDF chunking
- [ ] Prompt templates as separate files
- [ ] Integration with catalog tooling
- [ ] Cost estimation based on page count
