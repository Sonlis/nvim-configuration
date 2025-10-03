{ config, ... }:
let
  colors = config.colors;
in
{
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
}
