{
  lib,
  config,
  ...
}:
let
  shells = [
    "bash"
    "fish"
    "zsh"
  ];
in
{
  imports = [
    ./fish.nix
    ./kubie.nix
    ./starship
    ./zsh.nix
  ];

  options = {
    shell.main = lib.mkOption {
      type = lib.types.str;
      default = "zsh";
      description = "Choose which shell should be configured for the user";
    };
  };

  config = {
    programs = {
      starship.enable = true;
    }
    // lib.genAttrs shells (
      # loops over all terminal attributes defined above
      sh:
      lib.genAttrs [ "enable" ] (
        # for the enable attribute
        val: (if config.shell.main == sh then (lib.mkDefault true) else (lib.mkDefault false))
      )
    );
  };
}
