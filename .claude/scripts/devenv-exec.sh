#!/usr/bin/env bash
# Execute a command file inside devenv shell, then clean up.
# Called by the PreToolUse hook via updatedInput.

CMDFILE="$1"
if [ ! -f "$CMDFILE" ]; then
  echo "Error: command file not found: $CMDFILE" >&2
  exit 1
fi

# DEVENV_BIN is set by enterShell (full path to devenv)
if [ -z "${DEVENV_BIN:-}" ]; then
  echo "Error: DEVENV_BIN not set" >&2
  rm -f "$CMDFILE"
  exit 1
fi

"$DEVENV_BIN" shell -q -- bash "$CMDFILE"
STATUS=$?
rm -f "$CMDFILE"
exit $STATUS
