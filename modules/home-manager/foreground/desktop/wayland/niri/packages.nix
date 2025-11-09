{ config, pkgs, ... }:
{
      config = {
    home.packages = [

    ]
    ++ (
      if config.desktop == "niri" then
        with pkgs;
        [
          mako
          swaybg
          swayidle
          swaylock
          xdg-desktop-portal-gtk
        ]
      else
        [ ]
    );
  };
}
