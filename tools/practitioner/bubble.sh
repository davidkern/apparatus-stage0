#!/usr/bin/env bash
set -euo pipefail

# Bubble sandbox - runs commands in an isolated bubblewrap environment
#
# Resolves the apparatus devenv profile outside the bubble and constructs PATH
# from it, so we don't depend on `devenv shell` as the entry mechanism.
# The apparatus devenv.nix remains the source of truth for what tools the agent
# gets — we just resolve it before entering the container.
#
# Uses a persistent home directory at .devenv/state/gregarious/home so that
# Claude plugins, conversation history, and credentials persist between sessions.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Verify devenv context
if [[ -z "${DEVENV_ROOT:-}" ]]; then
    echo "Error: DEVENV_ROOT not set. Run inside devenv shell." >&2
    exit 1
fi

APPARATUS_DIR="$DEVENV_ROOT/apparatus"
APPARATUS_PROFILE="$APPARATUS_DIR/.devenv/profile"

if [[ ! -d "$APPARATUS_PROFILE" ]]; then
    echo "Error: Apparatus devenv profile not found at $APPARATUS_PROFILE" >&2
    echo "Run 'cd apparatus && devenv shell -- true' to build it first." >&2
    exit 1
fi

# Persistent home directory within project state
BUBBLE_STATE="$DEVENV_ROOT/.devenv/state/gregarious"
BUBBLE_HOME="$BUBBLE_STATE/home"

# Initialize home directory from template if it doesn't exist
if [[ ! -d "$BUBBLE_HOME" ]]; then
    mkdir -p "$BUBBLE_STATE"
    cp -r "$SCRIPT_DIR/templates/home" "$BUBBLE_HOME"
fi

# Ephemeral tmp directory for session isolation (cleaned on exit)
SESSION_TMP=$(mktemp -d /tmp/bubble-tmp.XXXXXXXXXX)
cleanup() { rm -rf "$SESSION_TMP"; }
trap cleanup EXIT

# Resolve apparatus profile bin and prepend to host PATH
# All PATH entries are nix store or system paths that are mounted into the bubble
BUBBLE_PATH="$APPARATUS_PROFILE/bin:$PATH"

# Collect DEVENV_* variable names to unset inside the bubble
DEVENV_UNSETS=()
while IFS= read -r var; do
    DEVENV_UNSETS+=(--unsetenv "$var")
done < <(env | grep -oP '^DEVENV_[^=]+' || true)

BWRAP_ARGS=(
    --unshare-user-try
    --uid "$(id -u)"
    --gid "$(id -g)"
    --die-with-parent
    --share-net

    --bind /nix /nix
    --ro-bind /etc /etc
    --ro-bind /run /run
    --tmpfs "/run/user/$(id -u)"
    --proc /proc
    --dev-bind /dev /dev

    --ro-bind "$DEVENV_ROOT/.devenv/profile/bin/env" /usr/bin/env
    --ro-bind "$DEVENV_ROOT/.devenv/profile/bin/bash" /bin/sh

    --bind "$APPARATUS_DIR" "$APPARATUS_DIR"
    --bind "$BUBBLE_STATE" "$BUBBLE_STATE"
    --bind "$SESSION_TMP" "$SESSION_TMP"

    --chdir "$APPARATUS_DIR"
    --setenv HOME "$BUBBLE_HOME"
    --setenv TMPDIR "$SESSION_TMP"
    --setenv PATH "$BUBBLE_PATH"
    "${DEVENV_UNSETS[@]}"
    --setenv BUBBLE_INDICATOR "🫧"
)

if [[ $# -eq 0 ]]; then
    exec bwrap "${BWRAP_ARGS[@]}" -- "${SHELL:-/bin/bash}" -l
else
    exec bwrap "${BWRAP_ARGS[@]}" -- "$@"
fi
