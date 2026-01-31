#!/usr/bin/env bash
# Second round: discover the 4 repl variables and test correct paths.
set -euo pipefail

echo "=== 1. The 4 flake output attrs (devShell, packages, devenv, build) ==="
for var in devShell packages devenv build; do
  result=$(printf "builtins.typeOf $var\n" | devenv repl 2>&1 | grep -v "^Nix\|^Type\|^Loading\|^Added" | head -1)
  echo "  $var => $result"
done

echo ""
echo "=== 2. Try devenv.config.claude.code.enable ==="
printf 'devenv.config.claude.code.enable\n' | devenv repl 2>&1 | grep -v "^Nix\|^Type\|^Loading\|^Added"

echo ""
echo "=== 3. List devenv attrs ==="
printf 'builtins.attrNames devenv\n' | devenv repl 2>&1 | grep -v "^Nix\|^Type\|^Loading\|^Added"

echo ""
echo "=== 4. Try devenv.config as JSON for a known option ==="
printf 'builtins.toJSON devenv.config.claude.code.enable\n' | devenv repl 2>&1 | grep -v "^Nix\|^Type\|^Loading\|^Added"

echo ""
echo "=== 5. Try to list some config keys ==="
printf 'builtins.attrNames devenv.config\n' | devenv repl 2>&1 | grep -v "^Nix\|^Type\|^Loading\|^Added" | head -20

echo ""
echo "=== 6. Check the built optionsJSON content ==="
options_json="/nix/store/50pn97qh72zkh9c0vcxypwaz3adxz23q-options.json/share/doc/nixos/options.json"
if [[ -f "$options_json" ]]; then
  echo "Found at standard path"
  jq 'keys | length' "$options_json"
  echo "Sample keys:"
  jq 'keys[:5]' "$options_json"
else
  echo "Not at standard path, checking alternatives..."
  ls -la /nix/store/50pn97qh72zkh9c0vcxypwaz3adxz23q-options.json/ 2>&1
  # Try finding options.json inside
  find /nix/store/50pn97qh72zkh9c0vcxypwaz3adxz23q-options.json/ -name "*.json" 2>&1
fi

echo ""
echo "=== 7. Test optionsJSON search with jq ==="
if [[ -f "$options_json" ]]; then
  jq -r --arg q "claude" '
    to_entries
    | map(select(
        (.key | ascii_downcase | contains($q | ascii_downcase))
      ))
    | .[:3][]
    | "## \(.key)\nType: \(.value.type // "unknown")\nDefault: \(.value.default // "none")\nDescription: \(.value.description // "no description")\n"
  ' "$options_json"
fi

echo ""
echo "=== DONE ==="
