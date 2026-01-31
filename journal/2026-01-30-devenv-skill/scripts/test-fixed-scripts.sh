#!/usr/bin/env bash
# Test the fixed search-options.sh and show-option.sh scripts.
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

echo "=== Testing search-options.sh ==="

# Clear cache to test fresh build
rm -f "${DEVENV_ROOT:-.}/.devenv/state/optionsJSON-path"

# Test 1: Search for "claude" options
out="$(bash /work/.claude/skills/devenv/scripts/search-options.sh "claude" 2>&1)"
check "search 'claude' finds claude.code.enable" "$out" "claude\.code\.enable"

# Test 2: Search for "postgres" options
out="$(bash /work/.claude/skills/devenv/scripts/search-options.sh "postgres" 2>&1)"
check "search 'postgres' finds services.postgres" "$out" "services\.postgres"

# Test 3: Search for "python" language options
out="$(bash /work/.claude/skills/devenv/scripts/search-options.sh "python" 2>&1)"
check "search 'python' finds languages.python" "$out" "languages\.python"

# Test 4: Search uses cache on second run (should not print "Building")
out="$(bash /work/.claude/skills/devenv/scripts/search-options.sh "redis" 2>&1)"
check "cached search does not rebuild" "$out" "^(?!.*Building options JSON)"

echo ""
echo "=== Testing show-option.sh ==="

# Test 5: Show a boolean option
out="$(bash /work/.claude/skills/devenv/scripts/show-option.sh "claude.code.enable" 2>&1)"
check "show claude.code.enable returns true" "$out" "^true$"

# Test 6: Show a list option (packages list should be non-empty)
out="$(bash /work/.claude/skills/devenv/scripts/show-option.sh "packages" 2>&1)"
check "show packages returns JSON array" "$out" "^\["

# Test 7: Invalid option path should fail
set +e
out="$(bash /work/.claude/skills/devenv/scripts/show-option.sh "nonexistent.option.path" 2>&1)"
ec=$?
set -e
check_exit "show invalid option exits non-zero" "$ec" "1"
check "show invalid option prints error" "$out" "Error:|error:"

echo ""
echo "Results: $pass/$total passed, $fail failed"
exit $fail
