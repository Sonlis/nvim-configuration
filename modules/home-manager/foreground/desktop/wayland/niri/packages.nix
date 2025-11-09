{ config, pkgs, ... }:
{
  config = {
    home.packages = [

    ]
    ++ (
      if config.desktop == "niri" then
        with pkgs;
        [
          swaybg
          swayidle
          swaylock-effects
          xdg-desktop-portal-gtk
        ]
      else
        [ ]
    );
  };
}
