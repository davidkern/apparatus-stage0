#!/usr/bin/env bash
# Verify SKILL.md instructions against actual devenv options.
set -euo pipefail

echo "=== Verify 'scripts' option structure ==="
bash /work/.claude/skills/devenv/scripts/search-options.sh "scripts" 2>&1 | grep -A3 "^## scripts\." | head -20

echo ""
echo "=== Verify 'languages' enable pattern ==="
bash /work/.claude/skills/devenv/scripts/search-options.sh "languages.python.enable" 2>&1 | head -10

echo ""
echo "=== Verify 'services' enable pattern ==="
bash /work/.claude/skills/devenv/scripts/search-options.sh "services.postgres.enable" 2>&1 | head -10

echo ""
echo "=== Verify 'packages' option ==="
bash /work/.claude/skills/devenv/scripts/search-options.sh "^packages$" 2>&1 | head -10

echo ""
echo "=== Check MCP server connectivity ==="
# Just verify the MCP config is valid JSON
jq . /work/.mcp.json

echo ""
echo "=== DONE ==="
