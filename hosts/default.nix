{
  inputs,
  self,
  lib,
  system,
}:
let
  machines = {
    # Personal
    # Lenovo ThinkPad T470 14"
    persobast.usernames = [ "bastibast" ];

    # Work
    workibast.usernames = [ "workibast" ];
  };

in
builtins.mapAttrs (
  hostname: conf:
  lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs self;
      flake = self;
    };
    modules = [
      self.nixosModules.default
      (
        { lib, ... }:
        {
          options.username = lib.mkOption {
            type = lib.types.str;
            default = lib.lists.elemAt conf.usernames 0;
          };
        }
      )
      {
        networking.hostName = lib.mkForce hostname;
        nixpkgs = {
          config.allowUnfree = true;
        };
      }
      ./${hostname}
      ../homes/nixos.nix
    ]
    ++ (with inputs; [
      home-manager.nixosModules.home-manager
    ]);
  }
) machines
