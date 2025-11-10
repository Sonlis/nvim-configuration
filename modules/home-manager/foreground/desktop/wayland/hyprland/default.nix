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
in
{
  imports = [
  ]
  ++ files;

  config = lib.mkIf (config.desktop == "hyprland") {
    home.packages = with pkgs; [
      hyprcursor
      hypridle
      hyprlock
      hyprpaper
    ];
    gtk = {
    };
  };
}
