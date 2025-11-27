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
          swaybg
          swayidle
          swaylock-effects
          xdg-desktop-portal-gtk
          xwayland-satellite
        ]
      else
        [ ]
    );
  };
}
