{ ... }:
{
  imports = [
    ./environment
    ./gui
    ./network
    ./system
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://hyprland.cachix.org"
      "https://walker.cachix.org"
    ];
    trusted-substituters = [
      "https://hyprland.cachix.org"
      "https://walker.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };
  environment.localBinInPath = true;
  programs.nix-ld.enable = true;
}
