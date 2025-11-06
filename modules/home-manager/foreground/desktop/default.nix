{
  inputs,
  lib,
  config,
  ...
}:

let
  # Path to the folder that matches the chosen desktop
  desktops = builtins.attrNames (
    lib.attrsets.filterAttrs (_: v: v == "directory") (builtins.readDir ./.)
  );
  # https://github.com/NixOS/nix/issues/12407
  imports = builtins.map (desktop: ./. + builtins.unsafeDiscardStringContext "/${desktop}") desktops;
in
{
  imports = [ inputs.walker.homeManagerModules.default ] ++ imports;
  options.desktop = lib.mkOption {
    type = lib.types.str;
    description = "Choose which desktop environment should be configured for the user";
  };
}
