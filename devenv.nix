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
    ]
    ++ lib.optionals isLinux [
      bubblewrap
    ];

  # Researcher Claude runs directly -- no bubble needed for research work
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

    # hooks = {
    #   SessionStart = [
    #     {
    #       command = "cat research-guide.md";
    #     }
    #   ];
    # };
  };

  git-hooks.hooks = {
    nixfmt.enable = true;
  };
}
