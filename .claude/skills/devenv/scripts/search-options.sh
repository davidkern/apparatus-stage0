#!/usr/bin/env bash
# Search devenv options by keyword.
# Usage: search-options.sh <query>
#
# Builds optionsJSON (cached), then filters with jq.
# Requires: jq, nix

set -euo pipefail

query="${1:?Usage: search-options.sh <query>}"
devenv_root="${DEVENV_ROOT:-.}"
state_dir="${devenv_root}/.devenv/state"
cache_file="${state_dir}/optionsJSON-path"
devenv_nix="${devenv_root}/devenv.nix"

mkdir -p "$state_dir"

# Invalidate cache if devenv.nix is newer than cached path
rebuild=false
if [[ -f "$cache_file" ]]; then
  cached_path="$(cat "$cache_file")"
  if [[ ! -d "$cached_path" ]]; then
    rebuild=true
  elif [[ "$devenv_nix" -nt "$cache_file" ]]; then
    rebuild=true
  fi
else
  rebuild=true
fi

if $rebuild; then
  echo "Building options JSON (first run or devenv.nix changed)..." >&2
  options_path="$(nix build --no-link --print-out-paths "${devenv_root}#optionsJSON" 2>/dev/null)"
  echo "$options_path" > "$cache_file"
else
  options_path="$(cat "$cache_file")"
fi

options_json="${options_path}/share/doc/nixos/options.json"

if [[ ! -f "$options_json" ]]; then
  echo "Error: options.json not found at ${options_json}" >&2
  exit 1
fi

# Search: filter option names and descriptions matching the query (case-insensitive)
jq -r --arg q "$query" '
  to_entries
  | map(select(
      (.key | ascii_downcase | contains($q | ascii_downcase))
      or
      ((.value.description // "") | ascii_downcase | contains($q | ascii_downcase))
    ))
  | .[]
  | "## \(.key)\nType: \(.value.type // "unknown")\nDefault: \(.value.default // "none")\nDescription: \(.value.description // "no description")\n"
' "$options_json"
