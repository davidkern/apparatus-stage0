# Consolidate Tufte VDQI Recipes

Instantiated prompt for consolidating extracted recipes from all chunks.

---

You are consolidating recipes extracted from multiple chunks into a coherent collection.

## Generator

Read for guidance: `/work/apparatus-research/research/presentation-catalog/recipes/_generators/consolidate-source.md`

## Source Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/_context.md`

## Input

Recipe files from chunk directories:
- `tufte-vdqi/ch1-excellence/*.md`
- `tufte-vdqi/ch2-integrity/*.md`
- `tufte-vdqi/ch3-sources/*.md`
- `tufte-vdqi/ch4-data-ink/*.md`
- `tufte-vdqi/ch5-chartjunk/*.md`
- `tufte-vdqi/ch6-maximization/*.md`
- `tufte-vdqi/ch7-multifunctioning/*.md`
- `tufte-vdqi/ch8-resolution/*.md`
- `tufte-vdqi/ch9-aesthetics/*.md`

Exclude `_prompt/` directories.

## Consolidation Tasks

### 1. Cross-Reference Resolution

Fill in `related` fields that were left as TBD during extraction:

```yaml
related:
  - slug: data-ink-ratio
    relationship: contains  # If this recipe is part of a larger technique
  - slug: chartjunk-moire
    relationship: contrasts  # If this recipe is the opposite approach
```

Common relationships to look for in Tufte:
- **contains / contained-by**: Principles that include specific techniques
- **contrasts**: Good practice vs. chartjunk
- **variant-of**: Different applications of the same principle
- **combines-with**: Techniques often used together

### 2. Deduplication

Check for recipes that may have been extracted from multiple chunks:
- The same principle stated in different chapters
- Techniques discussed in both theory and practice sections

When duplicates found:
- Keep the most complete version
- Merge unique content from duplicates
- Update location to reference all relevant passages

### 3. Hierarchy Verification

Verify that Tufte's hierarchical principles are captured correctly:

**Level 1 - Foundational Principle**:
- "Above all else show the data"

**Level 2 - Core Metrics**:
- Data-ink ratio
- Lie Factor
- Data density

**Level 3 - Techniques**:
- Erasing non-data-ink
- Erasing redundant data-ink
- Redesigning bar charts
- etc.

Each technique should relate back to the principles it serves.

### 4. Consistency Check

Ensure consistent treatment of:
- `direction`: Most Tufte techniques should be `both` or `construction`
- `extensions.data_ink_effect`: Applied consistently where relevant
- Figure references: All visual examples properly cited

### 5. Gap Analysis

Check for missing recipes that should have been extracted:
- All named principles from Chapter 4
- All chartjunk types from Chapter 5
- All redesign techniques from Chapter 6
- All graphic types discussed throughout

Report any gaps for follow-up extraction.

## Output

1. Updated recipe files with filled `related` fields
2. Consolidated recipes (merged duplicates)
3. Gap report listing any missing recipes
4. Summary of cross-references established

## Validation

Run validation after consolidation:

```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py tufte-vdqi/
```

Fix any errors before completing.
