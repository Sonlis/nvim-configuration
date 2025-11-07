{ lib, config, ... }:
{
  config = lib.mkIf (config.desktop == "niri") {
    programs.niri = {
      enable = true;
    };
  };
}
