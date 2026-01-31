#!/usr/bin/env bash
# Second probe: check if result text contains devenv-relevant content,
# and look at what tools Claude actually used.
set -euo pipefail

tmpfile="$(mktemp /work/scripts/probe2-XXXXXX.json)"
trap 'rm -f "$tmpfile"' EXIT

echo "=== Positive case: 'Add curl to this project packages' ==="
claude -p "Add curl to this project's packages" --output-format json --verbose --max-turns 3 2>/dev/null > "$tmpfile" || true

echo "--- All tool calls ---"
jq -r '[.[] | select(.type == "assistant") | .message.content[]? | select(.type == "tool_use") | {name, input_summary: (if .name == "Edit" then .input.file_path elif .name == "Read" then .input.file_path elif .name == "Bash" then (.input.command[:60]) elif .name == "Skill" then .input.skill else "..." end)}]' "$tmpfile" 2>/dev/null

echo ""
echo "--- Final text responses ---"
jq -r '[.[] | select(.type == "assistant") | .message.content[]? | select(.type == "text") | .text] | last' "$tmpfile" 2>/dev/null | head -10

echo ""
echo "--- Result ---"
jq -r '.[] | select(.type == "result") | .result // .subresult // "null"' "$tmpfile" 2>/dev/null | head -5

echo ""
echo "--- Devenv-relevant signals ---"
echo -n "Edited devenv.nix: "
jq '[.[] | select(.type == "assistant") | .message.content[]? | select(.type == "tool_use" and .name == "Edit" and .input.file_path == "/work/devenv.nix")] | length > 0' "$tmpfile" 2>/dev/null || echo "parse error"

echo -n "Used devenv search: "
jq '[.[] | select(.type == "assistant") | .message.content[]? | select(.type == "tool_use" and .name == "Bash" and (.input.command | test("devenv search")))] | length > 0' "$tmpfile" 2>/dev/null || echo "parse error"

echo -n "Read devenv.nix: "
jq '[.[] | select(.type == "assistant") | .message.content[]? | select(.type == "tool_use" and .name == "Read" and (.input.file_path | test("devenv.nix")))] | length > 0' "$tmpfile" 2>/dev/null || echo "parse error"

echo -n "Text mentions devenv.nix: "
jq '[.[] | select(.type == "assistant") | .message.content[]? | select(.type == "text") | .text] | any(test("devenv\\.nix"))' "$tmpfile" 2>/dev/null || echo "parse error"

echo ""
echo "=== DONE ==="
