#!/usr/bin/env bash
# PreToolUse hook: wrap Bash commands in devenv shell
# Uses jq @sh to safely quote the command for bash -c.
set -euo pipefail

jq --arg devenv "$DEVENV_BIN" \
  'if .tool_input.command then
    {hookSpecificOutput: {hookEventName: "PreToolUse", permissionDecision: "allow",
      updatedInput: {command: ($devenv + " shell -q -- bash -c " + (.tool_input.command | @sh))}}}
  else empty end'
