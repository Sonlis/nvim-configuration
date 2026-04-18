{
  description = "Bastibast flake with Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    infomanixak = {
      url = "git+ssh://git@gitlab.infomaniak.ch/L3/infoma-nix-ak";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

  };

  outputs =
    inputs@{
      self,
      catppuccin,
      dms,
      nixpkgs,
      home-manager,
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
          dms
          inputs
          lib
          nixpkgs
          self
          system
          ;
      };
    };
}
