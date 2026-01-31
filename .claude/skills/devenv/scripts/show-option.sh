#!/usr/bin/env bash
# Show the current evaluated value of a devenv option.
# Usage: show-option.sh <key-path>
#
# Example: show-option.sh claude.code.enable
# Requires: devenv

set -euo pipefail

key_path="${1:?Usage: show-option.sh <key-path>}"
devenv_root="${DEVENV_ROOT:-.}"

# devenv repl exposes devenv.config with the evaluated configuration
repl_output="$(printf 'builtins.toJSON devenv.config.%s\n' "$key_path" | devenv repl 2>&1)"

# Extract the result line (skip repl banner lines)
result="$(echo "$repl_output" | grep -v "^Nix\|^Type :?\|^Loading\|^Added\|^$" | head -1)"

if [[ -z "$result" ]] || echo "$result" | grep -q "^error:"; then
  echo "Error: could not evaluate option '${key_path}'. Check the key path is valid." >&2
  # Show the error detail if present
  echo "$repl_output" | grep "error:" >&2
  exit 1
fi

# Strip ANSI color codes and outer quotes from the JSON string
result="$(echo "$result" | sed 's/\x1b\[[0-9;]*m//g' | sed 's/^"//;s/"$//')"
echo "$result"
