#!/usr/bin/env bash
# Search devenv packages by keyword.
# Usage: search-packages.sh <query>
#
# Wraps `devenv search` and reformats the table output as markdown.
# Requires: devenv

set -euo pipefail

query="${1:?Usage: search-packages.sh <query>}"

# Run devenv search; strip ANSI codes
raw="$(devenv search "$query" 2>&1 | sed 's/\x1b\[[0-9;]*m//g')"

# Parse the ASCII table: rows look like:
#   | pkgs.foo       | 1.2.3    | Some description    |
# Skip separator lines (+---+) and the header row.
output=""
while IFS= read -r line; do
  # Only process data rows (start with |, not separator lines)
  [[ "$line" == \|* ]] || continue
  # Skip header row
  echo "$line" | grep -q '| *Package ' && continue

  # Split on | and trim whitespace
  pkg="$(echo "$line" | cut -d'|' -f2 | sed 's/^ *//;s/ *$//')"
  ver="$(echo "$line" | cut -d'|' -f3 | sed 's/^ *//;s/ *$//')"
  desc="$(echo "$line" | cut -d'|' -f4 | sed 's/^ *//;s/ *$//')"

  [[ -z "$pkg" ]] && continue

  output+="## ${pkg}
Version: ${ver}
Description: ${desc}

"
done <<< "$raw"

if [[ -z "$output" ]]; then
  echo "No packages found matching '${query}'."
  exit 0
fi

echo "$output"
