{ config, lib, ... }:
let
  colors = config.colors;
in
{
  config = lib.mkIf (config.desktop == "hyprland") {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "${colors.wallpaper}"
        "${colors.wallpaperWide}"
      ];
      wallpaper = [
        "eDP-1,${colors.wallpaper}"
        ",${colors.wallpaperWide}"
      ];
    };
  };
  };
}
