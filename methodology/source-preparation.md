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

PDF tools are available in devenv:

- `qpdf` — direct page range extraction (preferred)
- `pdfseparate` — extract individual pages
- `pdfunite` — combine pages into chunks
- `pdftotext` — extract text from PDF
- `pdfinfo` — get page count and metadata

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

### 3. Create Directory Structure

```
reference/<source>/
├── <source-full>.pdf           # Original source
├── _source.yaml                # Metadata and chunk inventory
└── chunks/                     # Split chunks
    ├── <chunk-1>.pdf
    ├── <chunk-1>.txt           # Optional text extraction
    ├── <chunk-2>.pdf
    └── ...
```

### 4. Split the PDF

```bash
cd reference/<source>
mkdir -p chunks

# Extract page range to a chunk
qpdf source.pdf --pages . 1-19 -- chunks/chunk-01.pdf
qpdf source.pdf --pages . 20-40 -- chunks/chunk-02.pdf
# ... repeat for each chunk
```

**Naming conventions:**
- Use descriptive slugs: `b2-05-argument.pdf`, `ch6-maximization.pdf`
- Include sequence hints if order matters: `01-intro.pdf`, `02-methods.pdf`
- The chunk filename (without .pdf) becomes the chunk `id` in _source.yaml

### 5. Extract Text (Optional)

Text extraction is useful for:
- Text-only extraction passes
- Comparison with multimodal extraction
- Quick content verification

```bash
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
3. **Split boundaries**: Where chunks split mid-chapter, verify the split occurs at a section boundary

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
- Glob sorting: `page-100.pdf` sorts before `page-92.pdf` — use `sort -V`
- Mid-section splits: adjust boundary to keep section together
- Missing pages: verify consecutive page numbers across chunks

### 7. Create Source Metadata

Create `_source.yaml` with work metadata and chunk inventory:

```yaml
work: "The Full Title of the Work"
author: "Author Name"
edition: "Edition info (optional)"
translator: "Translator Name (if applicable)"
slug: source-slug
pages: 352
page_offset: 15  # Optional: if PDF pages differ from book pages
created: 2026-02-11

chunks:
  - id: ch1-intro
    pages: 1-20
    content: "Chapter 1: Introduction"
  - id: ch2a-methods
    pages: 21-40
    content: "Chapter 2, first half: Methods"
  # ... one entry per chunk

notes:
  - "Any relevant observations about the source"
  - "Chunking decisions, boundary notes, etc."
```

**Required fields:**
- `work`: Full title
- `author`: Author name
- `slug`: URL-safe identifier (becomes directory name in pipelines)
- `chunks`: Array of chunk objects, each with `id`, `pages`, `content`

**Optional fields:**
- `edition`, `translator`, `pages`, `page_offset`, `created`, `notes`

### 8. Validate

Run the validation script to confirm the source is ready:

```bash
python research/presentation-catalog/_tools/validate-source.py reference/<source>/
```

The validator checks:
- `_source.yaml` exists with required fields
- Each chunk has `id`, `pages`, `content`
- `chunks/` directory contains PDF for each chunk id

Source preparation is complete when validation passes.

## Tool Reference

| Tool | Purpose | Example |
|------|---------|---------|
| `qpdf` | Extract page range | `qpdf in.pdf --pages . 1-10 -- out.pdf` |
| `pdfinfo` | Get page count, metadata | `pdfinfo source.pdf` |
| `pdftotext` | Extract text | `pdftotext chunk.pdf chunk.txt` |

## Notes

- Page numbers in PDF tools are 1-indexed
- Some PDFs have logical page numbers different from physical pages (use `page_offset`)
- Very large PDFs (500+ pages) may benefit from scripting the split
- Always verify chunk boundaries by visual inspection
