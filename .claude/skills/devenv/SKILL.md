---
user-invocable: false
description: Devenv environment configuration — loads when devenv packages, options, nix configuration, or environment setup is discussed
---

# Devenv Configuration

## Key concepts

- **`devenv.nix`** is the configuration file you edit. It's a Nix expression returning an attribute set of devenv options.
- **`.devenv.flake.nix`** is generated output — never edit it directly.
- **`devenv.lock`** pins input versions (like a lockfile). Committed to git.
- After changing `devenv.nix`: the user must exit and re-enter the devenv shell to pick up changes (or run `direnv reload` if using direnv).

## CLI commands

| Command | Purpose |
|---------|---------|
| `devenv search <query>` | Search nixpkgs for a package |
| `devenv info` | Show current environment info (packages, scripts, services, etc.) |
| `devenv shell` | Enter the devenv shell |
| `devenv repl` | Open a Nix REPL with devenv config loaded |
| `devenv up` | Start all configured services (processes) |
| `devenv test` | Run devenv tests |

## Action recipes

### Search available devenv options

```bash
bash .claude/skills/devenv/scripts/search-options.sh "<query>"
```

Builds the options JSON (cached), filters by query against option names and descriptions. Returns name, type, description, and default.

### Show current value of an option

```bash
bash .claude/skills/devenv/scripts/show-option.sh "<key-path>"
```

Example: `bash .claude/skills/devenv/scripts/show-option.sh claude.code.enable`

### Search for a nixpkg package

```bash
devenv search <query>
```

### List installed packages and environment info

```bash
devenv info
```

### Add a package

Edit `devenv.nix`, add the package name to the `packages` list:

```nix
packages = with pkgs; [
  existing-package
  new-package
];
```

### Set a configuration option

Edit `devenv.nix`, add or modify the option in the attribute set:

```nix
{
  # Simple enable
  languages.python.enable = true;

  # Nested options
  services.postgres = {
    enable = true;
    listen_addresses = "127.0.0.1";
  };
}
```

### Refresh shell after changes

Instruct the user to exit and re-enter the devenv shell. Changes to `devenv.nix` are not picked up automatically.

### Claude Code configuration via devenv

The `claude.code` option set in `devenv.nix` generates Claude Code configuration files:

- `claude.code.enable` — enables Claude Code integration
- `claude.code.settings` — generates `.claude/settings.json`
- `claude.code.mcpServers` — generates `.mcp.json` with MCP server definitions
- `claude.code.hooks` — generates hook configuration (SessionStart, PreToolUse, PostToolUse, etc.)

See `reference.md` in this skill directory for deeper coverage of the module system and patterns.
