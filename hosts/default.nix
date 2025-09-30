{
  inputs,
  self,
  lib,
  system
}:
let
  machines = {
    # Personal
    # Lenovo ThinkPad T470 14"
    persobast.usernames = [ "bastibast" ];
    persobast.type = "persolap";

    # Work
    workibast.usernames = [ "workibast" ];
    workibast.type = "infowork";
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
          options.type = lib.mkOption {
            type = lib.types.str;
            default = conf.type;
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
