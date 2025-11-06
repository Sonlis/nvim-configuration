{ lib, config, ... }:
{
  config = lib.mkIf (config.desktop == "hyprland") {
    programs.walker = {
      enable = true;
      runAsService = true;
      config = {
        keybinds = {
          quick_activate = [
            "ctrl h"
            "ctrl j"
            "ctrl k"
            "ctrl l"
          ];
        };
      };
    };
    xdg.configFile."websearch-config" = {
      enable = true;
      target = "elephant/websearch.toml";
      text = ''
        [[entries]]
        name = "Google"
        url = "https://www.google.com/search?q=%TERM%"
        default = true
      '';
    };
  };
}
