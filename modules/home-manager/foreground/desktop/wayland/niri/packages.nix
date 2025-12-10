{ config, pkgs, ... }:
{
  config = {
    home.packages = [

    ]
    ++ (
      if config.desktop == "niri" then
        with pkgs;
        [
          bluetui
          fum
          playerctl
          swayidle
          xdg-desktop-portal-gtk
          xwayland-satellite
        ]
      else
        [ ]
    );
  };
}
