{
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.dankMaterialShell.nixosModules.greeter
  ];
  config = lib.mkIf (config.desktop == "niri") {
    programs.niri = {
      enable = true;
    };

    programs.dankMaterialShell.greeter = {
      enable = true;
      compositor = {
        name = "niri";
      };
      configHome = "/home/${config.username}";
    };
  };
}
