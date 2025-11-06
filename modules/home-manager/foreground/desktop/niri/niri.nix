{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  options.niri = {
    monitors = lib.mkOption {
      type = lib.types.str;
      description = "Monitors config";
      default = "";
    };
  };
  config = lib.mkIf (config.desktop == "niri") {
    xdg.configFile.niriconfig = {
      enable = false;
      target = "niri/config.kdl";
      text = ''
        ${config.niri.monitors}
      '';
    };
  };
}
