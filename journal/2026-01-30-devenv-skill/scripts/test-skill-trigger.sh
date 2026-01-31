#!/usr/bin/env bash
# Test whether a prompt triggers the devenv skill.
# Usage: test-skill-trigger.sh "prompt text"
#
# Outputs:
#   TRIGGERED: "yes" or "no"
#   TOOLS: list of tools called

set -euo pipefail

prompt="${1:?Usage: test-skill-trigger.sh \"prompt text\"}"
tmpfile="$(mktemp)"
trap 'rm -f "$tmpfile"' EXIT

# Use haiku for cost efficiency; 2 turns is enough to see if the Skill tool is called.
claude -p "$prompt" \
  --output-format json \
  --verbose \
  --model haiku \
  --max-turns 2 \
  2>/dev/null > "$tmpfile"

# The verbose JSON output is an array of message objects.
# Check if any assistant message contains a tool_use call to the Skill tool.
skill_called=$(jq '[.[] | select(.type == "assistant") | .message.content[] | select(.type == "tool_use" and .name == "Skill")] | if length > 0 then "yes" else "no" end' "$tmpfile" 2>/dev/null || echo '"parse_error"')

# List all tools called (for debugging)
tools=$(jq -r '[.[] | select(.type == "assistant") | .message.content[]? | select(.type == "tool_use") | .name] | join(", ")' "$tmpfile" 2>/dev/null || echo "parse_error")

echo "TRIGGERED: $skill_called"
echo "TOOLS: $tools"
