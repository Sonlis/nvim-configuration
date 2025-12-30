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
      "https://walker.cachix.org"
    ];
    trusted-substituters = [
      "https://walker.cachix.org"
    ];
    trusted-public-keys = [
    ];
  };
  environment.localBinInPath = true;
  programs.nix-ld.enable = true;
}
