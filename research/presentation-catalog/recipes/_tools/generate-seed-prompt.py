#!/usr/bin/env python3
"""
Generate a seed prompt for recipe extraction from a validated source.

Usage: generate-seed-prompt.py <source-dir>

Reads _source.yaml from the source directory and generates a minimal
seed prompt at recipes/_prompt/setup-<slug>.md

The generated prompt contains only mechanical information derived from
the source metadata. No interpretive content is added — that's the job
of the setup task which runs independently.
"""

import sys
import yaml
from pathlib import Path

# Paths relative to this script
SCRIPT_DIR = Path(__file__).parent
RECIPES_DIR = SCRIPT_DIR.parent
PROMPT_DIR = RECIPES_DIR / "_prompt"

TEMPLATE = """\
# Setup Source: {work}

You are setting up a new source for recipe extraction.

## Generator

Read for guidance: `{generator_path}`

## Parameters

- **Source material**: `{source_path}`
- **Work**: {work}
- **Author**: {author}
{edition_line}- **Output directory**: `{output_path}`

## References

- Recipe schema: `{schema_path}`
- Root context: `{context_path}`
- Chunk inventory: `{inventory_path}`
"""


def generate_prompt(source_dir: Path) -> str:
    """Generate seed prompt content from source metadata."""
    source_yaml = source_dir / "_source.yaml"

    with open(source_yaml) as f:
        meta = yaml.safe_load(f)

    work = meta["work"]
    author = meta["author"]
    slug = meta["slug"]
    edition = meta.get("edition")

    # Build paths (absolute for clarity in prompts)
    source_path = source_dir.resolve()
    output_path = RECIPES_DIR.resolve() / slug
    generator_path = RECIPES_DIR.resolve() / "_generators" / "setup-source.md"
    schema_path = RECIPES_DIR.resolve() / "SCHEMA.md"
    context_path = RECIPES_DIR.resolve() / "_context.md"
    inventory_path = source_dir.resolve() / "chunk-inventory.md"

    edition_line = f"- **Edition**: {edition}\n" if edition else ""

    return TEMPLATE.format(
        work=work,
        author=author,
        edition_line=edition_line,
        source_path=source_path,
        output_path=output_path,
        generator_path=generator_path,
        schema_path=schema_path,
        context_path=context_path,
        inventory_path=inventory_path,
    )


def main():
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <source-dir>")
        sys.exit(1)

    source_dir = Path(sys.argv[1])

    # Validate source exists
    source_yaml = source_dir / "_source.yaml"
    if not source_yaml.exists():
        print(f"Error: {source_yaml} not found")
        print("Run validate-source.py first to check source preparation")
        sys.exit(1)

    # Load metadata
    with open(source_yaml) as f:
        meta = yaml.safe_load(f)

    slug = meta.get("slug")
    if not slug:
        print(f"Error: 'slug' field missing in {source_yaml}")
        sys.exit(1)

    # Generate prompt
    content = generate_prompt(source_dir)

    # Write to prompt directory
    PROMPT_DIR.mkdir(exist_ok=True)
    output_file = PROMPT_DIR / f"setup-{slug}.md"

    with open(output_file, "w") as f:
        f.write(content)

    print(f"Generated: {output_file}")


if __name__ == "__main__":
    main()
