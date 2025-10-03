{ config, ... }:
let
  inherit (config) user;
in
{
  imports = [
    ./development
    ./foreground
    ./background
    ./theme

    ./gc.nix
    ./packages.nix
    #./secrets.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home = {
    username = user;
    homeDirectory = "/home/${user}";
  };

  xdg.enable = true;

  home.sessionVariables = {
    EDITOR = "vim";
    XDG_CONFIG_HOME = "/home/${user}/.config";
  };
  home.stateVersion = "25.05";
}
