#!/usr/bin/env bash
# Batch test skill triggering — runs all tests in parallel.
# Usage: test-skill-triggers.sh [test-cases-file]
#
# Test case format (one per line):
#   EXPECT:prompt text
# where EXPECT is "yes" or "no". Lines starting with # are skipped.
#
# Results written incrementally to stdout.

set -euo pipefail
dir="$(cd "$(dirname "$0")" && pwd)"
casefile="${1:-$dir/skill-test-cases.txt}"
resultsdir="$(mktemp -d)"
trap 'rm -rf "$resultsdir"' EXIT

# Launch all tests in parallel, each with a 90s timeout
i=0
while IFS= read -r line; do
  [[ -z "$line" || "$line" == \#* ]] && continue
  expected="${line%%:*}"
  prompt="${line#*:}"

  (
    output=$(timeout 90 "$dir/test-skill-trigger.sh" "$prompt" 2>/dev/null || echo "TRIGGERED: timeout")
    if [[ "$output" == *'"yes"'* ]]; then
      actual="yes"
    else
      actual="no"
    fi
    # Extract tools list for debugging
    tools=$(echo "$output" | grep "^TOOLS:" | sed 's/^TOOLS: //')
    if [[ "$actual" == "$expected" ]]; then
      status="PASS"
    else
      status="FAIL"
    fi
    printf '%s|%s|%s|%s|%s\n' "$status" "$expected" "$actual" "$prompt" "$tools" > "$resultsdir/$(printf '%03d' "$i").result"
  ) &

  i=$((i + 1))
done < "$casefile"

# Wait for all and collect
wait

pass=0
fail=0
for f in "$resultsdir"/*.result; do
  [[ -f "$f" ]] || continue
  IFS='|' read -r status expected actual prompt tools < "$f"
  if [[ "$status" == "PASS" ]]; then
    pass=$((pass + 1))
  else
    fail=$((fail + 1))
  fi
  printf "[%s] expect=%s actual=%s | %s\n" "$status" "$expected" "$actual" "$prompt"
  if [[ "$status" == "FAIL" && -n "$tools" ]]; then
    printf "       tools: %s\n" "$tools"
  fi
done

total=$((pass + fail))
echo ""
echo "Results: $pass/$total passed, $fail failed"
