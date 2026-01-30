# Devenv Reference

## Module system basics

Devenv is built on the Nix module system. Each option has:

- **Name**: dot-separated path (e.g., `languages.python.enable`)
- **Type**: standard Nix types (`bool`, `str`, `int`, `listOf str`, `attrsOf`, `submodule`, etc.)
- **Default**: value used if not explicitly set
- **Description**: what the option does

Options are defined in devenv's module tree. Users set values in `devenv.nix`; the module system merges, type-checks, and evaluates them.

## Common option patterns

### Enable pattern
Most features follow `<category>.<name>.enable = true`:

```nix
languages.python.enable = true;
languages.rust.enable = true;
services.postgres.enable = true;
pre-commit.hooks.nixfmt.enable = true;
```

### Language options
Under `languages.<name>`:
- `.enable` — activate the language toolchain
- `.package` — override the default package
- `.version` — select a specific version (where supported)

### Service options
Under `services.<name>`:
- `.enable` — start the service with `devenv up`
- Various service-specific settings (ports, config files, etc.)

### Packages
`packages` is a list of Nix packages added to the shell environment:

```nix
packages = with pkgs; [ git jq ripgrep ];
```

### Scripts
`scripts.<name>.exec` defines shell scripts available in the environment:

```nix
scripts.hello = {
  exec = ''
    echo "Hello, $1!"
  '';
};
```

### Process-compose / processes
`processes.<name>.exec` defines long-running processes managed by process-compose:

```nix
processes.server.exec = "python -m http.server 8000";
```

## Claude Code options (`claude.code.*`)

### `claude.code.enable`
Type: `bool`. Default: `false`.
Enable Claude Code configuration generation.

### `claude.code.settings`
Type: `attrsOf anything`. Default: `{}`.
Generates `.claude/settings.json`. Keys map to Claude Code settings.

### `claude.code.mcpServers`
Type: `attrsOf submodule`. Default: `{}`.
Each key is a server name. Submodule options:
- `type`: `"stdio"` or `"sse"`
- `command`: executable path or name
- `args`: list of arguments
- `env`: attribute set of environment variables
- `url`: (for SSE type) server URL

Generates `.mcp.json`.

### `claude.code.hooks`
Type: `attrsOf (listOf submodule)`. Default: `{}`.
Hook types: `SessionStart`, `PreToolUse`, `PostToolUse`, `Stop`, `SubagentStop`.

Each hook entry:
- `command`: shell command to run
- `matcher`: (optional) tool name pattern for Pre/PostToolUse hooks (glob syntax)

Example:

```nix
claude.code.hooks = {
  SessionStart = [
    { command = "cat research-guide.md"; }
  ];
  PreToolUse = [
    {
      matcher = "Bash";
      command = "echo 'About to run a bash command'";
    }
  ];
};
```

### `claude.code.permissions`
Permissions for Claude Code tool use. Controls which tools can run without confirmation.

## Git hooks via devenv

```nix
git-hooks.hooks = {
  nixfmt.enable = true;    # format nix files
  prettier.enable = true;  # format JS/TS/CSS/etc.
  shellcheck.enable = true; # lint shell scripts
};
```

These run as pre-commit hooks via the git-hooks framework integrated into devenv.

## Nix syntax quick reference

For editing `devenv.nix`:

```nix
# Attribute set
{ key = value; nested.key = value; }

# List
[ item1 item2 item3 ]

# String
"hello"

# Multi-line string
''
  line 1
  line 2
''

# Boolean
true / false

# With expression (brings attrs into scope)
with pkgs; [ git jq ]
# equivalent to: [ pkgs.git pkgs.jq ]

# Conditional
lib.mkIf condition value

# Optional list items
[ always ] ++ lib.optionals condition [ sometimes ]

# Let binding
let
  x = 1;
in
  x + 1
```
