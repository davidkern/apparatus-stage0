#!/usr/bin/env python3
"""Split extract.md files into individual item files with frontmatter.

Handles hierarchical structure:
- ## New Intent Category: X  -> proposed-category
- ## Something Intents: Y    -> proposed-group
- ### Intent: Name           -> individual item
"""

import re
from pathlib import Path
from collections import defaultdict

EXTRACTS_DIR = Path(__file__).parent.parent / "extracts"


def slugify(name: str) -> str:
    """Convert intent name to filename slug."""
    slug = re.sub(r"[^a-zA-Z0-9]+", "-", name.lower())
    slug = slug.strip("-")
    return slug


def parse_section_heading(line: str) -> tuple[str | None, str | None]:
    """Parse a ## heading to extract category or group.

    Returns (category, group) where one will be set and other None.
    """
    # ## New Intent Category: X
    match = re.match(r"^## New Intent Category:\s*(.+)$", line)
    if match:
        return (match.group(1).strip(), None)

    # ## Intent Category: X (variant)
    match = re.match(r"^## Intent Category:\s*(.+)$", line)
    if match:
        return (match.group(1).strip(), None)

    # ## Something Intents: Y  or  ## Something Intents
    match = re.match(r"^## (.+?)\s*Intents?(?::\s*(.+))?$", line)
    if match:
        group_prefix = match.group(1).strip()
        group_suffix = match.group(2).strip() if match.group(2) else None
        # Use the more specific part if available
        group_name = group_suffix if group_suffix else group_prefix
        return (None, group_name)

    return (None, None)


def parse_extract(content: str, source: str) -> tuple[str, list[dict]]:
    """Parse extract.md into meta section and list of items."""
    lines = content.split("\n")

    items = []
    meta_lines = []
    current_item = None
    current_category = None
    current_group = None
    in_meta = True
    past_first_category = False

    i = 0
    while i < len(lines):
        line = lines[i]

        # Check for ## section heading
        if line.startswith("## "):
            category, group = parse_section_heading(line)

            if category:
                current_category = category
                current_group = None  # Reset group when category changes
                past_first_category = True
                in_meta = False
            elif group:
                current_group = group
                past_first_category = True
                in_meta = False
            else:
                # Other ## heading (Sources, Summary, etc.)
                if not past_first_category:
                    # Still in meta section
                    meta_lines.append(line)
                # If we're past first category, these are non-item sections (Summary, Open Questions)
                # Save current item if any
                if current_item:
                    items.append(current_item)
                    current_item = None
            i += 1
            continue

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
                "proposed_group": current_group,
                "source": source,
                "body_lines": [],
            }
            i += 1
            continue

        # Check for non-intent ### heading (ends current item)
        if line.startswith("### ") and current_item:
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
    if item["proposed_group"]:
        fm_lines.append(f"proposed-group: {item['proposed_group']}")
    fm_lines.append(f"name: {item['name']}")
    fm_lines.append("---")

    # Clean up body - remove leading/trailing blank lines
    body = "\n".join(item["body_lines"]).strip()

    content = "\n".join(fm_lines) + "\n\n" + body + "\n"

    filepath.write_text(content)
    return filepath


def process_extract(source_dir: Path):
    """Process a single extract.md file."""
    # Look for original extract
    extract_file = source_dir / "_original" / "extract.md"
    if not extract_file.exists():
        # Try old location
        extract_file = source_dir / "extract.md"
    if not extract_file.exists():
        return

    source = source_dir.name
    print(f"\nProcessing {source}...")

    content = extract_file.read_text()
    meta, items = parse_extract(content, source)

    # Write/update meta file
    if meta:
        meta_file = source_dir / "_meta.md"
        meta_file.write_text(meta + "\n")
        print("  Wrote _meta.md")

    # Write item files
    for item in items:
        filepath = write_item_file(item, source_dir)
        cat = item.get("proposed_category") or "(none)"
        grp = item.get("proposed_group") or ""
        grp_str = f" / {grp}" if grp else ""
        print(f"  {filepath.name}: {cat}{grp_str}")

    print(f"  Total: {len(items)} items")

    # Summary by category/group
    by_cat = defaultdict(lambda: defaultdict(list))
    for item in items:
        cat = item.get("proposed_category") or "(none)"
        grp = item.get("proposed_group") or "(none)"
        by_cat[cat][grp].append(item["name"])

    print("\n  Structure:")
    for cat, groups in sorted(by_cat.items()):
        for grp, names in sorted(groups.items()):
            if grp == "(none)":
                print(f"    {cat}: {len(names)} items")
            else:
                print(f"    {cat} / {grp}: {len(names)} items")


def main():
    for source_dir in sorted(EXTRACTS_DIR.iterdir()):
        if source_dir.is_dir() and source_dir.name != "tufte":
            if (source_dir / "_original" / "extract.md").exists():
                process_extract(source_dir)


if __name__ == "__main__":
    main()
