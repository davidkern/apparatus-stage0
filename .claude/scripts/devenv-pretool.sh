#!/usr/bin/env bash
# PreToolUse hook: wrap Bash commands in devenv shell
# Reads tool_input from stdin JSON, writes command to a temp file,
# returns updatedInput pointing to the executor script.

set -euo pipefail

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

if [ -z "$COMMAND" ]; then
  exit 0
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Write command to temp file (avoids all quoting issues)
CMDFILE=$(mktemp /tmp/devenv-cmd-XXXXXXXX.sh)
printf '%s' "$COMMAND" > "$CMDFILE"

# Return updatedInput with executor wrapping
jq -n --arg cmd "$SCRIPT_DIR/devenv-exec.sh $CMDFILE" \
  '{hookSpecificOutput: {hookEventName: "PreToolUse", permissionDecision: "allow", updatedInput: {command: $cmd}}}'
