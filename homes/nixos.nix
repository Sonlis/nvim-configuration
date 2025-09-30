{
  inputs,
  config,
  lib,
  pkgs,
  self,
  flake,
  ...
}:
let
  inherit (config) username type;
  specialArgs = {
    inherit inputs self;
  };
  host-home-config = ../systems/${config.networking.hostName}/home.nix;
in
{
  home-manager = {
    # tell home-manager to be as verbose as possible
    verbose = true;

    # use the system configuration’s pkgs argument
    # this ensures parity between nixos' pkgs and hm's pkgs
    useGlobalPkgs = true;

    # enable the usage user packages through
    # the users.users.<name>.packages option
    useUserPackages = true;

    # extra specialArgs passed to Home Manager
    # for reference, the config argument in nixos can be accessed
    # in home-manager through osConfig without us passing it
    extraSpecialArgs = specialArgs;

    # per-user Home Manager configuration
    # the genAttrs function generates an attribute set of users
    # as `user = ./user` where user is picked from a list of
    # users in modules.system.users
    # the system expects user directories to be found in the present
    # directory, or will exit with directory not found errors
    # users.${username} = import ../modules/home-manager/home.nix;
    # users.${username} = (import ./${username}) // (import ../modules/home-manager/home.nix);
    users.${username} =
      # (import ./${username} { inherit config lib; })
      lib.optionalAttrs (builtins.pathExists host-home-config) (
        import host-home-config {
          inherit lib;
          inherit pkgs;
        }
      )
      // {
        imports = [
          ./${username}
          flake.homeModules.default
        ];
        options.user = lib.mkOption {
          type = lib.types.str;
          default = username;
        };
        options.type = lib.mkOption {
          type = lib.types.str;
          default = type;
        };
      };
  };
}
