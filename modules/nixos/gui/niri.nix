{
  config,
  inputs,
  lib,
  ...
}:
{
  config = lib.mkIf (config.desktop == "niri") {
    programs.niri = {
      enable = true;
    };
  };
}
