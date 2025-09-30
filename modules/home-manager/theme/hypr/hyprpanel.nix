{ pkgs, config, ... }:
let
    hyprpanelPkg = pkgs.hyprpanel;
    themeFile = "${hyprpanelPkg}/share/themes/${config.colors.hyprpanel}";
    hyprpanelTheme = builtins.fromJSON (builtins.readFile themeFile);
in
{
  programs.hyprpanel = {
      settings = hyprpanelTheme // {
          theme = {
              font = {
                  name = "JetBrainsMono Nerd Font";
                  label = "JetBrainsMono Nerd Font";
                  size = "1.0rem";
              };
        };
    };
  };
}
