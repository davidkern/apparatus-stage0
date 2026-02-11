#!/usr/bin/env python3
"""
Recipe schema validator.

Validates recipe files against the schema defined in SCHEMA.md.
Run on individual files or directories to check conformance.

Usage:
    python validate.py <file_or_directory> [...]
    python validate.py aristotle/  # validate all recipes in a source directory
    python validate.py aristotle/enthymeme-from-opposites.md  # validate one file
"""

import sys
import re
from pathlib import Path
import yaml


# === Schema Definition ===

REQUIRED_FIELDS = [
    "name",
    "slug",
    "source",
    "intent",
    "direction",
]

REQUIRED_SOURCE_FIELDS = [
    "work",
    "author",
    "location",
]

VALID_DIRECTIONS = {"construction", "recognition", "both"}

VALID_RELATIONSHIPS = {
    "contains",
    "contained-by",
    "contrasts",
    "combines-with",
    "variant-of",
}


# === Validation Functions ===


class ValidationError:
    def __init__(self, file: Path, field: str, message: str, severity: str = "error"):
        self.file = file
        self.field = field
        self.message = message
        self.severity = severity  # "error" or "warning"

    def __str__(self):
        prefix = "ERROR" if self.severity == "error" else "WARNING"
        return f"  [{prefix}] {self.field}: {self.message}"


def parse_frontmatter(content: str) -> tuple[dict | None, str, str | None]:
    """Extract YAML frontmatter and body from markdown content.

    Returns (frontmatter_dict, body, error_message)
    """
    if not content.startswith("---"):
        return None, content, "File does not start with YAML frontmatter (---)"

    # Find the closing ---
    rest = content[3:]
    match = re.search(r"\n---\s*\n", rest)
    if not match:
        return None, content, "No closing --- for frontmatter"

    yaml_content = rest[: match.start()]
    body = rest[match.end() :]

    try:
        frontmatter = yaml.safe_load(yaml_content)
        if not isinstance(frontmatter, dict):
            return None, body, f"Frontmatter is not a dict: {type(frontmatter)}"
        return frontmatter, body, None
    except yaml.YAMLError as e:
        return None, body, f"YAML parse error: {e}"


def validate_frontmatter(fm: dict, file: Path) -> list[ValidationError]:
    """Validate frontmatter against schema."""
    errors = []

    # Required top-level fields
    for field in REQUIRED_FIELDS:
        if field not in fm:
            errors.append(ValidationError(file, field, "Required field missing"))
        elif fm[field] is None or fm[field] == "":
            errors.append(ValidationError(file, field, "Required field is empty"))

    # Source sub-fields
    if "source" in fm and isinstance(fm["source"], dict):
        for field in REQUIRED_SOURCE_FIELDS:
            if field not in fm["source"]:
                errors.append(
                    ValidationError(file, f"source.{field}", "Required field missing")
                )
            elif fm["source"][field] is None or fm["source"][field] == "":
                errors.append(
                    ValidationError(file, f"source.{field}", "Required field is empty")
                )
    elif "source" in fm and not isinstance(fm["source"], dict):
        errors.append(
            ValidationError(
                file, "source", f"Must be a dict, got {type(fm['source']).__name__}"
            )
        )

    # Direction enum
    if "direction" in fm and fm["direction"] is not None:
        if fm["direction"] not in VALID_DIRECTIONS:
            errors.append(
                ValidationError(
                    file,
                    "direction",
                    f"Must be one of {VALID_DIRECTIONS}, got '{fm['direction']}'",
                )
            )

    # Slug matches filename
    if "slug" in fm and fm["slug"]:
        expected_filename = f"{fm['slug']}.md"
        if file.name != expected_filename:
            errors.append(
                ValidationError(
                    file,
                    "slug",
                    f"Slug '{fm['slug']}' doesn't match filename '{file.name}' (expected '{expected_filename}')",
                )
            )

    # Components structure
    if "components" in fm and fm["components"] is not None:
        if not isinstance(fm["components"], list):
            errors.append(ValidationError(file, "components", "Must be a list"))
        else:
            for i, comp in enumerate(fm["components"]):
                if not isinstance(comp, dict):
                    errors.append(
                        ValidationError(file, f"components[{i}]", "Must be a dict")
                    )
                elif "element" not in comp:
                    errors.append(
                        ValidationError(
                            file, f"components[{i}]", "Missing 'element' field"
                        )
                    )
                elif "encodes" not in comp:
                    errors.append(
                        ValidationError(
                            file, f"components[{i}]", "Missing 'encodes' field"
                        )
                    )

    # Related structure
    if "related" in fm and fm["related"] is not None:
        if not isinstance(fm["related"], list):
            errors.append(ValidationError(file, "related", "Must be a list"))
        else:
            for i, rel in enumerate(fm["related"]):
                if not isinstance(rel, dict):
                    errors.append(
                        ValidationError(file, f"related[{i}]", "Must be a dict")
                    )
                elif "slug" not in rel:
                    errors.append(
                        ValidationError(file, f"related[{i}]", "Missing 'slug' field")
                    )
                elif (
                    "relationship" in rel
                    and rel["relationship"] not in VALID_RELATIONSHIPS
                ):
                    errors.append(
                        ValidationError(
                            file,
                            f"related[{i}].relationship",
                            f"Must be one of {VALID_RELATIONSHIPS}, got '{rel['relationship']}'",
                        )
                    )

    # Audience structure
    if "audience" in fm and fm["audience"] is not None:
        if not isinstance(fm["audience"], list):
            errors.append(ValidationError(file, "audience", "Must be a list"))
        else:
            for i, aud in enumerate(fm["audience"]):
                if not isinstance(aud, dict):
                    errors.append(
                        ValidationError(file, f"audience[{i}]", "Must be a dict")
                    )
                elif "context" not in aud:
                    errors.append(
                        ValidationError(
                            file, f"audience[{i}]", "Missing 'context' field"
                        )
                    )

    # Warnings structure
    if "warnings" in fm and fm["warnings"] is not None:
        if not isinstance(fm["warnings"], list):
            errors.append(ValidationError(file, "warnings", "Must be a list"))
        else:
            for i, warn in enumerate(fm["warnings"]):
                if not isinstance(warn, str):
                    errors.append(
                        ValidationError(file, f"warnings[{i}]", "Must be a string")
                    )

    return errors


def validate_body(body: str, fm: dict, file: Path) -> list[ValidationError]:
    """Validate body content quality."""
    errors = []

    # Body should have content
    body_stripped = body.strip()
    if not body_stripped:
        errors.append(ValidationError(file, "body", "Body is empty", severity="error"))
        return errors

    # Check for key sections (warnings, not errors)
    if "## Description" not in body and "## " not in body:
        errors.append(
            ValidationError(
                file,
                "body",
                "No markdown sections found - consider adding ## Description, ## Examples, etc.",
                severity="warning",
            )
        )

    # Examples section strongly recommended (convergent finding)
    if "## Examples" not in body and "## Example" not in body:
        # Check if there are any blockquotes (inline examples)
        if ">" not in body:
            errors.append(
                ValidationError(
                    file,
                    "body",
                    "No Examples section or blockquotes found - examples illuminate patterns better than abstractions",
                    severity="warning",
                )
            )

    # Body shouldn't just repeat frontmatter
    if fm.get("intent") and fm["intent"] in body_stripped[:200]:
        # Intent appears verbatim near start - might be duplicating
        errors.append(
            ValidationError(
                file,
                "body",
                "Body appears to repeat frontmatter verbatim - body should elaborate, not duplicate",
                severity="warning",
            )
        )

    return errors


def validate_file(file: Path) -> list[ValidationError]:
    """Validate a single recipe file."""
    errors = []

    # Check file exists and is markdown
    if not file.exists():
        errors.append(ValidationError(file, "file", "File does not exist"))
        return errors

    if file.suffix != ".md":
        errors.append(
            ValidationError(file, "file", "File is not a markdown file (.md)")
        )
        return errors

    # Skip schema, readme, and system files (underscore prefix)
    if file.name in ("SCHEMA.md", "README.md") or file.name.startswith("_"):
        return errors

    # Read and parse
    content = file.read_text()
    fm, body, parse_error = parse_frontmatter(content)

    if parse_error:
        errors.append(ValidationError(file, "frontmatter", parse_error))
        return errors

    if fm is None:
        errors.append(ValidationError(file, "frontmatter", "No frontmatter found"))
        return errors

    # Validate frontmatter
    errors.extend(validate_frontmatter(fm, file))

    # Validate body
    errors.extend(validate_body(body, fm, file))

    return errors


def validate_directory(directory: Path) -> list[ValidationError]:
    """Validate all recipe files in a directory."""
    errors = []

    # Find all markdown files, excluding special files
    md_files = sorted(directory.glob("**/*.md"))
    md_files = [
        f
        for f in md_files
        if f.name not in ("SCHEMA.md", "README.md")
        and "/_tools/" not in str(f)
        and not f.name.startswith("_")  # Skip system files (_context.md, etc.)
    ]

    if not md_files:
        print(f"No recipe files found in {directory}")
        return errors

    for file in md_files:
        errors.extend(validate_file(file))

    return errors


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)

    all_errors = []
    files_checked = 0

    for arg in sys.argv[1:]:
        path = Path(arg)

        if path.is_dir():
            errors = validate_directory(path)
            # Count only recipe files (same filter as validate_directory)
            md_files = [
                f
                for f in path.glob("**/*.md")
                if f.name not in ("SCHEMA.md", "README.md")
                and "/_tools/" not in str(f)
                and not f.name.startswith("_")
            ]
            files_checked += len(md_files)
        elif path.is_file():
            errors = validate_file(path)
            files_checked += 1
        else:
            print(f"Path not found: {arg}", file=sys.stderr)
            continue

        all_errors.extend(errors)

    # Group errors by file
    errors_by_file: dict[Path, list[ValidationError]] = {}
    for error in all_errors:
        if error.file not in errors_by_file:
            errors_by_file[error.file] = []
        errors_by_file[error.file].append(error)

    # Print results
    error_count = sum(1 for e in all_errors if e.severity == "error")
    warning_count = sum(1 for e in all_errors if e.severity == "warning")

    if errors_by_file:
        for file, file_errors in sorted(errors_by_file.items()):
            print(f"\n{file}:")
            for error in file_errors:
                print(str(error))

    print(f"\n{'=' * 60}")
    print(f"Files checked: {files_checked}")
    print(f"Errors: {error_count}")
    print(f"Warnings: {warning_count}")

    if error_count > 0:
        print("\nValidation FAILED")
        sys.exit(1)
    elif warning_count > 0:
        print("\nValidation PASSED with warnings")
        sys.exit(0)
    else:
        print("\nValidation PASSED")
        sys.exit(0)


if __name__ == "__main__":
    main()
