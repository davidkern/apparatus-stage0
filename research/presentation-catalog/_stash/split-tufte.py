#!/usr/bin/env python3
"""Split Tufte chunk files into individual item files with frontmatter."""

import re
from pathlib import Path

TUFTE_DIR = Path(__file__).parent / "extracts" / "tufte"
CHUNKS_DIR = TUFTE_DIR / "chunks"


def slugify(name: str) -> str:
    """Convert intent name to filename slug."""
    slug = re.sub(r"[^a-zA-Z0-9]+", "-", name.lower())
    slug = slug.strip("-")
    return slug


def parse_chunk_filename(filename: str) -> tuple[str, str]:
    """Extract chunk and modality from filename like 'ch1a-multimodal.md'."""
    stem = filename.replace(".md", "")
    if "-multimodal" in stem:
        chunk = stem.replace("-multimodal", "")
        modality = "multimodal"
    elif "-text-only" in stem:
        chunk = stem.replace("-text-only", "")
        modality = "text-only"
    else:
        chunk = stem
        modality = "unknown"
    return chunk, modality


def extract_category(body: str) -> str | None:
    """Extract proposed category from Framework category line."""
    match = re.search(r"\*\*Framework category\*\*:\s*\*\*([^*]+)\*\*", body)
    if match:
        return match.group(1).strip()
    return None


def parse_chunk(content: str, chunk: str, modality: str) -> tuple[str, list[dict]]:
    """Parse chunk file into meta section and list of items."""
    lines = content.split("\n")

    items = []
    meta_lines = []
    current_item = None
    in_meta = True

    i = 0
    while i < len(lines):
        line = lines[i]

        # Check for item heading: ### N. Name or ### Name
        item_match = re.match(r"^### (?:\d+\.\s*)?(.+)$", line)
        if item_match and not line.startswith("### Extracted"):
            # Save previous item
            if current_item:
                # Extract category from body before saving
                body = "\n".join(current_item["body_lines"])
                current_item["proposed_category"] = extract_category(body)
                items.append(current_item)

            in_meta = False
            current_item = {
                "name": item_match.group(1).strip(),
                "chunk": chunk,
                "modality": modality,
                "body_lines": [],
            }
            i += 1
            continue

        # Check for ## heading that starts content section
        if line.startswith("## ") and in_meta:
            in_meta = False
            i += 1
            continue

        # Accumulate content
        if current_item:
            current_item["body_lines"].append(line)
        elif in_meta:
            meta_lines.append(line)

        i += 1

    # Don't forget last item
    if current_item:
        body = "\n".join(current_item["body_lines"])
        current_item["proposed_category"] = extract_category(body)
        items.append(current_item)

    meta_content = "\n".join(meta_lines).strip()
    return meta_content, items


def write_item_file(item: dict, output_dir: Path):
    """Write a single item to its own file with frontmatter."""
    slug = slugify(item["name"])
    filepath = output_dir / f"{slug}.md"

    # Build frontmatter
    fm_lines = ["---"]
    fm_lines.append("source: tufte")
    fm_lines.append(f"chunk: {item['chunk']}")
    fm_lines.append(f"modality: {item['modality']}")
    if item.get("proposed_category"):
        fm_lines.append(f"proposed-category: {item['proposed_category']}")
    fm_lines.append(f"name: {item['name']}")
    fm_lines.append("---")

    # Clean up body - remove leading/trailing blank lines
    body = "\n".join(item["body_lines"]).strip()

    content = "\n".join(fm_lines) + "\n\n" + body + "\n"

    filepath.write_text(content)
    return filepath


def process_chunk(chunk_file: Path):
    """Process a single chunk file."""
    chunk, modality = parse_chunk_filename(chunk_file.name)
    output_dir = TUFTE_DIR / f"{chunk}-{modality}"
    output_dir.mkdir(exist_ok=True)

    print(f"\nProcessing {chunk_file.name}...")

    content = chunk_file.read_text()
    meta, items = parse_chunk(content, chunk, modality)

    # Write meta file
    if meta:
        meta_file = output_dir / "_meta.md"
        meta_file.write_text(meta + "\n")
        print("  Wrote _meta.md")

    # Write item files
    for item in items:
        filepath = write_item_file(item, output_dir)
        print(f"  Wrote {filepath.name}")

    print(f"  Total: {len(items)} items")


def main():
    if not CHUNKS_DIR.exists():
        print(f"Chunks directory not found: {CHUNKS_DIR}")
        return

    for chunk_file in sorted(CHUNKS_DIR.glob("*.md")):
        process_chunk(chunk_file)

    # Rename chunks dir to indicate processed
    CHUNKS_DIR.rename(TUFTE_DIR / "_original-chunks")
    print("\nRenamed chunks/ to _original-chunks/")


if __name__ == "__main__":
    main()
