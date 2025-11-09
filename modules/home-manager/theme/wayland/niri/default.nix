{ inputs, ... }:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    ./waybar.nix
  ];
}
