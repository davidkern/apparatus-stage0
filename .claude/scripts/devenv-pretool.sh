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

# Write command to temp file (avoids all quoting issues)
CMDFILE=$(mktemp /tmp/devenv-cmd-XXXXXXXX.sh)
printf '%s' "$COMMAND" > "$CMDFILE"

# Return updatedInput with executor wrapping
jq -n --arg cmd "$DEVENV_ROOT/.claude/scripts/devenv-exec.sh $CMDFILE" \
  '{hookSpecificOutput: {hookEventName: "PreToolUse", permissionDecision: "allow", updatedInput: {command: $cmd}}}'
