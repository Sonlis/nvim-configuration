{
  config,
  pkgs,
  lib,
  ...
}:
{
  config = lib.mkIf (config.desktop == "niri") {
    services = {
      mako.enable = false;
    };
    systemd.user.services.mako = {
      Install = {
        WantedBy = [ "niri" ];
      };
    };
  };
}
