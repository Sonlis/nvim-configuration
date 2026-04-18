{
  inputs,
  lib,
  pkgs,
  config,
  ...
}:
{
  imports = [
    ./niri
  ];

  config = lib.mkIf (config.desktop == "niri") {
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
