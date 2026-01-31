#!/usr/bin/env bash
# Test search-packages.sh script.
set -euo pipefail

pass=0
fail=0
total=0

check() {
  local label="$1" got="$2" expect_pattern="$3"
  total=$((total + 1))
  if echo "$got" | grep -qP "$expect_pattern"; then
    echo "[PASS] $label"
    pass=$((pass + 1))
  else
    echo "[FAIL] $label"
    echo "  expected pattern: $expect_pattern"
    echo "  got: $(echo "$got" | head -5)"
    fail=$((fail + 1))
  fi
}

check_exit() {
  local label="$1" exit_code="$2" expect="$3"
  total=$((total + 1))
  if [[ "$exit_code" == "$expect" ]]; then
    echo "[PASS] $label"
    pass=$((pass + 1))
  else
    echo "[FAIL] $label (exit=$exit_code, expected=$expect)"
    fail=$((fail + 1))
  fi
}

echo "=== Testing search-packages.sh ==="

# Test 1: Search for jq returns pkgs.jq
out="$(bash /work/.claude/skills/devenv/scripts/search-packages.sh "jq" 2>&1)"
check "search 'jq' finds pkgs.jq" "$out" "^## pkgs\.jq$"

# Test 2: Output includes Version and Description fields
check "search 'jq' includes Version field" "$out" "Version:"
check "search 'jq' includes Description field" "$out" "Description:"

# Test 3: Search for redis returns results
out="$(bash /work/.claude/skills/devenv/scripts/search-packages.sh "redis" 2>&1)"
check "search 'redis' finds redis packages" "$out" "redis"

# Test 4: Search for nonsense returns "No packages found"
out="$(bash /work/.claude/skills/devenv/scripts/search-packages.sh "xyzzynonexistent99" 2>&1)"
check "search nonexistent returns no-match message" "$out" "No packages found"

# Test 5: Missing argument exits non-zero
set +e
out="$(bash /work/.claude/skills/devenv/scripts/search-packages.sh 2>&1)"
ec=$?
set -e
check_exit "missing argument exits non-zero" "$ec" "1"

echo ""
echo "Results: $pass/$total passed, $fail failed"
exit $fail
