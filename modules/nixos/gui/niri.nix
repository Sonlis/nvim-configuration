{
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.dms.nixosModules.greeter
  ];
  config = lib.mkIf (config.desktop == "niri") {
    programs.niri = {
      enable = true;
    };

    programs.dank-material-shell.greeter = {
      enable = true;
      compositor = {
        name = "niri";
      };
      configHome = "/home/${config.username}";
    };
  };
}
