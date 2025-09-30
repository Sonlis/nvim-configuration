{ lib, config, ... }:

let
  # Path to the folder that matches the chosen desktop
  desktops = builtins.attrNames (
    lib.attrsets.filterAttrs (_: v: v == "directory") (builtins.readDir ./.)
  );
  # https://github.com/NixOS/nix/issues/12407
  imports = builtins.map (desktop: ./. + builtins.unsafeDiscardStringContext "/${desktop}") desktops;
in
{
  imports = imports;
  options.desktop = lib.mkOption {
    type = lib.types.str;
    description = "Choose which desktop environment should be configured for the user";
  };

  config = {
    desktop = lib.genAttrs desktops (name: {
      enable = lib.mkDefault (config.desktop == name);
    });
  };
}
