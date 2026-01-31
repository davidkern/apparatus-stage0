{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

let
  isLinux = pkgs.stdenv.isLinux;
  claude-code-native = inputs.claude-code-overlay.packages.${pkgs.stdenv.system}.default;
in
{
  packages =
    with pkgs;
    [
      coreutils
      bash
      git
      gh
      jq
      python3
      yq-go
      curl
      tree
      file
      gnused
      gnugrep
      diffutils
      xxd
    ]
    ++ lib.optionals isLinux [
      bubblewrap
    ];

  enterShell = ''
    export DEVENV_BIN="$(command -v devenv)"
  '';

  # Researcher Claude
  scripts.claude = {
    exec = ''
      exec "${claude-code-native}/bin/claude" "$@"
    '';
  };

  # Launch a practitioner agent inside an isolated bubble
  scripts.practitioner = lib.mkIf isLinux {
    exec = ''
      exec "$DEVENV_ROOT/tools/practitioner/bubble.sh" "$@"
    '';
  };

  claude.code = {
    enable = true;

    # No remote MCP server — skill scripts handle search locally
    mcpServers = { };

    hooks = {
      load-research-guide = {
        hookType = "SessionStart";
        command = "cat research-guide.md";
      };
      devenv-wrap-bash = {
        hookType = "PreToolUse";
        matcher = "Bash";
        command = "${config.devenv.root}/.claude/scripts/devenv-pretool.sh";
      };
    };
  };

  git-hooks.hooks = {
    nixfmt.enable = true;
  };
}
