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
    ]
    ++ lib.optionals isLinux [
      bubblewrap
      glib # gdbus for xdg-desktop-portal (URL opening from bubble)
    ];

  # Researcher Claude runs directly -- no bubble needed for research work
  scripts.claude = {
    exec = ''
      exec "${claude-code-native}/bin/claude" "$@"
    '';
  };

  # Launch a practitioner agent inside an isolated bubble
  # Usage: practitioner claude -p "Read /apparatus/apparatus.md. ..."
  scripts.practitioner = lib.mkIf isLinux {
    exec = ''
      export BUBBLE_NETWORK=allow
      export BUBBLE_SRC="$DEVENV_ROOT/apparatus"
      cd "$BUBBLE_SRC"
      exec "$DEVENV_ROOT/tools/practitioner/bubble.sh" devenv shell -c -- "$@"
    '';
  };

  claude.code = {
    enable = true;

    mcpServers = {
      devenv = {
        type = "stdio";
        command = "devenv";
        args = [ "mcp" ];
        env = {
          DEVENV_ROOT = config.devenv.root;
        };
      };
    };
  };

  git-hooks.hooks = {
    nixfmt.enable = true;
  };
}
