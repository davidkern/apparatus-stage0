# Apparatus Research Environment

All Bash tool calls run inside `devenv shell` automatically. If a command is missing, add it to `devenv.nix` via the devenv skill. For one-off use of a package not yet in devenv, use `nix-shell -p <package> --run "..."`.
