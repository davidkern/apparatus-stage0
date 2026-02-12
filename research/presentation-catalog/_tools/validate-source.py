#!/usr/bin/env python3
"""
Validate that a source directory is ready for downstream pipelines.

Usage: validate-source.py <source-dir>

Checks:
  1. _source.yaml exists and has required fields
  2. chunks/ directory exists with PDF files
  3. chunk-inventory.md exists

Exit codes:
  0 - validation passed
  1 - validation failed
"""

import sys
import yaml
from pathlib import Path

REQUIRED_FIELDS = ["work", "author", "slug"]


def validate_source(source_dir: Path) -> list[str]:
    """Validate source directory, return list of errors."""
    errors = []

    # Check _source.yaml
    source_yaml = source_dir / "_source.yaml"
    if not source_yaml.exists():
        errors.append(f"Missing: {source_yaml}")
    else:
        try:
            with open(source_yaml) as f:
                meta = yaml.safe_load(f)
            if meta is None:
                errors.append(f"Empty or invalid YAML: {source_yaml}")
            else:
                for field in REQUIRED_FIELDS:
                    if field not in meta:
                        errors.append(
                            f"Missing required field '{field}' in {source_yaml}"
                        )
        except yaml.YAMLError as e:
            errors.append(f"YAML parse error in {source_yaml}: {e}")

    # Check chunks directory
    chunks_dir = source_dir / "chunks"
    if not chunks_dir.exists():
        errors.append(f"Missing: {chunks_dir}/")
    elif not chunks_dir.is_dir():
        errors.append(f"Not a directory: {chunks_dir}")
    else:
        pdfs = list(chunks_dir.glob("*.pdf"))
        if not pdfs:
            errors.append(f"No PDF files found in {chunks_dir}/")

    # Check chunk inventory
    inventory = source_dir / "chunk-inventory.md"
    if not inventory.exists():
        errors.append(f"Missing: {inventory}")

    return errors


def main():
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <source-dir>")
        sys.exit(1)

    source_dir = Path(sys.argv[1])
    if not source_dir.exists():
        print(f"Error: {source_dir} does not exist")
        sys.exit(1)

    errors = validate_source(source_dir)

    if errors:
        print(f"Validation FAILED for {source_dir}:")
        for error in errors:
            print(f"  - {error}")
        sys.exit(1)
    else:
        # Load and display summary
        with open(source_dir / "_source.yaml") as f:
            meta = yaml.safe_load(f)
        chunks = list((source_dir / "chunks").glob("*.pdf"))

        print(f"Validation PASSED for {source_dir}")
        print(f"  Work: {meta.get('work')}")
        print(f"  Author: {meta.get('author')}")
        print(f"  Slug: {meta.get('slug')}")
        print(f"  Chunks: {len(chunks)}")
        sys.exit(0)


if __name__ == "__main__":
    main()
