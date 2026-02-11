#!/usr/bin/env python3
"""Split extract.md files into individual item files with frontmatter."""

import re
from pathlib import Path

EXTRACTS_DIR = Path(__file__).parent / "extracts"


def slugify(name: str) -> str:
    """Convert intent name to filename slug."""
    # Replace spaces and special chars with hyphens, lowercase
    slug = re.sub(r"[^a-zA-Z0-9]+", "-", name.lower())
    slug = slug.strip("-")
    return slug


def parse_extract(content: str, source: str) -> tuple[str, list[dict]]:
    """Parse extract.md into meta section and list of items."""
    lines = content.split("\n")

    items = []
    meta_lines = []
    current_item = None
    current_category = None
    in_meta = True

    i = 0
    while i < len(lines):
        line = lines[i]

        # Check for category heading
        cat_match = re.match(
            r"^## (?:New Intent Category:|Intent Category:)\s*(.+)$", line
        )
        if cat_match:
            current_category = cat_match.group(1).strip()
            in_meta = False
            i += 1
            continue

        # Check for other ## headings that end meta section
        if line.startswith("## ") and in_meta:
            # Some other section - check if it looks like category proposal
            if "Category" in line or "Intent" in line:
                in_meta = False
            # Either way, we're past the meta section

        # Check for item heading
        item_match = re.match(r"^### Intent:\s*(.+)$", line)
        if item_match:
            # Save previous item
            if current_item:
                items.append(current_item)

            in_meta = False
            current_item = {
                "name": item_match.group(1).strip(),
                "proposed_category": current_category,
                "source": source,
                "body_lines": [],
            }
            i += 1
            continue

        # Check for non-intent ### heading (ends current item, might be section to skip)
        if line.startswith("### ") and current_item:
            # Save current item and reset
            items.append(current_item)
            current_item = None
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
        items.append(current_item)

    meta_content = "\n".join(meta_lines).strip()
    return meta_content, items


def write_item_file(item: dict, output_dir: Path):
    """Write a single item to its own file with frontmatter."""
    slug = slugify(item["name"])
    filepath = output_dir / f"{slug}.md"

    # Build frontmatter
    fm_lines = ["---"]
    fm_lines.append(f"source: {item['source']}")
    if item["proposed_category"]:
        fm_lines.append(f"proposed-category: {item['proposed_category']}")
    fm_lines.append(f"name: {item['name']}")
    fm_lines.append("---")

    # Clean up body - remove leading/trailing blank lines
    body = "\n".join(item["body_lines"]).strip()

    content = "\n".join(fm_lines) + "\n\n" + body + "\n"

    filepath.write_text(content)
    return filepath


def process_extract(source_dir: Path):
    """Process a single extract.md file."""
    extract_file = source_dir / "extract.md"
    if not extract_file.exists():
        return

    source = source_dir.name
    print(f"\nProcessing {source}...")

    content = extract_file.read_text()
    meta, items = parse_extract(content, source)

    # Write meta file
    if meta:
        meta_file = source_dir / "_meta.md"
        meta_file.write_text(meta + "\n")
        print("  Wrote _meta.md")

    # Write item files
    for item in items:
        filepath = write_item_file(item, source_dir)
        print(f"  Wrote {filepath.name}")

    print(f"  Total: {len(items)} items")

    # Rename original to indicate it's been processed
    extract_file.rename(source_dir / "_original-extract.md")


def main():
    for source_dir in sorted(EXTRACTS_DIR.iterdir()):
        if source_dir.is_dir() and (source_dir / "extract.md").exists():
            process_extract(source_dir)


if __name__ == "__main__":
    main()
