# Presentation Catalog Research

This directory contains research toward a catalog of presentation semantics — the
vocabulary of what code wants to communicate (intents) and how that communication
is realized (forms, techniques, patterns).

## Structure

```
presentation-catalog/
├── README.md                    # This file
├── extracts/                    # Fixed-point source extractions
│   ├── <source>/                # One directory per source
│   │   ├── _meta.md             # Source metadata (provenance, URLs)
│   │   ├── _original/           # Backup of original files
│   │   ├── _stash/              # Files that don't fit yet
│   │   ├── <item>.md            # Individual extracted items (leaf values)
│   │   └── ...
│   └── ...
├── _dimension/                  # Organizational views via symlinks
│   └── <dimension>/             # e.g., "intent", "technique", "anti-pattern"
│       └── <category>/          # e.g., "evidential", "comparative"
│           └── <item>.md        # Symlink to ../../../extracts/...
└── _stash/                      # Process artifacts, scripts, etc.
```

## Conventions

### Underscore Prefix

Files and directories with `_` prefix are **system/metadata** — not content values.

| Name | Purpose |
|------|---------|
| `_meta.md` | Metadata about the containing directory |
| `_notes.md` | Observations, tensions, questions (not restructuring) |
| `_original/` | Backups of files before processing |
| `_stash/` | Files that don't fit the structure yet |
| `_dimension/` | Symlink-based organizational views |

Anything **without** underscore prefix is a **content value** — a leaf item to be
categorized and organized.

### Leaf Files (Values)

Each leaf file represents one extracted item. Required frontmatter:

```yaml
---
source: <source-name>           # e.g., "aristotle-rhetoric", "tufte"
name: <item-name>               # Human-readable name
proposed-category: <category>   # Optional: suggested categorization
---
```

Additional frontmatter varies by source. For example, Tufte items include:

```yaml
---
source: tufte
chunk: ch1a                     # Which chunk of the book
modality: multimodal            # "multimodal" or "text-only"
proposed-category: Evidential
name: Reveal Data
---
```

The body contains the item's definition, examples, and other extracted content.

### Extracts (Fixed Points)

The `extracts/<source>/` directories are **fixed points** — immutable source data.
Each item file tracks its provenance in frontmatter, so it stands alone when read.

Do not reorganize or deduplicate within `extracts/`. Organization happens via
symlinks in `_dimension/`.

### Dimensions (Organizational Views)

The `_dimension/` directory contains symlink-based views that organize values
without moving or duplicating them.

Example: organizing by intent category

```
_dimension/intent/
├── evidential/
│   ├── reveal-data.md -> ../../extracts/tufte/ch1a-multimodal/reveal-data.md
│   └── claim-evidence.md -> ../../extracts/aristotle-rhetoric/claim-evidence.md
├── comparative/
│   └── enable-comparison.md -> ../../extracts/tufte/ch1a-multimodal/enable-comparison.md
└── ...
```

Multiple dimensions can coexist (intent, technique, anti-pattern, etc.). The same
item can appear in multiple categories if classification is uncertain.

Each source directory can also have its own local `_dimension/` for internal
organization before cross-source consolidation.

### Workflow

1. **Extract** — Run discovery against sources, split into leaf files with frontmatter
2. **Organize locally** — Use `_dimension/` within each source to categorize
3. **Organize globally** — Use top-level `_dimension/` to consolidate across sources
4. **Iterate** — Create alternative organizations as understanding improves

The symlink approach means organization is reversible and versioned — old views
can be kept while new ones are explored.

## Found Processes

Methodological insights discovered while working with this structure.

### Preserve extraction hypotheses

When organizing items, use `proposed-category` from frontmatter as-is. The
extraction agent had reasoning we may not have access to. Overwriting with
our own interpretation loses information.

**Do:** Build `_dimension/` structure following proposed categories exactly.

**Don't:** Restructure based on our judgment of what "fits better."

### Record observations, don't restructure

When reviewing organized items, observations about potential miscategorization
or structure issues should be recorded in `_notes.md`, not acted upon immediately.

This preserves:
- The extraction's original hypothesis
- Our observations as separate metadata
- The ability to see both perspectives

Restructuring happens later, informed by cross-source patterns.

### Catch-all categories signal data quality

When an extraction produces one large heterogeneous category (e.g., "Emotional"
with 11 diverse items), this may indicate:
- The extraction agent ran out of category ideas
- The source material grouped these together
- The extraction prompt was underspecified

Record this observation in `_notes.md` with specific items that seem out of place.
Cross-source comparison will reveal if this is systematic.

### Questions for cross-source comparison

When recording observations, frame them as questions that cross-source work
can answer:
- "Do other sources have similar catch-all categories?"
- "Does [item] appear in other sources? Under what category?"
- "Is [proposed category] a real pattern or extraction artifact?"
