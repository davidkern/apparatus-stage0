#!/usr/bin/env bash
# Check for broken symlinks in presentation-catalog
#
# Usage: ./check-symlinks.sh [directory]
# Default directory is the presentation-catalog root
#
# Exit codes:
#   0 - all symlinks valid
#   1 - broken symlinks found

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="${1:-$(dirname "$SCRIPT_DIR")}"

broken=0

while IFS= read -r -d '' link; do
    if [ ! -e "$link" ]; then
        target=$(readlink "$link")
        echo "BROKEN: $link -> $target"
        ((broken++)) || true
    fi
done < <(find "$ROOT_DIR" -type l -print0)

if [ "$broken" -gt 0 ]; then
    echo ""
    echo "Found $broken broken symlink(s)"
    exit 1
else
    echo "All symlinks valid"
    exit 0
fi
