{ config, lib, ... }:
let
  colors = config.colors;
in
{
  config = lib.mkIf (config.desktop == "niri") {
    catppuccin.waybar =
      if colors.name == "catppuccin_mocha" then
        {
          enable = true;
          flavor = "mocha";
        }
      else
        {
          enable = false;
        };
  };
}
