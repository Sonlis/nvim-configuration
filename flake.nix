{
  description = "Bastibast flake with Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprlang.follows = "hyprland/hyprlang";
    };

    infomanixak = {
      url = "path:/home/workibast/infomaniak/pink/infoma-nix-ak";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    elephant.url = "github:abenz1267/elephant?rev=f37977c557f2c570a2e0b1c9c49698b104b3b1d0";

    walker = {
      url = "github:abenz1267/walker?rev=8b8baa70e27da74648616059bbc5f42ec10de448";
      inputs.elephant.follows = "elephant";
    };
  };

  outputs =
    inputs@{
      self,
      catppuccin,
      dankMaterialShell,
      nixpkgs,
      home-manager,
      hyprland,
      walker,
      ...
    }:
    let
      mkLib = nixpkgs: nixpkgs.lib.extend (final: prev: (import ./lib final));
      lib = mkLib nixpkgs;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          # nvidia.acceptLicense = true;
        };
      };
    in
    {
      inherit lib pkgs;
      nixosModules.default = ./modules/nixos;
      homeModules.default = ./modules/home-manager/home.nix;
      nixosConfigurations = import ./hosts {
        inherit
          inputs
          lib
          self
          system
          ;
      };
      homeConfigurations = import ./homes {
        inherit
          home-manager
          dankMaterialShell
          inputs
          lib
          nixpkgs
          self
          system
          ;
      };
    };
}
