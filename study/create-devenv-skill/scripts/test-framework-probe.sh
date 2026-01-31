#!/usr/bin/env bash
# Probe the claude CLI output format to verify test framework jq queries.
set -euo pipefail

echo "=== 1. Check claude CLI available ==="
which claude 2>&1 || { echo "claude not found"; exit 1; }
claude --version 2>&1

echo ""
echo "=== 2. Check claude -p help for output format ==="
claude -p --help 2>&1 | grep -A2 -i "output-format\|verbose" || true

echo ""
echo "=== 3. Run a trivial positive trigger (should load devenv skill) ==="
tmpfile="$(mktemp /work/scripts/probe-XXXXXX.json)"
trap 'rm -f "$tmpfile"' EXIT

claude -p "How do I add the curl package to this devenv?" --output-format json --verbose --max-turns 3 2>/dev/null > "$tmpfile" || true

echo "Output size: $(wc -c < "$tmpfile") bytes"
echo ""
echo "=== 4. Inspect JSON structure ==="
# Check if it's an array or object
echo -n "Top-level type: "
jq -r 'type' "$tmpfile" 2>/dev/null || echo "parse error"

echo ""
echo "=== 5. List message types ==="
jq -r 'if type == "array" then [.[] | .type] | unique | .[] else "not an array: \(type)" end' "$tmpfile" 2>/dev/null || echo "parse error"

echo ""
echo "=== 6. Check for Skill tool calls ==="
# Try the current jq query from test-skill-trigger.sh
skill_called=$(jq '[.[] | select(.type == "assistant") | .message.content[] | select(.type == "tool_use" and .name == "Skill")] | if length > 0 then "yes" else "no" end' "$tmpfile" 2>/dev/null || echo '"parse_error"')
echo "Skill called (current query): $skill_called"

echo ""
echo "=== 7. Show all tool_use calls ==="
jq -r '[.[] | select(.type == "assistant") | .message.content[]? | select(.type == "tool_use") | .name] | unique | .[]' "$tmpfile" 2>/dev/null || echo "none/parse error"

echo ""
echo "=== 8. Show result ==="
jq -r '.[] | select(.type == "result") | .result' "$tmpfile" 2>/dev/null | head -10 || echo "no result found"

echo ""
echo "=== 9. Show first assistant message structure (keys) ==="
jq '[.[] | select(.type == "assistant")][0] | keys' "$tmpfile" 2>/dev/null || echo "parse error"

echo ""
echo "=== 10. Show first assistant content types ==="
jq '[.[] | select(.type == "assistant")][0] | .message.content | map(.type)' "$tmpfile" 2>/dev/null || echo "parse error"

echo ""
echo "=== DONE ==="
