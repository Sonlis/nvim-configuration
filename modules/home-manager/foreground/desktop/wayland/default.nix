{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
let
  files = map (file: ./. + builtins.unsafeDiscardStringContext "/${file}") (
    builtins.filter (f: f != "default.nix") (builtins.attrNames (builtins.readDir ./.))
  );
  cfg = config.desktops.hyprland;
in
{
  imports = [
    inputs.walker.homeManagerModules.default
  ]
  ++ files;
  options.desktops.hyprland = {
    enable = lib.mkEnableOption "Hyprland desktop environment";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      hyprcursor
      hypridle
      hyprlock
      hyprpaper
    ];
  };
}
