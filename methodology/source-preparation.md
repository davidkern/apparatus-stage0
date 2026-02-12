# Source Preparation for Large PDFs

**Created**: 2026-02-11

## Purpose

Prepare large PDF sources for extraction by splitting them into manageable chunks. This is a prerequisite step before any extraction work (text-only or multimodal).

## When to Use

Use this process when:
- Source PDF exceeds ~30-40 pages
- Downstream extraction tasks will process chunks independently
- Source has natural semantic boundaries (chapters, sections)

Skip when:
- Source is already small enough for single-pass extraction
- Source lacks clear internal structure

## Prerequisites

PDF tools from `poppler-utils`:

```bash
# If not in devenv, use nix-shell
nix-shell -p poppler-utils --run "bash"

# Tools available:
# - pdfseparate: extract individual pages
# - pdfunite: combine pages into chunks
# - pdftotext: extract text from PDF
# - pdfinfo: get page count and metadata
```

## Procedure

### 1. Examine the Source

```bash
# Get page count and metadata
pdfinfo source.pdf

# View table of contents (if embedded)
pdftocdir source.pdf
```

Manually review the PDF to identify:
- Total page count
- Chapter/section boundaries
- Information density (text-heavy vs. graphics-heavy)
- Any front matter or back matter to exclude

### 2. Plan Chunk Boundaries

**Guiding principles:**
- Align with semantic structure (chapters, major sections)
- Target 10-20 pages per chunk as a baseline
- Adjust based on information density
- Keep related content together

**Empirical findings:**
- 40 pages: too much — context pressure degrades extraction quality
- 10-15 pages: generally works well
- Dense visual content may need smaller chunks
- Sparse text-heavy content can tolerate larger chunks

**Example chunk plans:**

Aristotle's Rhetoric (352 pages, 3 books, ~26 chapters):
```
b1-01-definition     pp. 1-19    (Book 1, Ch 1-3)
b1-02-deliberative   pp. 20-48   (Book 1, Ch 4-8)
b1-03-epideictic     pp. 49-66   (Book 1, Ch 9-12)
...
```

Tufte VDQI (191 pages, 9 chapters):
```
ch1a    pp. 1-20    (Chapter 1, first half)
ch1b    pp. 21-40   (Chapter 1, second half)
ch2a    pp. 41-55   (Chapter 2, first half)
...
```

### 3. Create Directory Structure

```
reference/<source>/
├── <source-full>.pdf           # Original source
├── _source.yaml                # Work metadata (required)
├── chunk-inventory.md          # Chunk documentation (required)
└── chunks/                     # Split chunks
    ├── <chunk-1>.pdf
    ├── <chunk-1>.txt           # Optional text extraction
    ├── <chunk-2>.pdf
    └── ...
```

### 4. Split the PDF

```bash
cd reference/<source>

# Extract page range to a chunk
# Note: pdfseparate extracts individual pages, then pdfunite combines them

# Method 1: Extract range directly with qpdf (if available)
qpdf source.pdf --pages . 1-19 -- chunks/chunk-01.pdf

# Method 2: Using pdfseparate + pdfunite
mkdir -p temp
pdfseparate -f 1 -l 19 source.pdf temp/page-%d.pdf
pdfunite temp/page-*.pdf chunks/chunk-01.pdf
rm -r temp

# Repeat for each chunk...
```

**Naming conventions:**
- Use descriptive slugs: `b2-05-argument.pdf`, `ch6-maximization.pdf`
- Include sequence hints if order matters: `01-intro.pdf`, `02-methods.pdf`
- Match naming to how you'll reference chunks in extraction prompts

### 5. Extract Text (Optional)

Text extraction is useful for:
- Text-only extraction passes
- Comparison with multimodal extraction
- Quick content verification

```bash
# Extract text from each chunk
for chunk in chunks/*.pdf; do
    pdftotext "$chunk" "${chunk%.pdf}.txt"
done
```

### 6. Verify Chunks

```bash
# Check page counts
for chunk in chunks/*.pdf; do
    echo -n "$chunk: "
    pdfinfo "$chunk" | grep Pages
done
```

**Critical: Verify semantic boundaries**

For each chunk, check:

1. **Chapter starts**: First page should show chapter/section heading (not mid-paragraph)
2. **Chapter ends**: Last page should complete a section (not cut mid-concept)
3. **Split boundaries**: Where chunks split mid-chapter, verify:
   - The split occurs at a section boundary, not mid-section
   - Neither chunk loses essential context for understanding

```bash
# Check first and last pages of each chunk
for chunk in chunks/*.pdf; do
    echo "=== $chunk ==="
    echo "First page:"
    pdftotext -f 1 -l 1 "$chunk" - | head -10
    pages=$(pdfinfo "$chunk" | grep Pages | awk '{print $2}')
    echo "Last page:"
    pdftotext -f $pages -l $pages "$chunk" - | head -10
    echo ""
done
```

**Common problems to catch:**
- Glob sorting issue: `page-100.pdf` sorts before `page-92.pdf` lexicographically
  - Fix: Use `sort -V` for version/numeric sorting
- Mid-section splits: Concept introduced at end of chunk A, elaborated at start of chunk B
  - Fix: Adjust boundary to keep section together
- Missing pages: Gap between chunk boundaries
  - Fix: Verify consecutive page numbers across chunks

### 7. Document the Chunking

Create `chunk-inventory.md`:

```markdown
# Chunk Inventory: <Source>

**Source**: <Full title>
**Total pages**: <N>
**Chunk count**: <N>
**Created**: <date>

## Chunks

| Chunk | Pages | Content |
|-------|-------|---------|
| ch1a | 1-20 | Introduction, definitions |
| ch1b | 21-40 | Historical examples |
| ... | ... | ... |
```

### 8. Create Source Metadata

Create `_source.yaml` with work metadata:

```yaml
work: "The Full Title of the Work"
author: "Author Name"
edition: "Edition info (optional)"
slug: source-slug
```

The `slug` field becomes the directory name in downstream pipelines.

### 9. Validate

Run the validation script to confirm the source is ready:

```bash
python research/presentation-catalog/_tools/validate-source.py reference/<source>/
```

The validator checks:
- `_source.yaml` exists with required fields
- `chunks/` directory contains PDF files
- `chunk-inventory.md` exists

Source preparation is complete when validation passes.

## Tool Reference

| Tool | Purpose | Example |
|------|---------|---------|
| `pdfinfo` | Get page count, metadata | `pdfinfo source.pdf` |
| `pdfseparate` | Extract individual pages | `pdfseparate -f 1 -l 10 source.pdf page-%d.pdf` |
| `pdfunite` | Combine pages into PDF | `pdfunite $(ls page-*.pdf \| sort -V) chunk.pdf` |
| `pdftotext` | Extract text | `pdftotext chunk.pdf chunk.txt` |
| `qpdf` | Direct page range extraction | `qpdf in.pdf --pages . 1-10 -- out.pdf` |

**Important**: When using `pdfseparate` + `pdfunite`, always use `sort -V` (version sort) to
order pages numerically. Shell glob `page-*.pdf` sorts lexicographically, causing `page-100.pdf`
to appear before `page-92.pdf`.

## Notes

- Page numbers in PDF tools are 1-indexed
- Some PDFs have logical page numbers different from physical pages (e.g., front matter numbered i, ii, iii)
- Very large PDFs (500+ pages) may benefit from scripting the split
- Always verify chunk boundaries by visual inspection
