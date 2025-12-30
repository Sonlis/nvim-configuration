{
  inputs,
  lib,
  pkgs,
  config,
  ...
}:
{
  imports = [
    inputs.walker.homeManagerModules.default
    ./niri
  ];

  config = lib.mkIf (config.desktop == "niri") {
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
    gtk = {
      enable = true;

      theme = {
        package = pkgs.flat-remix-gtk;
        name = "Flat-Remix-GTK-Grey-Darkest";
      };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.catppuccin-papirus-folders.override {
          flavor = "mocha";
          accent = "lavender";
        };
      };

      cursorTheme = {
        name = "breeze";
        package = pkgs.kdePackages.breeze;
        size = 22;
      };

      font = {
        name = "JetBrains Mono";
        size = 11;
      };
    };
  };
}
