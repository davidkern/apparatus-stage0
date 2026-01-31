#!/usr/bin/env bash
# SessionStart hook: write devenv environment into CLAUDE_ENV_FILE
# Debug: log everything we can see
{
  echo "--- setup-devenv-env.sh ---"
  echo "CLAUDE_ENV_FILE=$CLAUDE_ENV_FILE"
  echo "HOME=$HOME"
  echo "SHELL=$SHELL"
  echo "DEVENV_BIN=$DEVENV_BIN"
  echo "PATH (first 200)=${PATH:0:200}"
  env | sort | head -40
  echo "---"
} >> /tmp/session-hook-debug.log 2>&1

if [ -n "$CLAUDE_ENV_FILE" ]; then
  echo 'export DEVENV_MARKER=applied' >> "$CLAUDE_ENV_FILE"
  echo 'export PATH="/tmp/fake-test-path:$PATH"' >> "$CLAUDE_ENV_FILE"
  echo "Wrote to CLAUDE_ENV_FILE" >> /tmp/session-hook-debug.log
else
  echo "CLAUDE_ENV_FILE not set!" >> /tmp/session-hook-debug.log
fi
exit 0
