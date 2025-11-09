{ ... }:
{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
  ];
  config.desktop = "niri";
}
