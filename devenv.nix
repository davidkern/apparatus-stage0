{
  pkgs,
  lib,
  ...
}:

let
  isLinux = pkgs.stdenv.isLinux;
in
{
  # Launch a practitioner agent inside an isolated bubble
  scripts.practitioner = lib.mkIf isLinux {
    exec = ''
      exec "$DEVENV_ROOT/tools/practitioner/bubble.sh" "$@"
    '';
  };

  apparatus.claude.hooks = {
    load-research-guide = {
      hookType = "SessionStart";
      command = "cat research-guide.md";
    };
  };
}
