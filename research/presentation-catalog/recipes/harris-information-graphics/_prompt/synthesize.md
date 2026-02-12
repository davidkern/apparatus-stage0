# Synthesize Harris Information Graphics Collection

## Purpose

You are transforming extracted recipe files into a knowledge structure that supports **intent-driven visualization selection**. The target system accepts user intent (what they want to communicate) and data characteristics as input, and produces appropriate visualization guidance as output.

Harris's encyclopedia is organized alphabetically by chart name. Your task is to restructure this knowledge around **purpose**, **technique**, and **data requirements** so the system can traverse from intent to construction.

## Source Material

**Read from** (treat as read-only):
- `harris-information-graphics/[chunk-dirs]/*.md` - Extracted recipes organized by PDF chunks
- `harris-information-graphics/_context.md` - Source context and terminology

**Write to**:
- `harris-information-graphics/_synthesized/` - All output goes here

You may use any combination of:
- Markdown files (`.md`)
- YAML files (`.yaml`) for structured data and mappings
- Directory structure to represent hierarchy
- Symlinks to avoid duplication where appropriate

## What to Expect

The chunk-based extraction created predictable patterns you'll encounter:

**Split entries**: Harris entries that span chunk boundaries were extracted twice. For example, "Flow Chart" (pp. 153-156) may appear in both chunk 10 and chunk 11. These fragments should be unified.

**Cross-reference mentions**: Harris discusses topics in multiple places. "Mosaic graph" has its own entry (p. 242) but is also mentioned in "Bar Graph" (p. 48), "Column Graph" (p. 90), and "Graph" (p. 172). The main entry has construction details; mentions elsewhere add context or examples.

**Identifying primary vs. secondary**: The `source.location` field reveals this:
- `"Mosaic Graph, p. 242"` - This IS the entry (primary)
- `"Bar Graph, Mosaic graph, p. 48"` - Mentioned within another entry (secondary)

**The "Stacked" chunk**: Chunk 22 (S3-slope-stacked) contains many brief treatments of stacking applied to various chart types. These are usually secondary to fuller treatments in each chart type's main entry.

## Phase 1: Analysis

Read across all source recipes to identify the conceptual structure. Produce `_synthesized/analysis.md` documenting:

### 1.1 Communication Intents

What goals do these visualizations serve? Extract the distinct purposes.

Examples you might find:
- Compare values across categories
- Show change over time
- Reveal part-to-whole relationships
- Display distribution of values
- Expose correlation between variables
- Show flow or process
- Depict hierarchy or structure
- Display geographic patterns

For each intent, note which chart types serve it.

### 1.2 Reusable Techniques

What construction patterns appear across multiple chart types? These are techniques independent of specific chart forms.

Examples you might find:
- **Stacking**: Cumulative display where series build on each other (applies to bar, column, line, area)
- **Grouping**: Side-by-side arrangement for comparison (applies to bar, column)
- **100% normalization**: Converting to proportions (applies to stacked bar, stacked column, stacked area)
- **Circular arrangement**: Wrapping linear forms around a circle (applies to bar, column, line, area)
- **Matrix arrangement**: Grid of small multiples (applies to scatter, line, any chart type)
- **Proportional sizing**: Encoding value in area or volume (applies to symbols, bubbles, pies)
- **Connecting/linking**: Lines between related elements (applies to stacked forms, flow charts)

For each technique, note which chart types use it and what it accomplishes.

### 1.3 Data Requirements

What data characteristics constrain visualization choices?

Dimensions to consider:
- Axis types: categorical, sequential (time), quantitative
- Series: single series, multiple series, hierarchical
- Values: positive only, positive and negative, percentages
- Relationships: independent categories, ordered sequence, continuous range

### 1.4 Shared Components

What building blocks do chart types share?

Examples: axes, scales (linear, log, category), grid lines, legends, labels, reference lines

### 1.5 Fragment Inventory

List cases where the same concept appears in multiple source files. Note which is primary (main entry) and which are secondary (mentions within other entries). This informs Phase 3 synthesis.

## Phase 2: Structure Design

Based on your analysis, design the target structure. Produce `_synthesized/structure.md` proposing:

### 2.1 Organization Scheme

How will the synthesized collection be organized? Consider:

```
_synthesized/
  intents/           # What user wants to communicate
  techniques/        # Reusable construction patterns
  chart-types/       # Unified chart type recipes
  components/        # Shared building blocks
  data-types/        # Data characteristic definitions
  mappings/          # Relationships between layers
```

Or a different organization if your analysis suggests one.

### 2.2 Recipe Transformations

How will source recipes become synthesized recipes?

- Some map 1:1 (a chart type stays a chart type)
- Some need merging (fragments become one unified recipe)
- Some need extraction (stacking technique pulled out of multiple chart type recipes)
- Some need restructuring (construction steps separated from selection guidance)

### 2.3 Relationship Representation

How will you represent:
- Intent → Chart Type mappings (which charts serve which purposes)
- Technique → Chart Type mappings (which techniques each chart uses)
- Data Requirements → Chart Type constraints (what data works with what)
- Chart Type → Component composition (what parts make up each chart)

Consider YAML for structured mappings, directory structure for hierarchy, symlinks for shared references.

### 2.4 Key Decisions

Document any structural decisions and their rationale. What trade-offs did you consider?

## Phase 3: Synthesis

Build the new structure. For each element:

### Chart Types

Create unified recipes that:
- Merge content from all source files discussing that chart type
- Preserve Harris's construction guidance (how to build)
- Preserve Harris's selection guidance (when to use, warnings)
- Link to the intents this chart type serves
- Link to the techniques this chart type employs
- Specify data requirements
- Reference component recipes for shared elements

### Techniques

Create technique recipes that:
- Describe the pattern abstractly (what stacking IS)
- List chart types that use this technique
- Explain what the technique accomplishes (cumulative display, comparison, etc.)
- Note variations (stacking with connection lines, etc.)

### Intents

Create intent entries that:
- Describe the communication goal
- List chart types that serve this intent
- Note which might be preferred under what conditions
- Link to relevant techniques

### Mappings

Create structured mappings (YAML recommended) that enable traversal:
- Given intent + data characteristics → candidate chart types
- Given chart type → construction techniques + components needed

## Quality Criteria

The synthesis succeeds if:

1. **No knowledge lost**: Everything Harris says about a topic is captured (unified from fragments)
2. **Intent-navigable**: A user can start with "I want to show X" and find appropriate charts
3. **Technique-aware**: Cross-cutting patterns are explicit, not buried in individual chart recipes
4. **Construction-complete**: Someone could build each chart type from the guidance
5. **Selection-informed**: Guidance on when to use (and when not to use) each option

## Process Notes

- Work iteratively: Analysis may reveal structure; structure may require re-analysis
- Document uncertainties: If Harris is ambiguous or you must interpret, note it
- Preserve provenance: Synthesized recipes should note which source files contributed
- Validate coverage: After synthesis, verify all source recipes contributed to the output
