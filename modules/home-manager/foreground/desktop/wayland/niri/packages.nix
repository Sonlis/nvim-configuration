{ config, pkgs, ... }:
{
  config = {
    home.packages = [

    ]
    ++ (
      if config.desktop == "niri" then
        with pkgs;
        [
          helvum
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
