{ pkgs, config, lib, ... }:
let
  themeFile = "${pkgs.hyprpanel}/share/themes/${config.colors.hyprpanel}";
  hyprpanelTheme = builtins.fromJSON (builtins.readFile themeFile);
in
{
  config = lib.mkIf (config.desktop == "hyprland") {
  programs.hyprpanel = {
    settings = hyprpanelTheme // {
      theme = {
        bar = {
          transparent = true;
        };
        font = {
          name = "JetBrainsMono Nerd Font";
          label = "JetBrainsMono Nerd Font";
          size = "1.0rem";
        };
      };
    };
  };
  };
}
