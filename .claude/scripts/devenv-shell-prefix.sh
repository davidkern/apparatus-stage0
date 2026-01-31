#!/usr/bin/env bash
echo "PREFIX DEBUG: args=[$*] DEVENV_BIN=[$DEVENV_BIN] pwd=[$(pwd)]" >> /tmp/devenv-prefix-debug.log
exec "$DEVENV_BIN" shell -q -- bash -c "$*"
