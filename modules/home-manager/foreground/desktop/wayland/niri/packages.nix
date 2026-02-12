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
          playerctl
          xdg-desktop-portal-gtk
          xwayland-satellite
        ]
      else
        [ ]
    );
  };
}
