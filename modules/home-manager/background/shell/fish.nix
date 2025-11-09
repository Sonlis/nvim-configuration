{ config, lib, ... }:
let
  exports = [
    "SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)"
  ];
in
let
  formatted_exports = map (x: "export " + x) exports;
in
{
  config = lib.mkIf (config.programs.fish.enable) {
    programs.fish = {
      shellAliases = {
        os = "openstack";
        k = "kubectl";
      };
      loginShellInit =
        if config.desktop == "hyprland" then
          ''
            exec uswm start hyprland-uwsm.desktop
          ''
        else if config.desktop == "niri" then
          ''
            niri-session -l
          ''
        else
          "";
      shellInit = ''
        ${builtins.concatStringsSep "\n" formatted_exports}
      '';
    };
  };
}
