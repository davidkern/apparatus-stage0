#!/usr/bin/env bash
# Test whether a prompt triggers the devenv skill.
# Usage: test-skill-trigger.sh "prompt text"
#
# Outputs:
#   TRIGGERED: yes/no
#   RESULT: <agent's final response>

set -euo pipefail

prompt="${1:?Usage: test-skill-trigger.sh \"prompt text\"}"
tmpfile="$(mktemp)"
trap 'rm -f "$tmpfile"' EXIT

# --verbose gives the full conversation array including tool calls;
# without it, only the final result object is returned.
claude -p "$prompt" --output-format json --verbose --max-budget-usd 0.25 2>/dev/null > "$tmpfile"

# The verbose JSON output is an array of message objects.
skill_called=$(jq '[.[] | select(.type == "assistant") | .message.content[] | select(.type == "tool_use" and .name == "Skill")] | if length > 0 then "yes" else "no" end' "$tmpfile" 2>/dev/null || echo '"parse_error"')

result=$(jq -r '.[] | select(.type == "result") | .result' "$tmpfile" 2>/dev/null | head -20 || echo "(no result)")

echo "TRIGGERED: $skill_called"
echo "RESULT: $result"
