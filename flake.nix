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

    walker.url = "github:abenz1267/walker";
  };

  outputs =
    inputs@{
      self,
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
          inputs
          lib
          nixpkgs
          self
          system
          ;
      };
    };
}
