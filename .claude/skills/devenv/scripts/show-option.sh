#!/usr/bin/env bash
# Show the current evaluated value of a devenv option.
# Usage: show-option.sh <key-path>
#
# Example: show-option.sh claude.code.enable
# Requires: nix

set -euo pipefail

key_path="${1:?Usage: show-option.sh <key-path>}"
devenv_root="${DEVENV_ROOT:-.}"

nix eval --json "${devenv_root}#devenv.config.${key_path}" 2>/dev/null \
  || echo "Error: could not evaluate option '${key_path}'. Check the key path is valid." >&2
