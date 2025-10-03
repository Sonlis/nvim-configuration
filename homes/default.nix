{
  inputs,
  lib,
  pkgs,
  self,
  ...
}:
let
  palettes = import "${self}/themes/colors.nix" { };
  unique-users = lib.systemConfig.listDirs ./.;
in
lib.genAttrs unique-users (
  user:
  inputs.home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = { inherit inputs; };
    modules = [
      self.homeModules.default
      (
        { lib, ... }:
        {
          options.user = lib.mkOption {
            type = lib.types.str;
            default = user;
          };
        }
      )
      ./${user}
      {
        theming = {
          inherit palettes;
        };
      }
    ]
    ++ (with inputs; [
      sops-nix.nixosModules.sops
    ]);
  }
)
