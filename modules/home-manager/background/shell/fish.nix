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
      loginShellInit = "";
      shellInit = ''
        ${builtins.concatStringsSep "\n" formatted_exports}
      '';
    };
  };
}
