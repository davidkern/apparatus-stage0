#!/usr/bin/env bash
# Test the devenv skill helper scripts and discover the correct nix invocations.
set -euo pipefail

echo "=== 1. Environment ==="
echo "DEVENV_ROOT=${DEVENV_ROOT:-unset}"
which devenv nix jq 2>&1 || true

echo ""
echo "=== 2. devenv repl: discover top-level variables ==="
for var in config options packages devenv; do
  result=$(printf ":t $var\n" | devenv repl 2>&1 | tail -1)
  echo "  $var => $result"
done

echo ""
echo "=== 3. devenv repl: try evaluating config.claude.code.enable ==="
printf ':p config.claude.code.enable\n' | devenv repl 2>&1 | grep -v "^Nix\|^Type\|^Loading\|^Added"

echo ""
echo "=== 4. devenv repl: list top-level config keys ==="
printf 'builtins.attrNames config\n' | devenv repl 2>&1 | grep -v "^Nix\|^Type\|^Loading\|^Added"

echo ""
echo "=== 5. devenv repl: try packages.x86_64-linux ==="
printf 'builtins.attrNames packages.x86_64-linux\n' | devenv repl 2>&1 | grep -v "^Nix\|^Type\|^Loading\|^Added"

echo ""
echo "=== 6. devenv repl: build optionsJSON path ==="
printf ':b packages.x86_64-linux.optionsJSON\n' | devenv repl 2>&1 | grep -v "^Nix\|^Type\|^Loading\|^Added"

echo ""
echo "=== 7. Test show-option.sh as-is (expected to fail) ==="
bash /work/.claude/skills/devenv/scripts/show-option.sh "claude.code.enable" 2>&1 || true

echo ""
echo "=== 8. devenv repl: show a config value as JSON ==="
printf 'builtins.toJSON config.claude.code.enable\n' | devenv repl 2>&1 | grep -v "^Nix\|^Type\|^Loading\|^Added"

echo ""
echo "=== 9. devenv repl: show packages list names ==="
printf 'map (p: p.name or p.pname or "unknown") config.packages\n' | devenv repl 2>&1 | grep -v "^Nix\|^Type\|^Loading\|^Added"

echo ""
echo "=== DONE ==="
