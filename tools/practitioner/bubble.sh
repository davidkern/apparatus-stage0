#!/usr/bin/env bash
set -euo pipefail

# Bubble sandbox - runs commands in an isolated bubblewrap environment
#
# Uses a persistent home directory at .devenv/state/gregarious/home so that
# Claude plugins, conversation history, and credentials persist between sessions.
# Users configure their own credentials directly in the project home directory.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Verify devenv context
if [[ -z "${DEVENV_ROOT:-}" ]]; then
    echo "Error: DEVENV_ROOT not set. Run inside devenv shell." >&2
    exit 1
fi

# Source directory to bind as workspace (default: DEVENV_ROOT)
BUBBLE_SRC="${BUBBLE_SRC:-$DEVENV_ROOT}"

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
BUBBLE_TMP="$SESSION_TMP"

cleanup() { rm -rf "$SESSION_TMP"; }
trap cleanup EXIT

# Determine network status (default: deny)
case "${BUBBLE_NETWORK:-deny}" in
    allow)
        BUBBLE_INDICATOR="🔮"  # crystal ball = can see out (network)
        NETWORK_MODE="allow"
        ;;
    deny|"")
        BUBBLE_INDICATOR="🫧"  # bubble = contained (isolated)
        NETWORK_MODE="deny"
        ;;
    *)
        echo "Error: BUBBLE_NETWORK must be 'allow' or 'deny', got '${BUBBLE_NETWORK}'" >&2
        exit 1
        ;;
esac

# Workspace path (neutral location that doesn't leak real home)
WORKSPACE="/apparatus"

# Compute relative path from BUBBLE_SRC to current directory
if [[ "$(pwd)" == "$BUBBLE_SRC"* ]]; then
    REL_PATH="${PWD#"$BUBBLE_SRC"}"
    BUBBLE_CWD="$WORKSPACE$REL_PATH"
else
    # Outside source root - use workspace root
    BUBBLE_CWD="$WORKSPACE"
fi

# Core bwrap arguments
BWRAP_ARGS=(
    --unshare-user-try
    --uid "$(id -u)"
    --gid "$(id -g)"
    --die-with-parent

    --ro-bind /nix/store /nix/store
    --ro-bind /etc /etc
    --ro-bind /run /run
    --tmpfs "/run/user/$(id -u)"
    --ro-bind "/run/user/$(id -u)/bus" "/run/user/$(id -u)/bus"
    --proc /proc
    --dev-bind /dev /dev

    # FHS compatibility shims for shebangs and system() calls
    # Uses devenv profile paths (stable across rebuilds) rather than nix store hashes
    --ro-bind "$DEVENV_ROOT/.devenv/profile/bin/env" /usr/bin/env
    --ro-bind "$DEVENV_ROOT/.devenv/profile/bin/bash" /bin/sh

    --bind "$BUBBLE_STATE" "$BUBBLE_STATE"
    --bind "$SESSION_TMP" "$SESSION_TMP"
    --bind "$BUBBLE_SRC" "$WORKSPACE"

    --chdir "$BUBBLE_CWD"
    --setenv HOME "$BUBBLE_HOME"
    --setenv TMPDIR "$BUBBLE_TMP"
    --setenv PATH "$BUBBLE_HOME/.local/bin:$PATH"
    --setenv DEVENV_ROOT "$WORKSPACE"

    # D-Bus access for xdg-desktop-portal (allows sandboxed apps to open URLs in host browser)
    --setenv XDG_RUNTIME_DIR "${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
    --setenv DBUS_SESSION_BUS_ADDRESS "${DBUS_SESSION_BUS_ADDRESS:-unix:path=/run/user/$(id -u)/bus}"
)

# Network isolation
if [[ "$NETWORK_MODE" == "allow" ]]; then
    BWRAP_ARGS+=(--share-net)
else
    BWRAP_ARGS+=(
        --unshare-net
        --unsetenv http_proxy --unsetenv HTTP_PROXY
        --unsetenv https_proxy --unsetenv HTTPS_PROXY
        --unsetenv ftp_proxy --unsetenv FTP_PROXY
        --unsetenv all_proxy --unsetenv ALL_PROXY
        --unsetenv no_proxy --unsetenv NO_PROXY
    )
fi

# Clean bubble config from inner environment, export BUBBLE_INDICATOR for shell PS1
BWRAP_ARGS+=(
    --unsetenv BUBBLE_NETWORK
    --unsetenv BUBBLE_SRC
    --unsetenv BUBBLE_EXTRA_ARGS
    --setenv BUBBLE_INDICATOR "$BUBBLE_INDICATOR"
)

# Extra bwrap arguments
if [[ -n "${BUBBLE_EXTRA_ARGS:-}" ]]; then
    read -ra extra_args <<< "$BUBBLE_EXTRA_ARGS"
    BWRAP_ARGS+=("${extra_args[@]}")
fi

# Execute command (default: interactive shell using $SHELL for readline support)
if [[ $# -eq 0 ]]; then
    exec bwrap "${BWRAP_ARGS[@]}" -- "${SHELL:-/bin/bash}" -l
else
    exec bwrap "${BWRAP_ARGS[@]}" -- "$@"
fi
