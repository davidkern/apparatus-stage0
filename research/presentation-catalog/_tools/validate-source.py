#!/usr/bin/env python3
"""
Validate that a source directory is ready for downstream pipelines.

Usage: validate-source.py <source-dir>

Checks _source.yaml against the required schema:
  - Required fields: work, author, slug, chunks
  - Each chunk must have: id, pages, content
  - chunks/ directory must exist with matching PDF files

Exit codes:
  0 - validation passed
  1 - validation failed
"""

import sys
import yaml
from pathlib import Path

REQUIRED_FIELDS = ["work", "author", "slug", "chunks"]
REQUIRED_CHUNK_FIELDS = ["id", "pages", "content"]


def validate_source(source_dir: Path) -> list[str]:
    """Validate source directory, return list of errors."""
    errors = []

    # Check _source.yaml exists
    source_yaml = source_dir / "_source.yaml"
    if not source_yaml.exists():
        errors.append(f"Missing: {source_yaml}")
        return errors

    # Parse YAML
    try:
        with open(source_yaml) as f:
            meta = yaml.safe_load(f)
    except yaml.YAMLError as e:
        errors.append(f"YAML parse error in {source_yaml}: {e}")
        return errors

    if meta is None:
        errors.append(f"Empty or invalid YAML: {source_yaml}")
        return errors

    # Check required fields
    for field in REQUIRED_FIELDS:
        if field not in meta:
            errors.append(f"Missing required field '{field}'")

    # Check chunks array
    chunks = meta.get("chunks", [])
    if not isinstance(chunks, list):
        errors.append("'chunks' must be a list")
        chunks = []

    if len(chunks) == 0:
        errors.append("'chunks' array is empty")

    # Check each chunk
    chunk_ids = []
    for i, chunk in enumerate(chunks):
        if not isinstance(chunk, dict):
            errors.append(f"chunks[{i}] must be an object")
            continue

        for field in REQUIRED_CHUNK_FIELDS:
            if field not in chunk:
                errors.append(f"chunks[{i}] missing required field '{field}'")

        if "id" in chunk:
            chunk_ids.append(chunk["id"])

    # Check chunks directory
    chunks_dir = source_dir / "chunks"
    if not chunks_dir.exists():
        errors.append(f"Missing: {chunks_dir}/")
    elif not chunks_dir.is_dir():
        errors.append(f"Not a directory: {chunks_dir}")
    else:
        # Check that chunk PDFs exist
        for chunk_id in chunk_ids:
            pdf_path = chunks_dir / f"{chunk_id}.pdf"
            if not pdf_path.exists():
                errors.append(f"Missing chunk file: {pdf_path}")

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

        print(f"Validation PASSED for {source_dir}")
        print(f"  Work: {meta.get('work')}")
        print(f"  Author: {meta.get('author')}")
        print(f"  Slug: {meta.get('slug')}")
        print(f"  Chunks: {len(meta.get('chunks', []))}")
        sys.exit(0)


if __name__ == "__main__":
    main()
